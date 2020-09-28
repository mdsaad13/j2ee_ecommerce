package com.ecom.servlets.admin;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.AccountUtil;
import com.ecom.modals.Admin;

/**
 * Servlet implementation class AdminSettings
 */
@WebServlet("/admin/AdminSettings")
public class AdminSettings extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		HttpSession session = request.getSession();
		int UserID = (int) session.getAttribute("AdminID");

		AccountUtil accountUtil = new AccountUtil();
		String Action = request.getParameter("action");
		String Message = "";

		if (Action.equals("changepassword")) {
			String Password = request.getParameter("password");
			String NewPassword = request.getParameter("new_password");
			Admin admin = new Admin();
			try {
				admin = accountUtil.GetAdminByID(UserID);
			} catch (SQLException e) {
				e.printStackTrace();
			}
			if (Password.equals(admin.getPassword())) {
				try {
					if (accountUtil.UpdateAdminPassword(NewPassword, UserID)) {
						Message = "PasswordChangeSuccess";
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			} else {
				Message = "IncorrectPassword";
			}
		} else if (Action.equals("update")) {
			String Name = request.getParameter("name");
			String Email = request.getParameter("email");
			String Phone = request.getParameter("phone");

			Admin admin = new Admin(UserID, Name, Email, "", Phone);
			try {
				if (accountUtil.UpdateAdmin(admin)) {
					Message = "UpdateSuccess";
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		response.sendRedirect("profile.jsp?message=" + Message);
	}

}
