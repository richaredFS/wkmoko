<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="#request.user_enrollinfos.size>0">
	<h4>你已申请的招聘职位记录如下：</h4>
	<div class="content_enroll">
		<div class="content_enroll_box">
			<p>
				<span class="user_detail_bottom_1"><b>姓名</b></span>
				<span class="user_detail_bottom_2"><b>申请职位</b></span>
				<span class="user_detail_bottom_3"><b>申请日期</b></span>
				<span class="user_detail_bottom_4"><b>公司名</b></span>
			</p>
			<s:iterator value="#request['user_enrollinfos']" var="user_enrollinfo">
				<p>
					<span class="user_detail_bottom_1">${user_enrollinfo[0]}</span>
					<span class="user_detail_bottom_2">${user_enrollinfo[1]}</span>
					<span class="user_detail_bottom_3">${user_enrollinfo[2]}</span>
					<span class="user_detail_bottom_4">${user_enrollinfo[3]}</span>
				</p>
			</s:iterator>
		</div>
	</div>
</s:if>

<s:else>
	<h4 align="center">你没有申请职位记录哦，去申请吧。</h4>
</s:else>