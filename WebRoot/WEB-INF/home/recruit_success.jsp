<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="#request.com_recruitinfos.size>0">
	<h4>贵企业已发布的招聘信息记录如下：</h4>
	<s:iterator value="#request['com_recruitinfos']" var="com_recruitinfo">
		<div class="content_recruit">
			<div class="content_recruit_box">
				<div class="content_recruit_boxl">
		   			<div class="content_recruit_box_title">${com_recruitinfo.recruittitle}</div>
			   		<div class="content_recruit_box_t_a">
			   			<p>
			   				<b>发布日期：</b><span><s:date name="#com_recruitinfo.createat" format="yyyy-MM-dd" /></span>
			   			</p>
			   			<p>
			   				<b>工作地点：</b><span>${com_recruitinfo.address}</span>
			   			</p>
			   		</div>
			   		<div class="content_recruit_box_n_s">
			   			<p>
			   				<b>需求人数：</b><span>${com_recruitinfo.number}</span>
			   			</p>
			   			<p>
			   				<b>报酬：</b><span>￥${com_recruitinfo.salary}万/人</span>
			   			</p>
			   		</div>
			   		<div class="content_recruit_box_t_desc">
			   			<p>
			   				<b>工作详情：</b><span>${com_recruitinfo.recruitdesc}</span>
			   			</p>
			   		</div>
		   		</div>
		   	</div>
	   	</div>
	</s:iterator>
</s:if>

<s:else>
	<p class="norecruit">贵企业暂未发布招聘信息哦！赶紧发布招聘信息吧。</p>
</s:else>