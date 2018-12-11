<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨梦工场</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global_page.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/dreamfactory.css">
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/home/head_dreamfactory.jsp"/>
    
	<div class="content">
		<div class="content_box">
			<h2>梦工场</h2>
		</div>
		
		<div class="content_border">
		   	<s:iterator value="#request['dreamfactorys']" var="dreamfactory">
				<div class="content_dream">
					<div class="content_dream_box">
						<div>
							<p><b>企业名称：</b><span>${dreamfactory.comname}</span></p>
							<p><b>公司所在地：</b><span>${dreamfactory.address}</span></p>
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
			  <a class="pager_commom" href="dreamfactory?currentPage=1">首页</a>
			</s:if>
			<s:else>
			  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">首页</a>
			</s:else>
			
			<!-- 上一页 -->
			<s:if test="#pager.hasPrevious">
				<a class="pager_commom" href="dreamfactory?currentPage=<s:property value="#pager.currentPage-1"/>">&lsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not" href="javascript:volid(0)">&lsaquo;</a>
			</s:else>
			
			<!-- 当前页 -->
			<a class="pager_commom" href="dreamfactory?currentPage=<s:property value="#pager.currentPage"/>"><s:property value="#pager.currentPage"/></a>
			
			<!-- 下一页 -->
			<s:if test="#pager.hasNext">
			  <a class="pager_commom" href="dreamfactory?currentPage=<s:property value="#pager.currentPage+1"/>">&rsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not">&rsaquo;</a>
			</s:else>
			
			<!-- 尾页 -->
			<s:if test="#pager.hasLast">
			  <a class="pager_commom" href="dreamfactory?currentPage=<s:property value="#pager.totalPage"/>">尾页</a>
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
