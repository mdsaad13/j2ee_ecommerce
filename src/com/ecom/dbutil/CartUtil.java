package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.Cart;

public class CartUtil extends Config {

    private String Table = "cart";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(Cart obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO " + Table + " (user_id, prod_id) values (?, ?)");
            ps.setInt(1, obj.getUserID());
            ps.setInt(2, obj.getProdID());

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
    public ArrayList<Cart> List(int UserID) throws SQLException {
        ArrayList<Cart> list = new ArrayList<Cart>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " WHERE user_id = ? ORDER BY cart_id DESC");
            pstmt.setInt(1, UserID);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Cart obj = new Cart(rs.getInt("cart_id"), rs.getInt("user_id"), rs.getInt("prod_id"));
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
     * @param ID
     * @throws SQLException
     */
    public boolean Delete(Cart obj) throws SQLException {
        boolean result = false;
        PreparedStatement pstmt = null;
        Connect();
        try {
            pstmt = conn.prepareStatement("DELETE FROM " + Table + " WHERE cart_id = ? AND user_id = ?");
            pstmt.setInt(1, obj.getID());
            pstmt.setInt(2, obj.getUserID());

            int rows = pstmt.executeUpdate();

            if (rows > 0) {
                result = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DisConnect();
            pstmt.close();
        }
        return result;
    }

}
