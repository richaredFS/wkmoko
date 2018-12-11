package com.chenzi.home.service;

import java.util.List;

import com.chenzi.admin.vo.Recruitinfo;

public interface IRecruitService {
	
	public int recruitinfoInsert(int comid, Recruitinfo recruitinfo);
	
	public int getTotalRecruit();
	public List getRecruitPaging(Integer currentPage, int pageSize);
	
	public List<Recruitinfo> getRecruitinfoBycomid(int comid);
	
}
