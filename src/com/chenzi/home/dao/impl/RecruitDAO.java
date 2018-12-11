package com.chenzi.home.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Company;
import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.home.dao.IRecruitDAO;

public class RecruitDAO extends BaseDAO implements IRecruitDAO {
	@Override
	public int recruitinfoInsert(int comid,Recruitinfo recruitinfo) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		String sql1="from Company c where c.comid=?";
		Query q1=session.createQuery(sql1);
		q1.setParameter(0, comid);
		List<?> companys=q1.list();
		Company cu=(Company)companys.get(0);
		// System.out.println("获取到的企业对象"+cu.getUsername());
		Date date = new Date();
		if(cu!=null){
			Recruitinfo ru = new Recruitinfo(cu,recruitinfo.getRecruittitle(),recruitinfo.getRecruitdesc(),date,recruitinfo.getSalary(),recruitinfo.getAddress(),recruitinfo.getNumber(),1);
			session.save(ru);
		}else{
			return 0;
		}
		
		// session.flush();
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalRecruit() {
		Session session = getSession();
		Query query = session.createSQLQuery("SELECT Recruitinfo.recruittitle, Recruitinfo.createat, Recruitinfo.address, Recruitinfo.number,	Recruitinfo.salary, Recruitinfo.recruitdesc, Company.comname FROM Recruitinfo INNER JOIN Company ON Recruitinfo.editorid = Company.comid Order by Recruitinfo.createat DESC;");
		List rs=query.list();
		int totalSize = rs.size();
		session.close();
		return totalSize;
	}

	@Override
	public List getRecruitPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		// String hql = "from Recruitinfo r Order by r.createat DESC";
		// Query query = session.createQuery(hql);
		// query.setFirstResult(startRow);
		// query.setMaxResults(pageSize);
		
//		确定游标 ，start为起始地址，pageSize为返回记录大小，limit分页，order by时间排序
		int startRow = (currentPage-1)*pageSize;
		Query query = session.createSQLQuery("SELECT Recruitinfo.recruitid, Recruitinfo.recruittitle, Recruitinfo.createat, Recruitinfo.address, " +
				"Recruitinfo.number, Recruitinfo.salary, Recruitinfo.recruitdesc, Company.comname " +
				"FROM Recruitinfo " +
				"INNER JOIN Company ON Recruitinfo.editorid = Company.comid " +
				"Order by Recruitinfo.createat DESC Limit "+startRow+" , "+pageSize+";");
		
		List rs=query.list();
		session.close();
		return rs;
	}

	@Override
	public List getRecruitinfoBycomid(int comid) {
		//System.out.println("RecruitDAO:"+comid);
		Session session = getSession();
		String hql = "from Recruitinfo where editorid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, comid);
		List<Recruitinfo> recruitinfos=query.list();
		// System.out.println("RecruitDAO:"+recruitinfos);
		List<Recruitinfo> r = recruitinfos;
		//System.out.println(r);
		session.close();
		return r;
	}
}
