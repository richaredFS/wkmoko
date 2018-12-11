package com.chenzi.admin.service.impl;

import java.util.List;
import com.chenzi.admin.dao.ICompanyDAO;
import com.chenzi.admin.service.ICompanyService;
import com.chenzi.admin.vo.Company;

public class CompanyService implements ICompanyService {
	private ICompanyDAO companyDAO;
	
	public ICompanyDAO getCompanyDAO() {
		return companyDAO;
	}
	public void setCompanyDAO(ICompanyDAO companyDAO) {
		this.companyDAO = companyDAO;
	}
	
	@Override
	public int getTotalCompany() {
		return companyDAO.getTotalCompany();
	}
	
	@Override
	public List getCompanyPaging(Integer currentPage, int pageSize) {
		return companyDAO.getCompanyPaging(currentPage, pageSize);
	}
	
	@Override
	public int companyInsert(Company company) {
		return companyDAO.companyInsert(company);
	}
	
	@Override
	public int companyDelete(int companyid) {
		return companyDAO.companyDelete(companyid);
	}
	
	@Override
	public Company companyUpdateEdit(int companyid) {
		return companyDAO.companyUpdateEdit(companyid);
	}
	
	@Override
	public int companyUpdate(Company company) {
		return companyDAO.companyUpdate(company);
	}
	
	@Override
	public int getTotalCompanyBykeyword(String keyword) {
		return companyDAO.getTotalCompanyBykeyword(keyword);
	}
	
	@Override
	public List getCompanyPagingBykeyword(String keyword, Integer currentPage,int pageSize) {
		return companyDAO.getCompanyPagingBykeyword(keyword,currentPage,pageSize);
	}
		

	
	
	

}
