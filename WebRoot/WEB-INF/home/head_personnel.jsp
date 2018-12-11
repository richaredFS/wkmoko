<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<link rel="stylesheet" href="/wkmoko/resource/home/css/global.css">
<style>
	.header_box_right ul li a{color:#444;}
	.header_box_right ul li .active{color:rgb(255,0,98);}
	.submit{color:#fff;background:rgb(255,0,98);}
</style>
<div class="navbar">
	<ul>
		<s:if test="#session.moko_user==null">
			<li><a href="login.jsp">模特会员登录</a></li>
		</s:if>
		<s:else>
			<li><a style="color:red;">${session.moko_user.username}&nbsp;已登录</a></li>
			<li><a style="color:red;" href="userCenter?userid=${session.moko_user.userid}">个人中心</a></li>
			<li><a href="userLoginOut">注销</a></li>
		</s:else>
		<li><a href="register.jsp">模特会员注册</a></li>
		
		<s:if test="#session.moko_company==null">
			<li><a href="comloginRedirect">企业会员登录</a></li>
		</s:if>
		<s:else>
			<li><a style="color:red;">${session.moko_company.username}&nbsp;已登录</a></li>
			<li><a style="color:red;" href="companyCenter?comid=${session.moko_company.comid}">企业中心</a></li>
			<li><a href="companyLoginOut">注销</a></li>
		</s:else>
		<li><a href="comregisterRedirect">企业会员注册</a></li>
	</ul>
</div>

<div class="header">
   	<div class="header_box">
   		<div class="header_box_left"><a href="http://localhost:8080/wkmoko/"><img src="/wkmoko/resource/home/images/nav-logo-new.png"/></a></div>
   		<div class="header_box_middle">
   			<form action="javascript:void(0)">
   				<p><input class="search" type="text" placeholder="Search MOKO..."/><input class="submit" type="submit" value="搜索"/></p>
   			</form>
   		</div>
   		<div class="header_box_right">
   			<ul>
   				<li><a href="http://localhost:8080/wkmoko/">首页</a></li>
   				<li><a href="personnel?currentPage=1" class="active">人才库</a></li>
   				<li><a href="dreamfactory?currentPage=1">梦工场</a></li>
   				<li><a href="chance?currentPage=1">机遇</a></li>  				
   			</ul>
   		</div>
   	</div>
   </div>
