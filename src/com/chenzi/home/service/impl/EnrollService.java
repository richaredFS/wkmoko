package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.admin.vo.Enrollinfo;
import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.admin.vo.User;
import com.chenzi.home.dao.IEnrollDAO;
import com.chenzi.home.service.IEnrollService;

public class EnrollService implements IEnrollService {
	private IEnrollDAO enrollhomeDAO;

	public IEnrollDAO getEnrollhomeDAO() {
		return enrollhomeDAO;
	}

	public void setEnrollhomeDAO(IEnrollDAO enrollhomeDAO) {
		this.enrollhomeDAO = enrollhomeDAO;
	}

	public int enrollInsert(User user, Recruitinfo recruitinfo) {
		return enrollhomeDAO.enrollInsert(user, recruitinfo);
	}

	public List<?> getEnrollinfoByuserid(int userid) {
		return enrollhomeDAO.getEnrollinfoByuserid(userid);
	}

	public List<?> getEnrollinfoBycomid(int comid) {
		return enrollhomeDAO.getEnrollinfoBycomid(comid);
	}
	
	
}
