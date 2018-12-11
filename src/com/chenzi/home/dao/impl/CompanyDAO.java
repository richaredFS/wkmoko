package com.chenzi.home.dao.impl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Company;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.ICompanyDAO;

public class CompanyDAO extends BaseDAO implements ICompanyDAO{
	
	private Company company;
	
	public Company getCompany() {
		return company;
	}
	
	public void setCompany(Company company) {
		this.company = company;
	}
	
	@Override
	public int companyInsert(Company company) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Company cu = new Company(company.getComname(),company.getUsername(),company.getPassword(),company.getPhone(),company.getAddress());
		session.save(cu);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}
	
	@Override
	public Company validateUser(String username, String password) {
		String sql="from Company u where u.username=? and u.password=?";
		Session session=getSession();
		Query q=session.createQuery(sql);
		q.setParameter(0, username);
		q.setParameter(1, password);
		List<?> companys=q.list();
		if(companys.isEmpty()){
			System.out.println("NULL");
			return null;
		}
		Company u = (Company)companys.get(0);
		session.close();
		return u;
	}

	@Override
	public int companyUpdate(Company company) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Company lc =(Company)session.get(Company.class,company.getComid());
		lc.setComid(company.getComid());
		lc.setUsername(company.getUsername());
		lc.setPassword(company.getPassword());
		lc.setPhone(company.getPhone());
		lc.setAddress(company.getAddress());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalCompany() {
		Session session = getSession();
		String hql = "from Company c";
		Query query = session.createQuery(hql);
		List companys=query.list();
		int totalSize = companys.size();
		session.close();
		return totalSize;
	}

	@Override
	public List getCompanyPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Company c";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List companys=query.list();
		session.close();
		return companys;
	}

	@Override
	public Company getCompanyBycomid(Integer comid) {
		Session session = getSession();
		String hql = "from Company c where c.comid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, comid);
		List<?> coms=query.list();
		if(coms.isEmpty()){
			return null;
		}
		Company u = (Company)coms.get(0);
		session.close();
		return u;
	}

}
