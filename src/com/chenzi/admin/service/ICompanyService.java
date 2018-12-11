package com.chenzi.admin.service;

import java.util.List;
import com.chenzi.admin.vo.Company;
public interface ICompanyService {	
	public int getTotalCompany();
	public List getCompanyPaging(Integer currentPage, int pageSize);
	
	public int companyInsert(Company company);
	
	public int companyDelete(int companyid);

	public Company companyUpdateEdit(int companyid);

	public int companyUpdate(Company company);
	
	public int getTotalCompanyBykeyword(String keyword);
	public List getCompanyPagingBykeyword(String keyword, Integer currentPage,int pageSize);
	
}
