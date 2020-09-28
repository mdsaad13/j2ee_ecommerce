package com.ecom.servlets.home;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.AccountUtil;
import com.ecom.modals.User;

@WebServlet("/AuthServlet")
public class AuthServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final AccountUtil accountUtil = new AccountUtil();

    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
     *      response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String Action = request.getParameter("action");

        String Email = request.getParameter("email");
        String Password = request.getParameter("password");

        if (Action.equals("login")) {
            try {
                int ID = accountUtil.UserLogin(Email, Password);
                if (ID > 0) {
                    HttpSession session = request.getSession();
                    session.setAttribute("UserID", ID);
                    response.sendRedirect("index.jsp");
                } else {
                    request.setAttribute("Email", Email);
                    request.setAttribute("message", "InvalidCreds");
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return;
        } else if (Action.equals("register")) {
            String name = request.getParameter("name");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            User user = new User(0, name, Email, Password, phone, address);

            try {
                if (accountUtil.InsertUser(user)) {
                    RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                    rd.forward(request, response);
                } else {
                    request.setAttribute("message", "RegisterFailed");
                    RequestDispatcher rd = request.getRequestDispatcher("register.jsp");
                    rd.forward(request, response);
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
            return;
        } else {
            response.sendRedirect("index.jsp");
            return;
        }
    }

}
