<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>

<s:if test="#request.com_enrollinfos.size>0">
	<h4>贵企业已收到的申请招聘记录如下：</h4>
	<div class="content_enroll_box">
		<p>
			<span class="com_detail_bottom_1"><b>姓名</b></span>
			<span class="com_detail_bottom_2"><b>手机号码</b></span>
			<span class="com_detail_bottom_3"><b>电子邮箱</b></span>
			<span class="com_detail_bottom_4"><b>应聘标题</b></span>
			<span class="com_detail_bottom_5"><b>投简日期</b></span>
			<span class="com_detail_bottom_6"><b>操作</b></span>
		</p>
		<s:iterator value="#request['com_enrollinfos']" var="com_enrollinfo">
			<p>
				<span class="com_detail_bottom_1">${com_enrollinfo[0]}</span>
				<span class="com_detail_bottom_2">${com_enrollinfo[1]}</span>
				<span class="com_detail_bottom_3">${com_enrollinfo[2]}</span>
				<span class="com_detail_bottom_4">${com_enrollinfo[3]}</span>
				<span class="com_detail_bottom_5">${com_enrollinfo[4]}</span>
				<span class="com_detail_bottom_6"><a href="">查看简历</a></span>
			</p>
		</s:iterator>
	</div>
</s:if>
<s:else>
	<p class="noenroll">贵企业暂未有伙伴前来投简哦。</p>
</s:else>