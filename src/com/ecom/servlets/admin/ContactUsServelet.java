package com.ecom.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.ContactUsUtil;

@WebServlet("/admin/ContactUsServelet")
public class ContactUsServelet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final String CtrlFor = "Contact us enquiry ";
    String Message = CtrlFor + "Delete Failed";
    String MessageType = "error_msg";

    final ContactUsUtil Util = new ContactUsUtil();

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
        response.sendRedirect("contact-us.jsp");
        return;
    }
}
