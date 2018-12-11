package com.chenzi.home.dao;

import java.util.List;

import com.chenzi.admin.vo.Recruitinfo;

public interface IRecruitDAO {

	public int recruitinfoInsert(int comid, Recruitinfo recruitinfo);

	public int getTotalRecruit();
	public List getRecruitPaging(Integer currentPage, int pageSize);
	
	public List<Recruitinfo> getRecruitinfoBycomid(int comid);

}
