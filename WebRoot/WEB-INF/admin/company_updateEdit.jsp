<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO-后台管理中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		*{margin:0;padding:0;border:0;}
		body{width:100%;height: 100%;background-color: #F3F5F8;font-family:"微软雅黑";}
		a{text-decoration: none;}	
		
		.admin_nav{width:100%;min-width:1400px;height:80px;line-height:80px;background:#fff;box-shadow: 1px 2px 3px rgba(0, 0, 0, 0.1);color:#000;position:fixed;z-index:4;}
		.admin_nav>a{height:80px;display:inline-block;color:#000;text-decoration: none;transition:all ease .5s;}
		.admin_nav>a:hover{background: rgb(130,5,4);}
		.admin_nav .admin_nav_l{width:15%;float:left;text-align:center;transition:all ease .5s;font-size:20px;}
		
		.admin_nav .admin_nav_m{padding: 0 20px;float:right;font-size:15px;}
		.admin_nav .admin_nav_r{width:120px;height:40px;margin:20px 20px 0 0;line-height:40px;background:rgb(182,36,31);float:right;text-align:center;color:#fff;border-radius:5px;}
		.admin_box{display:none;width:200px;height:300px;background: rgba(130,5,4,.5);}
		.admin_nav .admin_nav_l:hover .admin_box{display:block}
		.admin_nav .admin_nav_m span a{color:#666;}
		
	 	.admin_body{width:1000px;height:;margin:auto;position:relative;top:100px;background:#fff;padding:0 0 100px 0;}
	 	.admin_body h4{width:;background:#fff;line-height:50px;text-indent:50px;display:block;font-size:16px;font-weight:400;border-bottom: 1px solid #e2e2e2;}
	 	form{width:100%;height:;margin:auto;padding:40px 0;}
	 	form p{text-align:center;margin:15px auto;}
	 	form p span{display:inline-block;width:100px;text-align:left;}
	 	form p .input{display:inline-block;line-height:40px;text-indent:1em;width:800px;height:40px;border:1px solid #aaa;outline:none;font-size: 16px;}
	 	form p .submit{cursor:pointer;color:#fff;background:rgb(182,36,31);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;margin-left:15px;}
	 	form p .submit:hover{background: rgb(130,5,4);}
	 	.date{text-indent:0em;padding: 0.5em 0;}
	</style>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/admin/global_nav.jsp"/>
    
    <div class="admin_body">
  		<h4>后台中心&nbsp;&rsaquo;&rsaquo;&nbsp;企业会员&nbsp;&rsaquo;&rsaquo;&nbsp;修改企业会员</h4>
	  	<form action="companyUpdate" method="post">
	  		<input type="hidden" class="input" name="company.comid" value="${company_update.comid}"/>
	  		<p><span>公司名称：</span><input type="text" class="input" name="company.comname" value="${company_update.comname}" required="required"/></p>
	  		<p><span>会员账号：</span><input type="text" class="input" name="company.username" value="${company_update.username}" required="required"/></p>
	  		<p><span>会员密码：</span><input type="text" class="input"  name="company.password" value="${company_update.password}" required="required"/></p>
	  		<p><span>用户手机：</span><input type="text" class="input" name="company.phone" maxlength="11" value="${company_update.phone}" required="required"/></p>
	  		<p><span>用户地址：</span><input type="text" class="input" name="company.address" value="${company_update.address}" required="required"/></p>
	  		<p><input class="submit" type="submit" value="完成"/></p>
	  	</form>
  	</div>
    
  </body>
</html>
