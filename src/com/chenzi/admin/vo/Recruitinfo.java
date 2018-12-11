package com.chenzi.admin.vo;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

/**
 * Recruitinfo entity. @author MyEclipse Persistence Tools
 */

public class Recruitinfo implements java.io.Serializable {

	// Fields

	private Integer recruitid;
	private Company company;
	private String recruittitle;
	private String recruitdesc;
	private Date createat;
	private Integer salary;
	private String address;
	private Integer number;
	private Integer recruitstate;

	// Constructors

	/** default constructor */
	public Recruitinfo() {
	}

	/** full constructor */
	public Recruitinfo(Company company, String recruittitle,String recruitdesc, Date createat, Integer salary, String address,Integer number,Integer recruitstate) {
		this.company = company;
		this.recruittitle = recruittitle;
		this.recruitdesc = recruitdesc;
		this.createat = createat;
		this.salary = salary;
		this.address = address;
		this.number = number;
		this.recruitstate = recruitstate;
	}

	// Property accessors

	public Integer getRecruitid() {
		return this.recruitid;
	}

	public void setRecruitid(Integer recruitid) {
		this.recruitid = recruitid;
	}

	public Company getCompany() {
		return this.company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public String getRecruittitle() {
		return this.recruittitle;
	}

	public void setRecruittitle(String recruittitle) {
		this.recruittitle = recruittitle;
	}

	public String getRecruitdesc() {
		return this.recruitdesc;
	}

	public void setRecruitdesc(String recruitdesc) {
		this.recruitdesc = recruitdesc;
	}

	public Date getCreateat() {
		return this.createat;
	}

	public void setCreateat(Date createat) {
		this.createat = createat;
	}

	public Integer getSalary() {
		return this.salary;
	}

	public void setSalary(Integer salary) {
		this.salary = salary;
	}

	public String getAddress() {
		return this.address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public Integer getNumber() {
		return this.number;
	}

	public void setNumber(Integer number) {
		this.number = number;
	}

	public Integer getRecruitstate() {
		return recruitstate;
	}

	public void setRecruitstate(Integer recruitstate) {
		this.recruitstate = recruitstate;
	}
	

}