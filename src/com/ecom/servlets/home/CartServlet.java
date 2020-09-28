package com.ecom.servlets.home;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.CartUtil;
import com.ecom.dbutil.ProductsUtil;
import com.ecom.modals.Cart;

@WebServlet("/CartServlet")
public class CartServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final CartUtil Util = new CartUtil();

    final String CtrlFor = "Product ";
    String Message = CtrlFor + "Add Failed";
    String MessageType = "error_msg";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("UserID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int UserID = (int) session.getAttribute("UserID");

        String Action = request.getParameter("action");
        int ProdID = Integer.parseInt(request.getParameter("id"));

        if (Action.equals("add")) {
            try {
                Cart obj = new Cart(0, UserID, ProdID);
                ProductsUtil productsUtil = new ProductsUtil();
                if (productsUtil.GetActiveByID(ProdID).getQuantity() > 0) {
                    if (Util.Insert(obj)) {
                        Message = CtrlFor + "added to cart successfully!";
                        MessageType = "success_msg";
                    }
                } else {
                    Message = "Sorry the product you are looking for is out of stock!";
                    MessageType = "warning_msg";
                }

            } catch (Exception e) {

            }
        } else if (Action.equals("remove")) {
            try {
                Cart obj = new Cart(ProdID, UserID, 0);

                if (Util.Delete(obj)) {
                    Message = CtrlFor + "removed from cart successfully";
                    MessageType = "success_msg";
                } else {
                    Message = CtrlFor + "remove from cart failed";
                }
            } catch (Exception e) {

            }
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("cart.jsp");
        return;
    }
}
