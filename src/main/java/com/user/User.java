package com.user;


import javax.persistence.Entity;
import javax.persistence.Id;

@Entity
public class User {

	@Id
	private String email;
	private String name;
	private String phone_no;
	private String password;
	private float money;
	private String address;
	
	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhone_no() {
		return phone_no;
	}

	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public float getMoney() {
		return money;
	}

	public void setMoney(float money) {
		this.money = money;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	public User() {
		super();
		// TODO Auto-generated constructor stub
	}

	public User(String email, String name, String phone_no, String password, float money, String address) {
		super();
		this.email = email;
		this.name = name;
		this.phone_no = phone_no;
		this.password = password;
		this.money = money;
		this.address = address;
	}

	@Override
	public String toString() {
		return "User [email=" + email + ", name=" + name + ", phone_no=" + phone_no + ", password=" + password
				+ ", money=" + money + ", address=" + address + "]";
	}
}
