package com.chenzi.admin.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.service.ICompanyService;
import com.chenzi.admin.util.PagerCompany;
import com.chenzi.admin.vo.Company;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private Company company;
	protected ICompanyService companyService;
	
	protected Integer currentPage=1;
	private int comid;
	private String keyword;
	
	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	public ICompanyService getCompanyService() {
		return companyService;
	}

	public void setCompanyService(ICompanyService companyService) {
		this.companyService = companyService;
	}

	public Integer getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(Integer currentPage) {
		this.currentPage = currentPage;
	}

	public int getComid() {
		return comid;
	}

	public void setComid(int comid) {
		this.comid = comid;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	// 模特会员列表分页
	public String companyListPaging() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = companyService.getTotalCompany();
		PagerCompany pager = new PagerCompany(currentPage,totalSize);
		List companys = companyService.getCompanyPaging(currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("companys",companys);
		request.put("pager",pager);
		System.out.println(companys);
		return SUCCESS;
	}
	
	// 模特会员新增编辑操作
	public String companyInsertEdit() throws Exception{
		return SUCCESS;
	}
	
	// 模特会员新增操作
	public String companyInsert() throws Exception{
		int state = companyService.companyInsert(company);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 模特会员删除操作
	public String companyDelete() throws Exception{
		int state = companyService.companyDelete(this.comid);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 模特会员修改编辑操作
	public String companyUpdateEdit() throws Exception{
		Company au=companyService.companyUpdateEdit(this.comid);
		if(au!=null){
			Map session=ActionContext.getContext().getSession();
			session.put("company_update", au);
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 模特会员修改操作
	public String companyUpdate() throws Exception{
		int state = companyService.companyUpdate(company);
		System.out.println(state);
		if(state>0){
			return SUCCESS;
		}
		return ERROR;
	}
	
	// 模特会员查询操作
	public String companyQuery() throws Exception{
		System.out.println("当前页码："+currentPage);
		int totalSize = companyService.getTotalCompanyBykeyword(keyword);
		PagerCompany pager = new PagerCompany(currentPage,totalSize);
		List companys = companyService.getCompanyPagingBykeyword(keyword,currentPage, pager.getPageSize());
		Map request = (Map)ActionContext.getContext().get("request");
		request.put("companys",companys);
		request.put("pager",pager);
		System.out.println(companys);
		return SUCCESS;
	}

}
