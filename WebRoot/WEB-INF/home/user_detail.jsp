<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨${home_user_detail.username}丨个人详情</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		.user_box{width:1040px;height:;margin:50px auto 0 auto;}
		.user_box h2{font-size:30px;font-weight:400;display:block;line-height:51px;}
		.user_box span{color:#999;font-size:14px;display:block;}
		.user_detail{width:1040px;height:800px;margin:50px auto 50px auto;border: 1px solid rgb(212,212,212);}
		.user_detail_top{width:100%;height:500px;background:;}
		.user_detail_top_left{width:50%;height:100%;background:;float:left;}
		.user_detail_top_left img{width:200px;height:200px;display:block;background:#f8f8f8;margin:150px auto;}
		.user_detail_top_right{width:50%;height:100%;background:;float:right;}
		.user_detail_top_right p{font-size:14px;font-weight:bold;line-height:30px;padding:20px 0px;}
	</style>
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/home/head.jsp"/>
    
    <div class="user_box">
   		<h2>${home_user_detail.username}</h2><span>所在地：${home_user_detail.address}</span>
   	</div>
    	
    <div class="user_detail">
    	<div class="user_detail_top">
    		<div class="user_detail_top_left">
    			<img src="${home_user_detail.picture}" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
    		</div>
    		<div class="user_detail_top_right">
    			<p>性别/${home_user_detail.sex}</p>
    			<p>出生日期/<s:date name="#request['home_user_detail'].birthday" format="yyyy-MM-dd" /></p>
    			<p>电子邮箱/${home_user_detail.email}</p>
    			<p>手机号码/${home_user_detail.phone}</p>
    			<p>所在地/${home_user_detail.address}</p>
    			<p>擅长/${home_user_detail.specialty}</p>
    		</div>
    	</div>
    
    </div>
    
    <div class="user_oprate">
    
    </div>
    
    <jsp:include page="/WEB-INF/home/foot.jsp"/>
  </body>
</html>
