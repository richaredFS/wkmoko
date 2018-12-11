package com.chenzi.admin.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * User entity. @author MyEclipse Persistence Tools
 */

public class User implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String username;
	private String password;
	private Date birthday;
	private String sex;
	private String email;
	private String phone;
	private String picture;
	private String address;
	private String specialty;

	// Constructors

	/** default constructor */
	public User() {
	}

	public User(String username, String password,String email, String phone, Date birthday,String address, String specialty){
		this.username = username;
		this.password = password;
		this.birthday = birthday;
		this.email = email;
		this.phone = phone;
		this.address = address;
		this.specialty = specialty;
	}
	/** full constructor */
	public User(String username, String password, Date birthday, String sex,
			String email, String phone, String picture, String address,
			String specialty) {
		this.username = username;
		this.password = password;
		this.birthday = birthday;
		this.sex = sex;
		this.email = email;
		this.phone = phone;
		this.picture = picture;
		this.address = address;
		this.specialty = specialty;
	}

	// Property accessors

	public Integer getUserid() {
		return this.userid;
	}

	public void setUserid(Integer userid) {
		this.userid = userid;
	}

	public String getUsername() {
		return this.username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return this.password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Date getBirthday() {
		return this.birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return this.email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return this.phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPicture() {
		return this.picture;
	}

	public void setPicture(String picture) {
		this.picture = picture;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getSpecialty() {
		return this.specialty;
	}

	public void setSpecialty(String specialty) {
		this.specialty = specialty;
	}



}