package com.chenzi.home.dao.impl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.chenzi.admin.dao.BaseDAO;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IUserDAO;

public class UserDAO extends BaseDAO implements IUserDAO{

	@Override
	public List getLimitUser() {
		Session session = getSession();
		String hql = "from User u order by userid asc";
		Query query = session.createQuery(hql);
	    query.setMaxResults(16);
		List users=query.list();
		session.close();
		return users;
	}

	@Override
	public int userInsert(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu = new User(user.getUsername(),user.getPassword(),user.getEmail(),user.getPhone(),user.getBirthday(),user.getAddress(),user.getSpecialty());
		session.save(lu);
       // session.flush();
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public User validateUser(String username,String password) {
		String sql="from User u where u.username=? and u.password=?";
		Session session=getSession();
		Query q=session.createQuery(sql);
		q.setParameter(0, username);
		q.setParameter(1, password);
		List<?> users=q.list();
		if(users.isEmpty()){
			//System.out.println("NULL");
			return null;
		}
		User u = (User)users.get(0);
		session.close();
		return u;
	}

	@Override
	public User getUserByuserid(int userid) {
		Session session = getSession();
		String hql = "from User u where u.userid=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, userid);
		List<?> users=query.list();
		if(users.isEmpty()){
			return null;
		}
		User u = (User)users.get(0);
		session.close();
		return u;
	}

	@Override
	public int userUpdate(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu =(User)session.get(User.class,user.getUserid());
		lu.setUserid(user.getUserid());
		lu.setUsername(user.getUsername());
		lu.setSex(user.getSex());
		lu.setPassword(user.getPassword());
		lu.setBirthday(user.getBirthday());
		lu.setEmail(user.getEmail());
		lu.setPhone(user.getPhone());
		lu.setSpecialty(user.getSpecialty());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public int getTotalUser() {
		Session session = getSession();
		String hql = "from User u";
		Query query = session.createQuery(hql);
		List users=query.list();
		int totalSize = users.size();
		session.close();
		return totalSize;
	}

	@Override
	public List getUserPaging(Integer currentPage, int pageSize) {
		Session session = getSession();
		String hql = "from User u";
		Query query = session.createQuery(hql);
		//	确定游标
		int startRow = (currentPage-1)*pageSize;
		query.setFirstResult(startRow);
		query.setMaxResults(pageSize);
		List users=query.list();
		session.close();
		return users;
	}

	@Override
	public int userUpdateImg(User user) {
		Session session = getSession();
		Transaction tx = session.beginTransaction();
		User lu =(User)session.get(User.class,user.getUserid());
		lu.setUserid(user.getUserid());
		lu.setPicture(user.getPicture());
        tx.commit();
        session.close();
		return 1;
	}

	@Override
	public String getUserheadimgByuserid(Integer userid) {
		Session session = getSession();
		User lu =(User)session.get(User.class,userid);
		//System.out.println(lu.getPicture());
		session.close();
		return lu.getPicture();
	}

}
