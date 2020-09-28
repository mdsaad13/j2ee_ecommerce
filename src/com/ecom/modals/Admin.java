package com.ecom.modals;

public class Admin {
	private int ID;
	private String Name;
	private String Email;
	private String Password;
	private String Phone;

	public Admin() {
		ID = 0;
		Name = null;
		Email = null;
		Password = null;
		Phone = null;
	}

	/**
	 * 
	 * @param iD
	 * @param name
	 * @param email
	 * @param password
	 * @param phone
	 */
	public Admin(int iD, String name, String email, String password, String phone) {
		ID = iD;
		Name = name;
		Email = email;
		Password = password;
		Phone = phone;
	}

	public int getID() {
		return ID;
	}

	public void setID(int iD) {
		ID = iD;
	}

	public String getName() {
		return Name;
	}

	public void setName(String name) {
		Name = name;
	}

	public String getEmail() {
		return Email;
	}

	public void setEmail(String email) {
		Email = email;
	}

	public String getPassword() {
		return Password;
	}

	public void setPassword(String password) {
		Password = password;
	}

	public String getPhone() {
		return Phone;
	}

	public void setPhone(String phone) {
		Phone = phone;
	}

}
