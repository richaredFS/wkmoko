package com.chenzi.admin.vo;

/**
 * Auser entity. @author MyEclipse Persistence Tools
 */

public class Auser implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer userid;
	private String username;
	private String password;
	private String sex;
	private Integer weight;

	// Constructors

	/** default constructor */
	public Auser() {
	}

	/** full constructor */
	public Auser(String username, String password, String sex, Integer weight) {
		this.username = username;
		this.password = password;
		this.sex = sex;
		this.weight = weight;
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

	public String getSex() {
		return this.sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public Integer getWeight() {
		return this.weight;
	}

	public void setWeight(Integer weight) {
		this.weight = weight;
	}

}