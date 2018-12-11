package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.admin.vo.Company;
import com.chenzi.home.dao.ICompanyDAO;
import com.chenzi.home.service.ICompanyService;

public class CompanyService implements ICompanyService {
	private ICompanyDAO companyhomeDAO;
	
	public ICompanyDAO getCompanyhomeDAO() {
		return companyhomeDAO;
	}

	public void setCompanyhomeDAO(ICompanyDAO companyhomeDAO) {
		this.companyhomeDAO = companyhomeDAO;
	}

	@Override
	public int companyInsert(Company company) {
		return companyhomeDAO.companyInsert(company);
	}

	@Override
	public Company validateUser(String username, String password) {
		return companyhomeDAO.validateUser(username, password);
	}

	@Override
	public int companyUpdate(Company company) {
		return companyhomeDAO.companyUpdate(company);
	}

	@Override
	public int getTotalCompany() {
		return companyhomeDAO.getTotalCompany();
	}

	@Override
	public List getCompanyPaging(Integer currentPage, int pageSize) {
		return companyhomeDAO.getCompanyPaging(currentPage, pageSize);
	}

	@Override
	public Company getCompanyBycomid(Integer comid) {
		return companyhomeDAO.getCompanyBycomid(comid);
	}
	
}
