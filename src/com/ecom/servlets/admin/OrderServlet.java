package com.ecom.servlets.admin;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.ecom.dbutil.OrdersUtil;
import com.ecom.dbutil.ProductsUtil;
import com.ecom.modals.Order;
import com.ecom.modals.Products;

@WebServlet("/admin/OrderServlet")
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
        int Status = Integer.parseInt(request.getParameter("status"));

        try {
            if (Util.UpdateStatus(OrderID, Status)) {
                if (Status == 4) {
                    Order order = Util.GetByID(OrderID);
                    Products product = productsUtil.GetByID(order.getProdID());
                    productsUtil.UpdateQuantity(product.getID(), product.getQuantity() + 1);
                }
                Message = CtrlFor + "updated successfully!";
                MessageType = "success_msg";
            }
        } catch (Exception e) {
            Message += e;
        }

        session.setAttribute(MessageType, Message);
        response.sendRedirect("index.jsp");
        return;
    }

}
