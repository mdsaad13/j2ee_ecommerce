package com.ecom.dbutil;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecom.Config;
import com.ecom.modals.Admin;
import com.ecom.modals.User;

public class AccountUtil extends Config {
	/**
	 * Register user
	 * 
	 * @param users
	 * @return
	 * @throws SQLException
	 */
	public boolean InsertUser(User users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement(
					"INSERT INTO users (name, email, password, phone, address) values (?, ?, ?, ?, ?)");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPassword());
			ps.setString(4, users.getPhone());
			ps.setString(5, users.getAddress());

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
	 * Update user
	 * 
	 * @param users
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateUser(User users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn
					.prepareStatement("UPDATE users SET name = ?, email = ?, phone = ?, address = ? WHERE user_id = ?");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPhone());
			ps.setString(4, users.getAddress());
			ps.setInt(5, users.getID());

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
	 * Update user's password
	 * 
	 * @param Password
	 * @param ID
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdatePassword(String Password, int ID) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE users SET password = ? WHERE user_id = ?");
			ps.setString(1, Password);
			ps.setInt(2, ID);

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
	 * User Login
	 * 
	 * @param Email
	 * @param Password
	 * @return userid
	 * @throws SQLException
	 */
	public int UserLogin(String Email, String Password) throws SQLException {
		int ID = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE email = ? AND password = ?");
			pstmt.setString(1, Email);
			pstmt.setString(2, Password);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ID = rs.getInt("user_id");
			}

		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}

		return ID;
	}

	/**
	 * Fetch user details by id
	 * 
	 * @param ID
	 * @return Users object
	 * @throws SQLException
	 */
	public User GetUserByID(int ID) throws SQLException {
		User users = new User();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users WHERE user_id = ? ");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				users = new User(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"), rs.getString("address"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return users;
	}

	/**
	 * Fetch all users
	 * 
	 * @return ArrayList of Users objects
	 * @throws SQLException
	 */
	public ArrayList<User> AllUsers() throws SQLException {
		ArrayList<User> list = new ArrayList<User>();

		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM users ORDER BY user_id DESC");
			rs = pstmt.executeQuery();
			while (rs.next()) {
				User users = new User(rs.getInt("user_id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"), rs.getString("address"));
				list.add(users);
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return list;
	}

	/**************
	 * Admin Operations
	 **************/

	/**
	 * Admin login
	 * 
	 * @param Email
	 * @param Password
	 * @return AdminID
	 * @throws SQLException
	 */
	public int AdminLogin(String Email, String Password) throws SQLException {
		int ID = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM admin WHERE email = ? AND password = ?");
			pstmt.setString(1, Email);
			pstmt.setString(2, Password);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ID = rs.getInt("admin_id");
			}

		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}

		return ID;
	}

	/**
	 * Fetch admin details by admin id
	 * 
	 * @param ID
	 * @return Users object
	 * @throws SQLException
	 */
	public Admin GetAdminByID(int ID) throws SQLException {
		Admin users = new Admin();
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		Connect();
		try {
			pstmt = conn.prepareStatement("SELECT * FROM admin WHERE admin_id = ? ");
			pstmt.setInt(1, ID);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				users = new Admin(rs.getInt("admin_id"), rs.getString("name"), rs.getString("email"),
						rs.getString("password"), rs.getString("phone"));
			}
		} catch (Exception e) {
		} finally {
			DisConnect();
			rs.close();
			pstmt.close();
		}
		return users;
	}

	/**
	 * Change admin password
	 * 
	 * @param Password
	 * @param ID
	 * @return true/false (query exected or not)
	 * @throws SQLException
	 */
	public boolean UpdateAdminPassword(String Password, int ID) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn.prepareStatement("UPDATE admin SET password = ? WHERE admin_id = ?");
			ps.setString(1, Password);
			ps.setInt(2, ID);

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
	 * update admin details
	 * 
	 * @param users object (name, email, id)
	 * @return
	 * @throws SQLException
	 */
	public boolean UpdateAdmin(Admin users) throws SQLException {
		boolean result = false;
		Connect();
		try {
			PreparedStatement ps = conn
					.prepareStatement("UPDATE admin SET name = ?, email = ?, phone = ? WHERE admin_id = ?");
			ps.setString(1, users.getName());
			ps.setString(2, users.getEmail());
			ps.setString(3, users.getPhone());
			ps.setInt(4, users.getID());

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
