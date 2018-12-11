<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨${session.moko_user.username}的个人中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		body{background-color:rgb(242,238,227);}
		
		.user_box{width:1000px;height:;margin:50px auto 0 auto;}
		.user_box h2{font-size:30px;font-weight:400;display:block;}
		.user_box h2 a{padding:15px;border-radius:5px;font-size:15px;line-height:50px;background:rgb(255,0,98);color:#fff;text-decoration: none;margin:0 20px;}
		.user_box span{color:#999;font-size:14px;display:block;}
		.user_detail{width:1000px;min-height:920px;margin:50px auto 50px auto;}
		.user_detail_top{width:100%;height:500px;background:#fff;margin-bottom:10px;border: 1px solid rgb(212,212,212);}
		.user_detail_top_left{width:50%;height:100%;background:;float:left;}
		.user_detail_top_left img{width:200px;height:200px;display:block;background:#f8f8f8;margin:150px auto;}
		.user_detail_top_right{width:50%;height:100%;background:;float:right;}
		.user_detail_top_right p{font-size:14px;font-weight:bold;line-height:30px;padding:20px 0px;}
		
		.user_detail_bottom{width:100%;height:auto;background:#fff;margin-top:10px;border: 1px solid rgb(212,212,212);}
		.user_detail_bottom .content_enroll{width:100%;height:auto;position:relative;}
		.user_detail_bottom .content_enroll .content_enroll_box{width: 900px;min-height: 400px;padding: 10px 0;position: relative;margin: auto;background: ;}
		.user_detail_bottom h4{padding:10px 50px;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
		.user_detail_bottom p{width:100%;height:40px;font-size:15px;clear:both;border-bottom: 1px solid rgb(212,212,212);}
		.user_detail_bottom p span{height:40px;line-height:40px;color:#aaa;display:inline-block;float:left;background:;display:inline-block;float:left;}
		.user_detail_bottom p span b{color:#000;}
		.user_detail_bottom p .user_detail_bottom_1{width:10%;text-align:left;}
		.user_detail_bottom p .user_detail_bottom_2{width:60%;}
		.user_detail_bottom p .user_detail_bottom_3{width:10%;}
		.user_detail_bottom p .user_detail_bottom_4{width:20%;text-align:center;}
		
		.noenroll{padding:10px 0px;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
	</style>
  </head>
  
  <body>
    <s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkmoko/"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
	    <div class="user_box">
	   		<h2>我的个人中心：${session.moko_user.username}<a href="userUpdateHomeEdit?userid=${session.moko_user.userid}">修改个人资料</a><a href="userUpdateHeadImgEdit">修改头像</a></h2>
	   		<span>所在地：${session.moko_user.address}</span>
	   	</div>
	    <div class="user_detail">
	    	<div class="user_detail_top">
	    		<div class="user_detail_top_left">
	    			<s:if test="#session.moko_user_headimg==null">
	    				<img src="${session.moko_user.picture}" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
	    			</s:if>
	    			<s:else>
	    				<img src="${session.moko_user_headimg}" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
	    			</s:else>
	    		</div>
	    		<div class="user_detail_top_right">
	    			<p>性别/${session.moko_user.sex}</p>
	    			<p>出生日期/<s:date name="#session.moko_user.birthday" format="yyyy-MM-dd" /></p>
	    			<p>电子邮箱/${session.moko_user.email}</p>
	    			<p>手机号码/${session.moko_user.phone}</p>
	    			<p>所在地/${session.moko_user.address}</p>
	    			<p>擅长/${session.moko_user.specialty}</p>
	    		</div>
	    	</div>
	    	<div class="user_detail_bottom">
	    		<s:action name="enrollInfoHome" namespace="/" executeResult="true">
	    			<s:param name="userid">
	    				<s:property value="#session.moko_user.userid"></s:property>
	    			</s:param>
	    		</s:action>
	    	</div>
	    </div>
	    <div class="user_oprate">
	    </div>
	    <jsp:include page="/WEB-INF/home/foot.jsp"/>
    </s:else>
  </body>
</html>
