package com.chenzi.home.dao;

import java.util.List;

import com.chenzi.admin.vo.Company;

public interface ICompanyDAO {
	public int companyInsert(Company company);
	
	public Company validateUser(String username,String password);

	public int companyUpdate(Company company);
	
	public int getTotalCompany();
	public List getCompanyPaging(Integer currentPage, int pageSize);

	public Company getCompanyBycomid(Integer comid);
}
