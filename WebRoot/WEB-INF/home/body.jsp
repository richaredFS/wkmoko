<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<div class="content">
	<div class="content_box">
		<h2>模特会员</h2>
	</div>
	
	<div>
	   	<s:iterator value="#request['home_users']" var="home_user">
			<div class="content_moko">
			   	<a href="browseUser?userid=${home_user.userid}" target="_blank">
			   		<img src="${home_user.picture}" width="240" height="250" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
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
