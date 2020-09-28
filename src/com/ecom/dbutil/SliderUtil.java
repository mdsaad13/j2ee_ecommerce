package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.Slider;

public class SliderUtil extends Config {

    private String Table = "slider";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(Slider obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn
                    .prepareStatement("INSERT INTO " + Table + " (title, image, redirect) values (?, ?, ?)");
            ps.setString(1, obj.getTitle());
            ps.setString(2, obj.getImage());
            ps.setString(3, obj.getRedirect());

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
    public boolean Update(Slider obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn
                    .prepareStatement("UPDATE " + Table + " SET title = ?, image = ?, redirect = ? WHERE id = ?");
            ps.setString(1, obj.getTitle());
            ps.setString(2, obj.getImage());
            ps.setString(3, obj.getRedirect());

            ps.setInt(4, obj.getID());

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
     * @param ID
     * @return
     * @throws SQLException
     */
    public Slider GetByID(int ID) throws SQLException {
        Slider obj = new Slider();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " WHERE id = ? ");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                obj = new Slider(rs.getInt("id"), rs.getString("title"), rs.getString("image"),
                        rs.getString("redirect"));
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
    public ArrayList<Slider> List() throws SQLException {
        ArrayList<Slider> list = new ArrayList<Slider>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT * FROM " + Table + " ORDER BY id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Slider obj = new Slider(rs.getInt("id"), rs.getString("title"), rs.getString("image"),
                        rs.getString("redirect"));
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
    public boolean Delete(int ID) throws SQLException {
        boolean result = false;
        PreparedStatement pstmt = null;
        Connect();
        try {
            pstmt = conn.prepareStatement("DELETE FROM " + Table + " WHERE id = ?");
            pstmt.setInt(1, ID);

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
