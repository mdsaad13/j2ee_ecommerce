package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.Categories;

public class CategoriesUtil extends Config {

    private String Table = "categories";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(Categories obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO " + Table + " (name, isactive) values (?, ?)");
            ps.setString(1, obj.getName());
            ps.setInt(2, obj.getIsActive());

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
    public boolean Update(Categories obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn
                    .prepareStatement("UPDATE " + Table + " SET name = ?, isactive = ? WHERE cat_id = ?");
            ps.setString(1, obj.getName());
            ps.setInt(2, obj.getIsActive());

            ps.setInt(3, obj.getID());

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
    public Categories GetByID(int ID) throws SQLException {
        Categories obj = new Categories();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement(
                    "SELECT categories.*, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id AND products.isactive = 1) as active_products, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id) as total_products  FROM categories WHERE cat_id = ? ");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                obj = new Categories(rs.getInt("cat_id"), rs.getString("name"), rs.getInt("isactive"),
                        rs.getInt("total_products"), rs.getInt("active_products"));
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
    public ArrayList<Categories> List() throws SQLException {
        ArrayList<Categories> list = new ArrayList<Categories>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement(
                    "SELECT categories.*, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id AND products.isactive = 1) as active_products, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id) as total_products  FROM categories ORDER BY categories.cat_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Categories obj = new Categories(rs.getInt("cat_id"), rs.getString("name"), rs.getInt("isactive"),
                        rs.getInt("total_products"), rs.getInt("active_products"));
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

    public ArrayList<Categories> ActiveList() throws SQLException {
        ArrayList<Categories> list = new ArrayList<Categories>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement(
                    "SELECT categories.*, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id AND products.isactive = 1) as active_products, (SELECT COUNT(*) FROM products WHERE categories.cat_id = products.cat_id) as total_products FROM categories WHERE categories.isactive = 1 ORDER BY cat_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Categories obj = new Categories(rs.getInt("cat_id"), rs.getString("name"), rs.getInt("isactive"),
                        rs.getInt("total_products"), rs.getInt("active_products"));
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
        PreparedStatement pstmt1 = null;
        Connect();
        try {
            pstmt = conn.prepareStatement("DELETE FROM products WHERE cat_id = ?");
            pstmt.setInt(1, ID);
            pstmt.executeUpdate();

            pstmt1 = conn.prepareStatement("DELETE FROM " + Table + " WHERE cat_id = ?");
            pstmt1.setInt(1, ID);
            pstmt1.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            DisConnect();
            pstmt.close();
        }
    }

}
