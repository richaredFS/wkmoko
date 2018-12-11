package com.chenzi.home.action;

import java.util.List;
import java.util.Map;

import com.chenzi.admin.vo.Recruitinfo;
import com.chenzi.admin.vo.User;
import com.chenzi.home.service.IUserService;
import com.chenzi.home.service.impl.EnrollService;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;

public class EnrollAction extends ActionSupport{
	private static final long serialVersionUID = 1L;
	private User user;
	private Recruitinfo recruitinfo;
	protected EnrollService enrollhomeService;
	protected IUserService userhomeService;
	private int userid;
	private int comid;
	
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Recruitinfo getRecruitinfo() {
		return recruitinfo;
	}
	public void setRecruitinfo(Recruitinfo recruitinfo) {
		this.recruitinfo = recruitinfo;
	}
	public EnrollService getEnrollhomeService() {
		return enrollhomeService;
	}
	public void setEnrollhomeService(EnrollService enrollhomeService) {
		this.enrollhomeService = enrollhomeService;
	}
	public IUserService getUserhomeService() {
		return userhomeService;
	}
	public void setUserhomeService(IUserService userhomeService) {
		this.userhomeService = userhomeService;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	
	public int getComid() {
		return comid;
	}
	public void setComid(int comid) {
		this.comid = comid;
	}
	
	// 模特会员申请职位 
	public String EnrollInsertHome() throws Exception{
		System.out.println(user.getUserid()+" "+recruitinfo.getRecruitid());
		if(user.getUserid()!=null&&recruitinfo.getRecruitid()!=null){
			User u = userhomeService.getUserByuserid(user.getUserid());
			if(u!=null){
				int state = enrollhomeService.enrollInsert(user,recruitinfo);
				System.out.println(state);
				if(state>0){
					System.out.println("Yes");
					return SUCCESS;
				}
				else{
					System.out.println("No");
					return ERROR;
				}
			}
			else{
				return ERROR;
			}
		}else{
			System.out.println("No");
			return ERROR;
		}
	}
	
	// 该模特申请职位的信息
	public String enrollInfoHome() throws Exception{
		//System.out.println("EnrollAction:"+userid);
		if(userid>0){
			List<?> le = enrollhomeService.getEnrollinfoByuserid(userid);
			if(le!=null){
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("user_enrollinfos",le);
				return SUCCESS;
			}
			else{
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("user_enrollinfos",le);
				return SUCCESS;
			}	
		}
		else{
			List lr = null;
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("user_enrollinfos",lr);
			return SUCCESS;
		}
	}
	
	// 该企业收到申请的信息
	public String enrollInfoForCom() throws Exception{
		System.out.println("enrollInfoForCom:"+comid);
		if(comid>0){
			List<?> le = enrollhomeService.getEnrollinfoBycomid(comid);
			if(le!=null){
				Map request = (Map)ActionContext.getContext().get("request");
				//System.out.println(le);
				request.put("com_enrollinfos",le);
				return SUCCESS;
			}
			else{
				Map request = (Map)ActionContext.getContext().get("request");
				request.put("com_enrollinfos",le);
				return SUCCESS;
			}	
		}
		else{
			List lr = null;
			Map request = (Map)ActionContext.getContext().get("request");
			request.put("com_enrollinfos",lr);
			return SUCCESS;
		}
	}

}
