package com.chenzi.admin.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.dao.ICompanyDAO;
import com.chenzi.admin.vo.Company;
import com.chenzi.admin.vo.Recruitinfo;

public class CompanyDAO extends BaseDAO implements ICompanyDAO {	
	@Override
	public int getTotalCompany() {
		Session session = getSession();
		String hql = "from Company u";
		Query query = session.createQuery(hql);
		List companys=query.list();
		int totalSize = companys.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getCompanyPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Company u";
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
	public int companyDelete(int companyid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Company u =(Company)session.get(Company.class,companyid);
		
		if(u!=null){
			session.delete(u);
			String sql="from Recruitinfo r where r.company.comid=?";
			Query q=session.createQuery(sql);
			System.out.println("企业ID："+companyid);
			q.setParameter(0,companyid);
			List<?> rs=q.list();
			System.out.println(rs.isEmpty());
			if(rs.isEmpty()){
			}
			else{
				System.out.println(rs.size());
				for(int i=0;i<rs.size();i++){
					Recruitinfo r=(Recruitinfo)rs.get(i);
					r.setRecruitstate(0);
				}
			}
			tx.commit();
			session.close();
			return 1;
		}
		else{
			return 0;
		}
	}
	
	@Override
	public Company companyUpdateEdit(int companyid) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Company u =(Company)session.get(Company.class,companyid);
		session.close();
		return u;
	}

	@Override
	public int companyUpdate(Company company) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Company lu =(Company)session.get(Company.class,company.getComid());
		lu.setComid(company.getComid());
		lu.setComname(company.getComname());
		lu.setPassword(company.getPassword());
		lu.setPhone(company.getPhone());
		lu.setAddress(company.getAddress());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalCompanyBykeyword(String keyword) {
		Session session = getSession();
		String hql = "from Company u where u.comname like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		List companys=query.list();
		int totalSize = companys.size();
		session.close();
		return totalSize;
	}
	@Override
	public List getCompanyPagingBykeyword(String keyword, Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from Company u where u.comname like '%"+keyword+"%'";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List companys=query.list();
		session.close();
		return companys;
	}
	
}
