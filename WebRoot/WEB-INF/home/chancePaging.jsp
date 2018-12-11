<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨机遇</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global_page.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/chance.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global.css">
  </head>
  
  <body>
  	<script type="text/javascript">
		function enroll_confirm(obj){
			var userid = document.getElementById("userid").value;
			
			if(!userid){
				alert("请登录后再申请职位！");
				return false;
			}
			
			var r=confirm("确定申请该职位吗？");
			if (r==true){
				alert("已成功申请！");
				return true;
			}
			else {
		   		alert("已取消申请！");
		   		return false;
			}
		 }
  	</script>
    <jsp:include page="/WEB-INF/home/head_chance.jsp"/>
    
	<div class="content">
		<div class="content_box">
			<h2>机遇</h2>
		</div>
		
		<div class="content_border">
		   	<s:iterator value="#request['recruits']" var="recruit">
				<div class="content_recruit">
					<div class="content_recruit_box">
				   		<div class="content_recruit_boxl">
				   			<div class="content_recruit_box_title">${recruit[1]}</div>
					   		<div class="content_recruit_box_t_a">
					   			<p>
					   				<b>公司名：</b><span>${recruit[7]}</span>
					   			</p>
					   			<p>
					   				<b>发布日期：</b><span>${recruit[2]}</span>
					   			</p>
					   			<p>
					   				<b>工作地点：</b><span>${recruit[3]}</span>
					   			</p>
					   		</div>
					   		<div class="content_recruit_box_n_s">
					   			<p>
					   				<b>需求人数：</b><span>${recruit[4]}</span>
					   			</p>
					   			<p>
					   				<b>报酬：</b><span>￥${recruit[5]}万/人</span>
					   			</p>
					   		</div>
					   		<div class="content_recruit_box_t_desc">
					   			<p>
					   				<b>工作详情：</b><span>${recruit[6]}</span>
					   			</p>
					   		</div>
				   		</div>
				   		<div class="content_recruit_boxr">
				   			<form action="EnrollInsertHome?currentPage=1" method="post" name="form">
				   				<input type="hidden" id="userid" name="user.userid" value="${session.moko_user.userid}"/>
				   				<input type="hidden" id="recruitid" name="recruitinfo.recruitid" value="${recruit[0]}"/>
				   				<input type="submit" class="submit" value="申请职位" onclick="return enroll_confirm(this.form)"/>
				   			</form>
				   		</div>
				   	</div>
				</div>
		   	</s:iterator>
	   	</div>
	</div>
	
	<div class="paging_pager">
		<div class="paging_pager_bar">
			<s:set value="#request['pager']" var="pager"/>
			<!-- 首页 -->
			<s:if test="#pager.hasFirst">
			  <a class="pager_commom" href="chance?currentPage=1">首页</a>
			</s:if>
			<s:else>
			  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">首页</a>
			</s:else>
			
			<!-- 上一页 -->
			<s:if test="#pager.hasPrevious">
				<a class="pager_commom" href="chance?currentPage=<s:property value="#pager.currentPage-1"/>">&lsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not" href="javascript:volid(0)">&lsaquo;</a>
			</s:else>
			
			<!-- 当前页 -->
			<a class="pager_commom" href="chance?currentPage=<s:property value="#pager.currentPage"/>"><s:property value="#pager.currentPage"/></a>
			
			<!-- 下一页 -->
			<s:if test="#pager.hasNext">
			  <a class="pager_commom" href="chance?currentPage=<s:property value="#pager.currentPage+1"/>">&rsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not">&rsaquo;</a>
			</s:else>
			
			<!-- 尾页 -->
			<s:if test="#pager.hasLast">
			  <a class="pager_commom" href="chance?currentPage=<s:property value="#pager.totalPage"/>">尾页</a>
			</s:if>
			<s:else>
			  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">尾页</a>
			</s:else>
			
			<span class="pager_total" href="javascript:volid(0)">共<s:property value="#pager.totalPage"/>页</span>
		</div>
	</div>

	<jsp:include page="/WEB-INF/home/foot.jsp"/>
  </body>
</html>
