package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.Formatter;
import com.ecom.modals.Order;

public class OrdersUtil extends Config {
    private String Table = "orders";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(Order obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO " + Table
                    + " (user_id, prod_id, status, created_at, updated_at) values (?, ?, ?, ?,?)");
            ps.setInt(1, obj.getUserID());
            ps.setInt(2, obj.getProdID());
            ps.setInt(3, obj.getStatus());
            ps.setString(4, obj.getCreated_at());
            ps.setString(5, obj.getUpdated_at());

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        DisConnect();
        return result;
    }

    /**
     * 
     * @return
     * @throws SQLException
     */
    public ArrayList<Order> UserList(int UserID) throws SQLException {
        ArrayList<Order> list = new ArrayList<Order>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " WHERE user_id = ? ORDER BY order_id DESC");
            pstmt.setInt(1, UserID);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Order obj = new Order(rs.getInt("order_id"), rs.getInt("user_id"), rs.getInt("prod_id"),
                        rs.getInt("status"), rs.getString("created_at"), rs.getString("updated_at"));
                list.add(obj);
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        return list;
    }

    public Order GetByID(int OrderID) throws SQLException {
        Order obj = new Order();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " WHERE order_id = ?");
            pstmt.setInt(1, OrderID);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                obj = new Order(rs.getInt("order_id"), rs.getInt("user_id"), rs.getInt("prod_id"), rs.getInt("status"),
                        rs.getString("created_at"), rs.getString("updated_at"));
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        return obj;
    }

    /**
     * 
     * @return
     * @throws SQLException
     */
    public ArrayList<Order> List() throws SQLException {
        ArrayList<Order> list = new ArrayList<Order>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " ORDER BY order_id DESC");

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Order obj = new Order(rs.getInt("order_id"), rs.getInt("user_id"), rs.getInt("prod_id"),
                        rs.getInt("status"), rs.getString("created_at"), rs.getString("updated_at"));
                list.add(obj);
            }
        } catch (Exception e) {
        } finally {
            DisConnect();
            rs.close();
            pstmt.close();
        }
        return list;
    }

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean UpdateStatus(int OrderID, int Status) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn
                    .prepareStatement("UPDATE " + Table + " SET status = ?, updated_at = ? WHERE order_id = ?");
            ps.setInt(1, Status);
            ps.setString(2, Formatter.CurrentDateTime());
            ps.setInt(3, OrderID);

            int rows = ps.executeUpdate();

            if (rows > 0) {
                result = true;
            }
            ps.close();
        } catch (Exception e) {
            e.printStackTrace();
        }

        DisConnect();
        return result;
    }

}
