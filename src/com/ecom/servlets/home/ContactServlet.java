package com.ecom.servlets.home;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.ecom.Formatter;
import com.ecom.dbutil.ContactUsUtil;
import com.ecom.modals.ContactUs;

@WebServlet("/ContactUsServelet")
public class ContactServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final ContactUsUtil Util = new ContactUsUtil();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int Result = 0;
        String Error = "";

        String Name = request.getParameter("name");
        String Email = request.getParameter("email");
        String Subject = request.getParameter("subject");
        String Message = request.getParameter("message");

        String datetime = Formatter.CurrentDateTime();
        int seen = 0;

        try {
            ContactUs obj = new ContactUs(0, Name, Email, Subject, Message, datetime, seen);
            if (Util.Insert(obj)) {
                Result = 1;
            } else
                Error = "Error Occured";

        } catch (SQLException e) {
            e.printStackTrace();
            Error = "Error Occured - " + e;
        }

        PrintWriter out = response.getWriter();
        if (Result == 1) {
            out.print("success");
        } else {
            response.setStatus(422);
            out.println(Error);
        }
        return;
    }
}
