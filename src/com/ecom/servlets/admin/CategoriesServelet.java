package com.ecom.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.CategoriesUtil;
import com.ecom.modals.Categories;

@WebServlet("/admin/CategoriesServelet")
public class CategoriesServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final String CtrlFor = "Category ";
    String Message = CtrlFor + "Add Failed";
    String MessageType = "error_msg";

    final CategoriesUtil Util = new CategoriesUtil();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        int ID = Integer.parseInt(request.getParameter("id"));

        try {
            Util.Delete(ID);
            Message = CtrlFor + "Deleted Successfully";
            MessageType = "success_msg";

        } catch (SQLException e) {
            Message = CtrlFor + "Delete Failed - " + e;
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("categories.jsp");
        return;
    }

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String Name = request.getParameter("name");
        int Status = Integer.parseInt(request.getParameter("isactive"));

        String Action = request.getParameter("action");

        try {
            if (Action.equals("add")) {
                Categories obj = new Categories(0, Name, Status);
                if (Util.Insert(obj)) {
                    Message = CtrlFor + "Added Successfully";
                    MessageType = "success_msg";
                } else
                    Message = CtrlFor + "Add Failed";

            } else if (Action.equals("update")) {
                int ID = Integer.parseInt(request.getParameter("id"));
                Categories obj = new Categories(ID, Name, Status);
                if (Util.Update(obj)) {
                    Message = CtrlFor + "Updated Successfully";
                    MessageType = "success_msg";
                } else
                    Message = CtrlFor + "Update Failed";
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("categories.jsp");
        return;
    }
}