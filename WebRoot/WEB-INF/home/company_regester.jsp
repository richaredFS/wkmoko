<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>MOKO-企业会员注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<style type="text/css">
		/*初始化 start*/
		*{
			margin: 0;padding: 0;border: 0;
		}
		body{
			font-family: 微软雅黑;
			background-color: #f4f4f4;
		}
		/*初始化 end*/


		/*header start*/
		header{
			width: 100%;
			height: 180px;
			border-bottom: 1px solid #e2e2e2;
		}
		.header-left{
			width: 50%;
			height: 180px;
			float: left;
			text-align: center;
			background-image: url();
			background-size: 100%;
			background-repeat: no-repeat;
			/*text-align: center; 为对文本或者图片进行居中*/
		}
		.header-left>img{
			width: 200px;
			height: 100px;
			border-radius: 200px;
			margin-top: 20px;
		}
		.header-right{
			width: 50%;
			height: 180px;
			float: left;

		}
		.header-right>h1{
			font-weight: lighter;
			font-family: 微软雅黑;
			padding-top: 60px;
		}
		/*header end*/


		/*box start*/
		.box{
			width: 1000px;
			height: 1200px;
			margin: 0 auto;

		}
		.box-bottom{
			width: 50%;
			height: 50px;
			text-align: center;
			margin: 0 auto;
			clear: both;
			position: relative;
			/*清除box-left和-兄弟的浮动，不然你知道的*/
		}
		.box-bottom p{
			position: relative;
			top: 20px;
		}
		form{
			width:300px;
			margin:auto;
			padding:50px 100px;
			
		}
		form input{ 
			outline: none;
			font-family: 微软雅黑;
			font-size: 16px;
			transition: all .5s ease;
		}
		form input:focus {
			border-color: rgba(82, 168, 236, 0.8);
			outline: thin dotted \9;
			box-shadow: inset 0 1px 1px rgba(0, 0, 0, 0.075), 0 0 8px rgba(82, 168, 236, 0.6);
			/*margin-top: 10px;*/
		}
		.comname,.username,.password,.phone,.address{
			width: 300px;
			height: 35px;
			padding-left:1em;
		}
		form p{
			padding: 10px 0;
		}
		.reset{
			width: 80px;
			height: 35px;
			color: white;
			background-color: orange;
			cursor:pointer;
		}
		.success{
			width: 80px;
			height: 35px;
			background-color: green;
			color: white;
			cursor:pointer;
		}
		h1{color: blue;transition: ease .3s}
		h1:hover{color: red;}
		/*box end*/
	</style>

	<script language="javascript">
		function check() 
		{   
			var comname = document.getElementById("comname").value;
			var username = document.getElementById("username").value;
			var password = document.getElementById("password").value;
			var phone = document.getElementById("phone").value;
			var address = document.getElementById("address").value;
			if(comname == "") {
				alert("请输入企业名称");
				return false;
			}
			
			if(username == "") {
				alert("请输入会员账号");
				return false;
			}
			
			if(password == "") {
				alert("请输入会员密码");
				return false;
			}
			
			if(phone == "") {
				alert("请输入手机号码");
				return false;
			} 
			
			if(address == "") {
				alert("请输入公司所在地");
				return false;
			} 
			
			return true;
	}
	</script>

  </head>
  
  <body>
    <!-- header begin -->
	<header>
		<div class="header-left" >
			 <!-- <p><img src="chenziheng.jpg" width="835" height="200" /></p> -->
		</div>
		<div class="header-right">
			<h1 style="font-size: 80px" align='center'>CHENZI!</h1>
		</div>
		<div class="header-bottom">
			<p align=center ><em> </em></p>
		</div>
	</header>
	<!-- header end -->

	<!-- box begin -->
	<div class="box">
		<fieldset>
			<form action="companyRegester" method="post" anotype="multipart/form-data">
				<p><strong>企业名称:</strong></p>
				<input class="comname" id="comname" type="text" name="company.comname" size="20"/><br>
				
				<p><strong>会员账号:</strong></p>
				<input class="username" id="username" type="text" name="company.username" size="20"/><br>

				<p><strong>会员密码:</strong></p>
				<input class="password" id="password" type="password" name="company.password" size="20"/><br>
				
				<p><strong>手机号:</strong></p>
				<input class="phone" id="phone" type="text" name="company.phone" maxlength="11" size="20"/><br>
				
				<p><strong>公司所在地:</strong></p>
				<input class="address" id="address" type="text" name="company.address" size="20"/><br>

				<p>
					<a href="comloginRedirect" style="font-size: 14px;">去登陆</a>
				</p>
				<!-- <label></label> -->
				
				<br/>
				<input type="reset" class="reset" value="重置"/>
				<input type="submit" class="success" value="注册" onclick="return check()"/>
				<!-- (按登陆跳转下一个页面) -->

				<p>
					<!-- 二维码 -->
					<!-- <img src="images/705336571568498794.jpg" width="121" height="116" align="absmiddle" /> -->
				</p>
				
			</form>
		</fieldset>

		<div class="box-bottom">
			 <p>
			 	<a>关于MOKO</a>&nbsp;|&nbsp;
			 	<a>帮助中心</a>&nbsp;|&nbsp;
			 	<a>客服中心</a>&nbsp;|&nbsp;
			 </p>
		</div>
	</div>
	<!-- box end -->
  </body>
</html>
