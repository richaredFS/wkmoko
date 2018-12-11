package com.chenzi.admin.vo;

import java.util.Date;

/**
 * Article entity. @author MyEclipse Persistence Tools
 */

public class Article implements java.io.Serializable {

	// Fields

	private Integer articleid;
	private Auser auser;
	private String title;
	private String content;
	private Date createat;
	private Integer pv;

	// Constructors

	/** default constructor */
	public Article() {
	}

	/** full constructor */
	public Article(Auser auser, String title, String content, Date createat,Integer pv) {
		this.auser = auser;
		this.title = title;
		this.content = content;
		this.createat = createat;
		this.pv = pv;
	}

	// Property accessors

	public Integer getArticleid() {
		return this.articleid;
	}

	public void setArticleid(Integer articleid) {
		this.articleid = articleid;
	}

	public Auser getAuser() {
		return this.auser;
	}

	public void setAuser(Auser auser) {
		this.auser = auser;
	}

	public String getTitle() {
		return this.title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return this.content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	public Integer getPv() {
		return this.pv;
	}

	public void setPv(Integer pv) {
		this.pv = pv;
	}

}