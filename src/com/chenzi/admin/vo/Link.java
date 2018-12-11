package com.chenzi.admin.vo;

import java.util.Date;

/**
 * Link entity. @author MyEclipse Persistence Tools
 */

public class Link implements java.io.Serializable {

	private static final long serialVersionUID = 1L;
	private Integer linkid;
	private String title;
	private String domain;
	private Date createat;
	private Auser auser;

	// Constructors

	/** default constructor */
	public Link() {
	}

	/** full constructor */
	public Link(String title, String domain, Date createat, Auser auser) {
		this.auser = auser;
		this.title = title;
		this.domain = domain;
		this.createat = createat;
	}

	// Property accessors

	public Integer getLinkid() {
		return this.linkid;
	}

	public void setLinkid(Integer linkid) {
		this.linkid = linkid;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDomain() {
		return this.domain;
	}

	public void setDomain(String domain) {
		this.domain = domain;
	}

	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}
	
	public Auser getAuser() {
		return this.auser;
	}

	public void setAuser(Auser auser) {
		this.auser = auser;
	}
	
}