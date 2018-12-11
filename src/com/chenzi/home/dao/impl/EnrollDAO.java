package com.chenzi.home.dao.impl;

import java.util.Date;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.Enrollinfo;
import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IEnrollDAO;

public class EnrollDAO extends BaseDAO implements IEnrollDAO {

	@Override
	public int enrollInsert(User user, Recruitinfo recruitinfo) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		Enrollinfo eu = new Enrollinfo(user,recruitinfo,new Date());
		session.save(eu);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public List<?> getEnrollinfoByuserid(int userid) {
		Session session = getSession();
		SQLQuery query = session.createSQLQuery("SELECT User.username, Recruitinfo.recruittitle, Enrollinfo.createat, Company.comname " +
				"FROM Enrollinfo " +
				"INNER JOIN User ON Enrollinfo.userid = User.userid " +
				"INNER JOIN Recruitinfo ON Enrollinfo.recruitid = Recruitinfo.recruitid " +
				"INNER JOIN Company ON Recruitinfo.editorid = Company.comid "+
				"WHERE User.userid=?;");
		
		query.setParameter(0, userid);
		List<?> e = query.list();
		session.close();
		return e;
	}

	@Override
	public List<?> getEnrollinfoBycomid(int comid) {
		Session session = getSession();
		SQLQuery query = session.createSQLQuery("SELECT User.username, User.phone,User.email, Recruitinfo.recruittitle, " +
				"Enrollinfo.createat, Company.comname FROM Enrollinfo " +
				"INNER JOIN User ON Enrollinfo.userid = User.userid " +
				"INNER JOIN Recruitinfo ON Enrollinfo.recruitid = Recruitinfo.recruitid " +
				"INNER JOIN Company ON Recruitinfo.editorid = Company.comid " +
				"WHERE Company.comid=? "+
				"Order by Recruitinfo.createat DESC;"
				);
		
		query.setParameter(0, comid);
		List<?> enrollinfos=query.list();
		List<?> e = enrollinfos;
		System.out.println(e);
		session.close();
		return e;
	}

}
