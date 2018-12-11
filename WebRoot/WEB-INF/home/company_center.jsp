<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨${session.moko_company.username}的企业中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		.company_box{width:1000px;height:;margin:50px auto 0 auto;}
		.company_box h2{font-size:30px;font-weight:400;display:block;}
		.company_box h2 a{padding:15px;border-radius:5px;font-size:15px;line-height:50px;background:rgb(255,0,98);color:#fff;text-decoration: none;margin:0 20px;}
		.company_box span{color:#999;font-size:14px;display:block;}
		.company_detail{width:1000px;min-height:820px;margin:50px auto 50px auto;}
		.company_detail_top{width:100%;min-height:400px;border:1px solid rgb(212,212,212);margin-bottom:10px;}
		.company_detail_bottom{width:100%;min-height:400px;border:1px solid rgb(212,212,212);margin-top:10px;}
		
		.company_detail_top h4{padding:10px 50px;font-size:15px;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
		
		.company_detail_top .content_recruit{width:100%;height:200px;position:relative;}
		.company_detail_top .content_recruit_box {width: 900px;height: 160px;position: relative;top: 40px;margin: auto;background: ;border-bottom: 1px dashed rgb(212,212,212);}
		.company_detail_top .content_recruit_boxl{width:800px;height:160px;margin}
		.company_detail_top .content_recruit_box_title{font-size:22px;font-weight:bold;line-height:26px;}
		.company_detail_top .content_recruit_box_t_a{font-size:15px;line-height:26px;}
		.company_detail_top .content_recruit_box_t_a p{width:50%;display:inline-block;float:left;}
		.company_detail_top .content_recruit_box_t_a p span{color:#aaa;}
		.company_detail_top .content_recruit_box_n_s{font-size:15px;line-height:26px;}
		.company_detail_top .content_recruit_box_n_s p{width:50%;display:inline-block;float:left;}
		.company_detail_top .content_recruit_box_n_s p span{color:#aaa;}
		.company_detail_top .content_recruit_box_t_desc{clear:both;font-size:15px;line-height:24px;}
		.company_detail_top .content_recruit_box_t_desc>p{display:-webkit-box;-webkit-box-orient:vertical;-webkit-line-clamp:3;overflow:hidden;text-overflow:ellipsis;}
		.company_detail_top .content_recruit_box_t_desc>p span{color:#aaa;}
		
		.company_detail_bottom{width:100%;height:auto;background:;margin-top:10px;border: 1px solid rgb(212,212,212);}
		.company_detail_bottom .content_enroll_box {width: 900px;min-height: 400px;position: relative;top: 0px;margin: auto;background: ;}
		.company_detail_bottom h4{padding:10px 50px;font-size:15px;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
		.company_detail_bottom p{width:100%;height:40px;border-bottom: 1px solid rgb(212,212,212);clear:both;}
		.company_detail_bottom p span{height:40px;font-size:15px;color:#aaa;line-height:40px;display:inline-block;float:left;background:;display:inline-block;float:left;}
		.company_detail_bottom p span b{color:#000;}
		.company_detail_bottom p span a{color:rgb(255,0,98);text-decoration:none;}
		.company_detail_bottom p .com_detail_bottom_1{width:45px;text-align:center;}
		.company_detail_bottom p .com_detail_bottom_2{width:135px;text-align:center;}
		.company_detail_bottom p .com_detail_bottom_3{width:200px;text-align:center;}
		.company_detail_bottom p .com_detail_bottom_4{width:280px;text-align:center;overflow: hidden;text-overflow:ellipsis;whitewhite-space: nowrap;}
		.company_detail_bottom p .com_detail_bottom_5{width:120px;text-align:center;}
		.company_detail_bottom p .com_detail_bottom_6{width:120px;text-align:center;}
		
		.norecruit{font-size:15px;height:40px;line-height:40px;text-align:center;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
		.noenroll{font-size:15px;height:40px;line-height:40px;text-align:center;font-weight:400;color: #aaa;background: #f8f8f8;border-bottom: 1px solid rgb(212,212,212);}
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
		
	    <div class="company_box">
	   		<h2>
	   			企业：${session.moko_company.comname}
	   			<a href="companyUpdateHomeEdit?comid=${session.moko_company.comid}">修改企业资料</a>
	   			<a href="recruitInsertHomeEdit?comid=${session.moko_company.comid}">发布招聘信息</a>
	   		</h2>
	   		<span>所在地：${session.moko_company.address}</span>
	   	</div>
	    <div class="company_detail">
	    	<div class="company_detail_top">
	    		<s:action name="recruitInfoHome" namespace="/" executeResult="true">
	    			<s:param name="comid">
	    				<s:property value="#session.moko_company.comid"></s:property>
	    			</s:param>
	    		</s:action>
	    	</div>
	    	
	    	<div class="company_detail_bottom">
	    		<s:action name="enrollInfoForCom" namespace="/" executeResult="true">
	    			<s:param name="comid">
	    				<s:property value="#session.moko_company.comid"></s:property>
	    			</s:param>
	    		</s:action>
	    	</div>
	    </div>
	    <div class="company_oprate">
	    </div>
	    <jsp:include page="/WEB-INF/home/foot.jsp"/>
    </s:else>
  </body>
</html>
