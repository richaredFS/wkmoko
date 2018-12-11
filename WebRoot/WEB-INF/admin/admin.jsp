<%@ page language="java" import="java.util.*" pageEncoding="utf8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>MOKO-后台登录中心</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<script type="text/javascript" src="/wkmoko/resource/admin/js/jquery-3.3.1.min.js"></script>
	<style type="text/css">
		*{margin:0;padding:0;border:0;}
		body{font-family:"微软雅黑";background-color:rgb(242,238,227);}
		body center{width:400px;margin:250px auto 0 auto;background-color:#fff;border:1px solid #eee;border-radius:5px;font-family: 微软雅黑;}
		body center form{width:400px;height:auto;margin:0 auto;padding:40px 0;color:#000;}
		body center form div p{padding:10px 0;height:40px;position:relative;}
		body center form div p .input{width:85%;height:40px;outline: none;text-indent:1em;font-family: 微软雅黑;font-size: 16px;border: 1px solid #ccc;}
		
		.form_title{color:#aaa;}
		
		.checkCode_Box{width:340px;height:40px;display:inline-block;margin:auto;position:relative;left:30px;}
		
		.checkCode{width:150px;height:40px;float:left;outline: none;text-indent:1em;font-family: 微软雅黑;font-size: 16px;border: 1px solid #ccc;}
		.refreshimg{border:none;outline:none;display:inline-block;line-height:40px;font-size:14px;width:130px;height:40px;float:left;background:none;cursor:pointer;}
		.refreshimg:hover{color:rgb(130,5,4);}
		.checkCode_Box img{width:60px;display:inline-block;float:right;margin:10px auto;cursor:pointer;}
		
		
		body center form div p span{width:200px;height:40px;display:inline-block;float:left;}
		body center form div p .submit{width:85%;height:40px;cursor:pointer;outline: none;color:#fff;font-family: 微软雅黑;font-size: 16px;background:rgb(182,36,31);}
		body center form input:focus {outline: thin dotted \9;border: 1px solid #ccc;}
		body center form div p .submit:hover{background: rgb(130,5,4);}
	</style>

  </head>
  
  <body>
  	<s:if test="#session.auser_active==null">
  		<center>
			    <form action="alogin" methor="post" name="form">
			    	<p class="form_title">基于SSH的娱乐人才网上招聘系统</p>
			    	<div>
				    	<p><input class="input" type="text" name="auser.username" value="" placeholder="账号" required="required"/></p>
				    	<p><input class="input" type="password" name="auser.password" value="" placeholder="密码" required="required"/></p>
				    	<p>
				    		<span class="checkCode_Box">
				    			<input class="checkCode" id="checkCode" name="checkCode" placeholder="请输入验证码" value="" type="text" required="required"/>
				    			<img id="createImage" src="createImage" onclick="refresh(this)" title="点击图片刷新验证码"/>
				    			<a class="refreshimg" onclick="refreshimg()">看不清，换一个</a>
				    		</span>
				    	</p>
				    	<p><input class="submit" type="submit" value="登录" onclick="return check()"/></p>
				    	<span id="checkCode_span"></span>
			    	</div>
			    	<script type="text/javascript">
					     function refresh(obj){
					         obj.src="createImage.action?id="+Math.random();
					     }
					     function refreshimg(){
					     var obj_img = document.getElementById("createImage");
					         obj_img.src="createImage.action?id="+Math.random();
					     }
					     
					     function check() {   
							var checkCode = document.getElementById("checkCode").value;
							if(checkCode == ""&&checkCode==null) {
								alert("请填写图形验证码");
								return false;
							}
							return true;
						}
					</script>
			    </form>
	    </center>
  	</s:if>
  	<s:else>
  		<script language="javascript"type="text/javascript"> 
			window.location.href="http://localhost:8080/wkmoko/adminManager"; 
		</script>
	</s:else>
  </body>
</html>
