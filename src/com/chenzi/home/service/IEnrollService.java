package com.chenzi.home.service;

import java.util.List;

import com.chenzi.admin.vo.Enrollinfo;
import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.admin.vo.User;

public interface IEnrollService {
	public int enrollInsert(User user, Recruitinfo recruitinfo);
	
	public List<?> getEnrollinfoByuserid(int userid);
	
	public List<?> getEnrollinfoBycomid(int comid);
}
