package com.chenzi.home.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.vo.Company;
import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.home.service.ICompanyService;
import com.chenzi.home.service.impl.RecruitService;
import com.chenzi.home.util.PagerRecruit;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class RecruitAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private int comid;
	private Company company;
	private Recruitinfo recruitinfo;
	protected RecruitService recruithomeService;
	protected ICompanyService companyhomeService;
	protected Integer currentPage=1;
	
	public int getComid() {
		return comid;
	}

	public void setComid(int comid) {
		this.comid = comid;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public Recruitinfo getRecruitinfo() {
		return recruitinfo;
	}

	public void setRecruitinfo(Recruitinfo recruitinfo) {
		this.recruitinfo = recruitinfo;
	}
	
	public RecruitService getRecruithomeService() {
		return recruithomeService;
	}

	public void setRecruithomeService(RecruitService recruithomeService) {
		this.recruithomeService = recruithomeService;
	}
	
	public ICompanyService getCompanyhomeService() {
		return companyhomeService;
	}

	public void setCompanyhomeService(ICompanyService companyhomeService) {
		this.companyhomeService = companyhomeService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	// 企业会员发布招聘信息编辑
	public String recruitInsertHomeEdit() throws Exception{
		return SUCCESS;
	}
	
	// 企业会员发布招聘信息
	public String recruitInsertHome() throws Exception{
		Company u = companyhomeService.getCompanyBycomid(comid);
		if(u!=null){
			if(comid>0){
				//System.out.println("Data："+comid+recruitinfo.getRecruittitle()+recruitinfo.getRecruitdesc()+recruitinfo.getSalary()+recruitinfo.getAddress()+recruitinfo.getNumber());
				int state = recruithomeService.recruitinfoInsert(comid, recruitinfo);
				if(state>0){
					return SUCCESS;
				}else{
					return ERROR;
				}
			}
			else{
				return ERROR;
			}
		}
		else{
			Map session=ActionContext.getContext().getSession();
			session.remove("moko_company");
			return ERROR;
		}
	}
	
	// chance机遇
	public String chance() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = recruithomeService.getTotalRecruit();
		PagerRecruit pager = new PagerRecruit(currentPage,totalSize);
		List recruits = recruithomeService.getRecruitPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("recruits",recruits);
		//System.out.println(recruits);
		request.put("pager",pager);
		//System.out.println(recruits);
		return SUCCESS;
	}
	
	// 企业招聘信息
	public String recruitInfoHome() throws Exception{
		// System.out.println("RecruitAction:"+comid);
		if(comid>0){
			List<Recruitinfo> lr = recruithomeService.getRecruitinfoBycomid(comid);
			if(lr!=null){
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("com_recruitinfos",lr);
				return SUCCESS;
			}
			else{
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("com_recruitinfos",lr);
				return SUCCESS;
			}	
		}
		else{
			List lr = null;
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("com_recruitinfos",lr);
			return SUCCESS;
		}
	}
	
	
}
