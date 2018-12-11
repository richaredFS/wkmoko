<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO丨人才库</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" chead_dreamfactory.jspontent="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/global_page.css">
	<link rel="stylesheet" href="/wkmoko/resource/home/css/personnel.css">
  </head>
  
  <body>
    <jsp:include page="/WEB-INF/home/head_personnel.jsp"/>
    
	<div class="content">
		<div class="content_box">
			<h2>人才库</h2>
		</div>
		
		<div>
		   	<s:iterator value="#request['personnels']" var="personnel">
				<div class="content_moko">
				   	<a href="browseUser?userid=${personnel.userid}" target="_blank">
				   		<img src="${personnel.picture}" width="240" height="250" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
				   		<p>
				   			<span class="moko_span01">模特：</span><span class="moko_span02 moko_span_color"><s:property value="username"/></span><br/>
				   			<span class="moko_span01">家乡：</span><span class="moko_span02"><s:property value="address"/></span><br/>
				   			<span class="moko_span01">个性：</span><span class="moko_span02"><s:property value="specialty"/></span>
				   		</p>
					</a>
				</div>
		   	</s:iterator>
	   	</div>
	</div>
	
	<div class="paging_pager">
		<div class="paging_pager_bar">
			<s:set value="#request['pager']" var="pager"/>
			<!-- 首页 -->
			<s:if test="#pager.hasFirst">
			  <a class="pager_commom" href="personnel?currentPage=1">首页</a>
			</s:if>
			<s:else>
			  <a class="pager_commom pager_commom_not" href="javascript:volid(0)">首页</a>
			</s:else>
			
			<!-- 上一页 -->
			<s:if test="#pager.hasPrevious">
				<a class="pager_commom" href="personnel?currentPage=<s:property value="#pager.currentPage-1"/>">&lsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not" href="javascript:volid(0)">&lsaquo;</a>
			</s:else>
			
			<!-- 当前页 -->
			<a class="pager_commom" href="personnel?currentPage=<s:property value="#pager.currentPage"/>"><s:property value="#pager.currentPage"/></a>
			
			<!-- 下一页 -->
			<s:if test="#pager.hasNext">
			  <a class="pager_commom" href="personnel?currentPage=<s:property value="#pager.currentPage+1"/>">&rsaquo;</a>
			</s:if>
			<s:else>
				<a class="pager_commom pager_commom_not">&rsaquo;</a>
			</s:else>
			
			<!-- 尾页 -->
			<s:if test="#pager.hasLast">
			  <a class="pager_commom" href="personnel?currentPage=<s:property value="#pager.totalPage"/>">尾页</a>
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
