package com.ecom;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Config {
	/**
	 * Connection string
	 */
	public Connection conn = null;

	private String Database = "jee_ecom";
	private String UserName = "root";
	private String Password = "";

	/**
	 * Establish connection to database
	 * 
	 * @throws SQLException
	 */
	public void Connect() throws SQLException {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(
					"jdbc:mysql://localhost/" + Database + "?autoReconnect=true&useSSL=false", UserName, Password);
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	/**
	 * Disconnect established connection from database
	 */
	public void DisConnect() {
		try {
			conn.close();
		} catch (Exception e) {
			/* ignored */ }
	}
}