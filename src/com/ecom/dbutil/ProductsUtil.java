package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.Products;

public class ProductsUtil extends Config {
    private String Table = "products";

    /**
     * 
     * @param obj
     * @return
     * @throws SQLException
     */
    public boolean Insert(Products obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("INSERT INTO " + Table
                    + " (cat_id, title, description, image, isactive, isfeatured, quantity, price) values (?, ?, ?, ?, ?, ?, ?, ?)");
            ps.setInt(1, obj.getCatID());
            ps.setString(2, obj.getTitle());
            ps.setString(3, obj.getDescription());
            ps.setString(4, obj.getImage());
            ps.setInt(5, obj.getIsActive());
            ps.setInt(6, obj.getIsFeatured());
            ps.setInt(7, obj.getQuantity());
            ps.setDouble(8, obj.getPrice());

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
    public boolean Update(Products obj) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE " + Table
                    + " SET cat_id = ?, title = ?, description = ?, image = ?, isactive = ?, isfeatured = ?, quantity = ?, price = ? WHERE prod_id = ?");
            ps.setInt(1, obj.getCatID());
            ps.setString(2, obj.getTitle());
            ps.setString(3, obj.getDescription());
            ps.setString(4, obj.getImage());
            ps.setInt(5, obj.getIsActive());
            ps.setInt(6, obj.getIsFeatured());
            ps.setInt(7, obj.getQuantity());
            ps.setDouble(8, obj.getPrice());

            ps.setInt(9, obj.getID());

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

    public boolean UpdateQuantity(int ProdID, int Quantity) throws SQLException {
        boolean result = false;
        Connect();
        try {
            PreparedStatement ps = conn.prepareStatement("UPDATE " + Table + " SET quantity = ? WHERE prod_id = ?");
            ps.setInt(1, Quantity);
            ps.setInt(2, ProdID);

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
    public Products GetByID(int ID) throws SQLException {
        Products obj = new Products();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id WHERE prod_id = ? ");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
     * @param ID
     * @return
     * @throws SQLException
     */
    public Products GetActiveByID(int ID) throws SQLException {
        Products obj = new Products();
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id WHERE prod_id = ? AND "
                    + Table + ".isactive = 1");
            pstmt.setInt(1, ID);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
     * @param ID
     * @return
     * @throws SQLException
     */
    public ArrayList<Products> GetByCatID(int ID) throws SQLException {
        ArrayList<Products> list = new ArrayList<Products>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id WHERE " + Table
                    + ".cat_id = ? AND " + Table + ".isactive = 1 ");
            pstmt.setInt(1, ID);

            rs = pstmt.executeQuery();
            while (rs.next()) {
                Products obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
     * @return
     * @throws SQLException
     */
    public ArrayList<Products> FeaturedProducts() throws SQLException {
        ArrayList<Products> list = new ArrayList<Products>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id WHERE " + Table
                    + ".isfeatured = 1 AND " + Table + ".isactive = 1 ORDER BY prod_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Products obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
     * @return
     * @throws SQLException
     */
    public ArrayList<Products> List() throws SQLException {
        ArrayList<Products> list = new ArrayList<Products>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id ORDER BY prod_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Products obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
     * @return
     * @throws SQLException
     */
    public ArrayList<Products> ActiveList() throws SQLException {
        ArrayList<Products> list = new ArrayList<Products>();

        PreparedStatement pstmt = null;
        ResultSet rs = null;

        Connect();
        try {
            pstmt = conn.prepareStatement("SELECT " + Table + ".*, categories.name as category FROM " + Table
                    + " INNER JOIN categories on categories.cat_id = " + Table + ".cat_id AND " + Table
                    + ".isactive = 1 ORDER BY prod_id DESC");
            rs = pstmt.executeQuery();
            while (rs.next()) {
                Products obj = new Products(rs.getInt("prod_id"), rs.getInt("cat_id"), rs.getString("title"),
                        rs.getString("description"), rs.getString("image"), rs.getInt("isactive"),
                        rs.getInt("isfeatured"), rs.getInt("quantity"), rs.getDouble("price"),
                        rs.getString("category"));
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
            pstmt = conn.prepareStatement("DELETE FROM " + Table + " WHERE prod_id = ?");
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
