package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.ContactUs;

public class ContactUsUtil extends Config {

    private String Table = "contact_us";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(ContactUs obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO " + Table
                    + " (name, email, subject, message, datetime, seen) values (?, ?, ?, ?, ?, ?)");
            ps.setString(1, obj.getName());
            ps.setString(2, obj.getEmail());
            ps.setString(3, obj.getSubject());
            ps.setString(4, obj.getMessage());
            ps.setString(5, obj.getDatetime());
            ps.setInt(6, obj.getSeen());

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
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean UpdateSeen() throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE " + Table + " SET seen = 1 WHERE seen = 0");

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
    public ArrayList<ContactUs> List() throws SQLException {
        ArrayList<ContactUs> list = new ArrayList<ContactUs>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " ORDER BY id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                // name, email, subject, message, datetime, seen
                ContactUs obj = new ContactUs(rs.getInt("id"), rs.getString("name"), rs.getString("email"),
                        rs.getString("subject"), rs.getString("message"), rs.getString("datetime"), rs.getInt("seen"));
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
    public void Delete(int ID) throws SQLException {
        PreparedStatement pstmt = null;
        Connect();
        try {
            pstmt = conn.prepareStatement("DELETE FROM " + Table + " WHERE id = ?");
            pstmt.setInt(1, ID);
            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DisConnect();
            pstmt.close();
        }
    }
}
