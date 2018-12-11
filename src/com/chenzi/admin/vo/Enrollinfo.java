package com.chenzi.admin.vo;

import java.util.Date;

/**
 * Enrollinfo entity. @author MyEclipse Persistence Tools
 */

public class Enrollinfo implements java.io.Serializable {

	// Fields

	private Integer enrollid;
	private User user;
	private Recruitinfo recruitinfo;
	private Date createat;

	// Constructors

	/** default constructor */
	public Enrollinfo() {
	}

	/** full constructor */
	public Enrollinfo(User user, Recruitinfo recruitinfo,Date createat) {
		this.user = user;
		this.recruitinfo = recruitinfo;
		this.createat = createat;
	}

	// Property accessors

	public Integer getEnrollid() {
		return this.enrollid;
	}

	public void setEnrollid(Integer enrollid) {
		this.enrollid = enrollid;
	}

	public User getUser() {
		return this.user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Recruitinfo getRecruitinfo() {
		return this.recruitinfo;
	}

	public void setRecruitinfo(Recruitinfo recruitinfo) {
		this.recruitinfo = recruitinfo;
	}

	public Date getCreateat() {
		return createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}
	

}