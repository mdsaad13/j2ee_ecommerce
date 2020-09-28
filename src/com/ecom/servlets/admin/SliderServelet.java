package com.ecom.servlets.admin;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;

import com.ecom.Environment;
import com.ecom.dbutil.SliderUtil;
import com.ecom.modals.Slider;

@WebServlet("/admin/SliderServelet")
public class SliderServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final String CtrlFor = "Slider ";
    String Message = CtrlFor + "Add Failed";
    String MessageType = "error_msg";

    final String UPLOAD_DIRECTORY = Environment._InstalledDirectory + "\\WebContent\\images\\slider";

    final SliderUtil Util = new SliderUtil();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int ID = Integer.parseInt(request.getParameter("id"));

        String Img = null;
        try {
            Img = Util.GetByID(ID).getImage();
        } catch (Exception e) {
        }

        try {
            if (Util.Delete(ID)) {
                Message = CtrlFor + "Deleted Successfully";
                MessageType = "success_msg";
                File file = new File(UPLOAD_DIRECTORY + File.separator + Img);
                file.delete();
            } else
                Message = CtrlFor + "Delete Failed";
        } catch (SQLException e) {
            Message = CtrlFor + "Delete Failed - " + e;
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("slider.jsp");
        return;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        String Action = null;

        int ID = 0;
        String Title = "";
        String Image = "";
        String Redirect = "";

        String filename = "";
        String oldimg = null;

        if (ServletFileUpload.isMultipartContent(request)) {
            try {
                final List<FileItem> multiparts = new ServletFileUpload(new DiskFileItemFactory())
                        .parseRequest(request);
                for (final FileItem item : multiparts) {
                    if (item.isFormField()) {

                        if (item.getFieldName().equalsIgnoreCase("action")) {
                            Action = item.getString();
                        }

                        if (item.getFieldName().equalsIgnoreCase("id")) {
                            ID = Integer.parseInt(item.getString());
                        }
                        if (item.getFieldName().equalsIgnoreCase("title")) {
                            Title = item.getString();
                        }
                        if (item.getFieldName().equalsIgnoreCase("redirect")) {
                            Redirect = item.getString();
                        }

                        if (item.getFieldName().equalsIgnoreCase("old_img")) {
                            oldimg = item.getString();
                        }
                    } else {
                        final String FormFileName = new File(item.getName()).getName();
                        if (FormFileName.length() > 0) {
                            filename = UUID.randomUUID().toString() + '_' + FormFileName;
                            item.write(new File(UPLOAD_DIRECTORY + File.separator + filename));
                        }
                    }
                }
            } catch (Exception ex) {
            }
        }

        if (filename == null || filename.equals("") && Action.equals("update")) {
            Image = oldimg;
        } else {
            Image = filename;
        }

        Slider obj = new Slider(ID, Title, Image, Redirect);

        if (Action.equals("add")) {
            try {
                if (Util.Insert(obj)) {
                    Message = CtrlFor + "Added Successfully";
                    MessageType = "success_msg";
                } else
                    Message = CtrlFor + "Add Failed";
            } catch (final SQLException e) {
                e.printStackTrace();
            }
        } else if (Action.equals("update")) {
            try {
                if (Util.Update(obj)) {
                    Message = CtrlFor + "Updated Successfully";
                    MessageType = "success_msg";
                } else
                    Message = CtrlFor + "Update Failed";
            } catch (final SQLException e) {
                e.printStackTrace();
            }
        }
        session.setAttribute(MessageType, Message);

        response.sendRedirect("slider.jsp");
        return;
    }
}