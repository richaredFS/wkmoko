<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${session.moko_company.comname}丨修改企业资料</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		.company_update_Edit_box form{width:100%;height:;margin:auto;padding:40px 0;}
	 	.company_update_Edit_box form p{text-align:center;margin:15px auto;}
	 	.company_update_Edit_box form p span{display:inline-block;width:100px;text-align:left;}
	 	.company_update_Edit_box form p .input{display:inline-block;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	.company_update_Edit_box form p .submit{cursor:pointer;color:#fff;background:rgb(255,0,98);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;margin-left:15px;}
	 	.company_update_Edit_box form p .submit:hover{background: rgb(182,36,31);}
	</style>
  </head>
  
  <body>    
    <s:if test="#session.moko_company==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkmoko/"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
		<div class="company_update_Edit_box">
			<form action="companyUpdateHome" method="post">
	  		<input type="hidden" class="input" name="company.comid" value="${session.moko_company.comid}"/>
	  		<p><span>企业名称：</span><input type="text" class="input" name="company.comname" value="${session.moko_company.comname}" required="required"/></p>
	  		<p><span>会员账号：</span><input type="text" class="input" name="company.username" value="${session.moko_company.username}" required="required"/></p>
	  		<p><span>会员密码：</span><input type="text" class="input"  name="company.password" value="${session.moko_company.password}" required="required"/></p>
	  		<p><span>手机号：</span><input type="text" class="input" name="company.phone" value="${session.moko_company.phone}" maxlength="11" required="required"/></p>
	  		<p><span>公司所在地：</span><input type="text" class="input" name="company.address" maxlength="20" value="${session.moko_company.address}" required="required"/></p>
	  		<p><input class="submit" type="submit" value="完成"/></p>
	  	</form>
		</div>
	</s:else>
  </body>
</html>
