package com.chenzi.home.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.vo.Company;
import com.chenzi.home.service.ICompanyService;
import com.chenzi.home.util.PagerDreamfactory;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Company company;
	private int comid;
	protected ICompanyService companyhomeService;
	protected Integer currentPage=1;
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public int getComid() {
		return comid;
	}

	public void setComid(int comid) {
		this.comid = comid;
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

	// 跳转企业注册页面
	public String comregisterRedirect() throws Exception{
		return SUCCESS;
	}
	
	// 跳转企业登录页面
	public String comloginRedirect() throws Exception{
		return SUCCESS;
	}
	
	// 企业会员注册
	public String companyRegester() throws Exception{
		int state = companyhomeService.companyInsert(company);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 企业会员登录
	public String companyLogin() throws Exception{
		Company u=companyhomeService.validateUser(company.getUsername(), company.getPassword());
		if(u!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("moko_company", u);
			//System.out.println(u.getUsername()+" "+u.getPassword());
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 企业会员登录注销
	public String companyLoginOut() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("moko_company");
		//session.clear();
		return SUCCESS;
	}
	
	// 企业会员个人中心，根据session存不存在企业会员来获得用户资料
	public String companyCenter() throws Exception{
		return SUCCESS;
	}
	
	// 企业会员修改企业资料编辑
	public String companyUpdateHomeEdit() throws Exception{
		return SUCCESS;
	}
	
	// 企业会员修改个人资料
	public String companyUpdateHome() throws Exception{
		Map session=ActionContext.getContext().getSession();
		session.remove("moko_company");
		//session.clear();
		Company u = companyhomeService.getCompanyBycomid(company.getComid());
		if(u!=null){
			int state = companyhomeService.companyUpdate(company);
			System.out.println(state);
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
	
	// dreamfactory梦工场
	public String dreamfactory() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = companyhomeService.getTotalCompany();
		PagerDreamfactory pager = new PagerDreamfactory(currentPage,totalSize);
		List dreamfactorys = companyhomeService.getCompanyPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("dreamfactorys",dreamfactorys);
		request.put("pager",pager);
		//System.out.println(users);
		return SUCCESS;
	}
}
