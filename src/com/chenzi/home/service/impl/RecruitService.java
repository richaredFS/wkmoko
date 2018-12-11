package com.chenzi.home.service.impl;

import java.util.List;

import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.home.dao.IRecruitDAO;
import com.chenzi.home.service.IRecruitService;

public class RecruitService implements IRecruitService {

	private IRecruitDAO recruithomeDAO;
	
	public IRecruitDAO getRecruithomeDAO() {
		return recruithomeDAO;
	}

	public void setRecruithomeDAO(IRecruitDAO recruithomeDAO) {
		this.recruithomeDAO = recruithomeDAO;
	}

	@Override
	public int recruitinfoInsert(int comid, Recruitinfo recruitinfo) {
		return recruithomeDAO.recruitinfoInsert(comid, recruitinfo);
	}

	@Override
	public int getTotalRecruit() {
		return recruithomeDAO.getTotalRecruit();
	}

	@Override
	public List getRecruitPaging(Integer currentPage, int pageSize) {
		return recruithomeDAO.getRecruitPaging(currentPage,pageSize);
	}

	public List<Recruitinfo> getRecruitinfoBycomid(int comid) {
		return recruithomeDAO.getRecruitinfoBycomid(comid);
	}
	


}
