package com.ecom.modals;

public class User {
	private int ID;
	private String Name;
	private String Email;
	private String Password;
	private String Phone;
	private String Address;

	public User() {
		ID = 0;
		Name = null;
		Email = null;
		Password = null;
		Phone = null;
		Address = null;
	}

	/**
	 * 
	 * @param iD
	 * @param name
	 * @param email
	 * @param password
	 * @param phone
	 * @param address
	 */
	public User(int iD, String name, String email, String password, String phone, String address) {
		ID = iD;
		Name = name;
		Email = email;
		Password = password;
		Phone = phone;
		Address = address;
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

	public String getAddress() {
		return Address;
	}

	public void setAddress(String address) {
		Address = address;
	}

}
