package com.ecom.servlets.home;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.Formatter;
import com.ecom.dbutil.CartUtil;
import com.ecom.dbutil.OrdersUtil;
import com.ecom.dbutil.ProductsUtil;
import com.ecom.modals.Cart;
import com.ecom.modals.Order;
import com.ecom.modals.Products;

@WebServlet("/OrderServlet")
public class OrderServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    final OrdersUtil Util = new OrdersUtil();
    final ProductsUtil productsUtil = new ProductsUtil();

    final String CtrlFor = "Order ";
    String Message = "Error occured while processing your request";
    String MessageType = "error_msg";

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        if (session.getAttribute("UserID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int OrderID = Integer.parseInt(request.getParameter("id"));

        try {
            if (Util.UpdateStatus(OrderID, 4)) {
                Order order = Util.GetByID(OrderID);
                Products product = productsUtil.GetByID(order.getProdID());
                productsUtil.UpdateQuantity(product.getID(), product.getQuantity() + 1);
                Message = CtrlFor + "canceled successfully!";
                MessageType = "success_msg";
            }
        } catch (Exception e) {
            Message += e;
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("orders.jsp");
        return;
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        if (session.getAttribute("UserID") == null) {
            response.sendRedirect("login.jsp");
            return;
        }
        int UserID = (int) session.getAttribute("UserID");

        String Action = request.getParameter("action");
        String RetURI = request.getParameter("ret_uri");
        String CurrentDateTime = Formatter.CurrentDateTime();

        if (Action.equals("direct_checkout")) {
            try {

                int ProdID = Integer.parseInt(request.getParameter("prod_id"));

                Order obj = new Order(0, UserID, ProdID, 1, CurrentDateTime, CurrentDateTime);
                Products product = productsUtil.GetActiveByID(ProdID);
                if (product.getQuantity() > 0) {
                    if (Util.Insert(obj)) {
                        productsUtil.UpdateQuantity(ProdID, product.getQuantity() - 1);
                        Message = CtrlFor + "placed successfully!";
                        MessageType = "success_msg";
                        RetURI = "orders.jsp";
                    }
                } else {
                    Message = "Sorry the product you are looking for is out of stock!";
                    MessageType = "warning_msg";
                }

            } catch (Exception e) {
                Message += e;
            }
        } else if (Action.equals("cart_checkout")) {
            try {
                CartUtil cartUtil = new CartUtil();

                ArrayList<Cart> UserCart = cartUtil.List(UserID);

                if (UserCart.isEmpty()) {
                    Message = "Sorry your cart is empty!";
                    MessageType = "warning_msg";
                } else {
                    int CartSize = UserCart.size();
                    int InsertSize = 0;
                    for (Cart cart : UserCart) {
                        Products products = productsUtil.GetActiveByID(cart.getProdID());
                        if (products.getQuantity() > 0) {
                            Order Insertobj = new Order(0, UserID, products.getID(), 1, CurrentDateTime,
                                    CurrentDateTime);
                            Util.Insert(Insertobj);
                            cartUtil.Delete(cart);
                            InsertSize++;
                        }
                    }

                    String Return = "orders.jsp";

                    Message = CtrlFor + "placed successfully!";
                    MessageType = "success_msg";

                    if (InsertSize == 0) {
                        Message = "Sorry the products you are looking for are out of stock!";
                        MessageType = "warning_msg";
                        Return = RetURI;
                    } else if (InsertSize < CartSize) {
                        Message += " Few orders could not be placed as the were not in stock";
                    }
                    RetURI = Return;
                }

            } catch (Exception e) {
                Message += e;
            }
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect(RetURI);
        return;
    }

}
