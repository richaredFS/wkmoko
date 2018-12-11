<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>${session.moko_user.username}丨头像上传</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="icon" type="image/png" sizes="32x32" href="/wkmoko/resource/admin/images/favicon.ico">
	<script type="text/javascript" src="/wkmoko/resource/home/js/jquery-3.3.1.min.js"></script>
	<script type="text/javascript" src="/wkmoko/resource/home/js/jquery.form.js"></script>
	<style type="text/css">
		body{background-color:rgb(242,238,227);}
		.userUpdateHeadImg_box{width:1000px;height:auto;background:#fff;margin:50px auto;}
		.userUpdateHeadImg_box p{padding:10px 20px}
		.userUpdateHeadImg_box>div{text-align:center;}
		.userUpdateHeadImg_box>div img{width:400px;height:400px;cursor:pointer;}
		
		#myform{}
		#myform #main input{display:none;}
		
		.userUpdateHeadImg_detail p{padding:0px 20px}
		
		.userUpdateHeadImg_form{}
		.userUpdateHeadImg_form p{height:80px;}
		.userId,.userPicture{width:100%;height:40px;line-height:40px;}
		
		.submit{cursor:pointer;color:#fff;background:rgb(255,0,98);border:0;transition:ease .3s;width: 80px;height: 40px;border-radius: 5px;font-size: 16px;}
	 	.submit:hover{background: rgb(182,36,31);}
	</style>
  </head>
  
  <body>
  	<s:if test="#session.moko_user==null">
    	<script language="javascript"type="text/javascript"> 
			alert("您的登录回话已过期，请重新登录！"); 
			window.location.href="http://localhost:8080/wkmoko/"; 
		</script>
	</s:if>
	<s:else>
		<jsp:include page="/WEB-INF/home/head.jsp"/>
		
		<div class="userUpdateHeadImg_box">
			<p>当前头像&nbsp;(<small>点击图片修改头像</small>)&nbsp;</p>
			<div>
				<s:if test="#session.moko_user_headimg==null">
    				<img src="${session.moko_user.picture}" id="previewImg" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
    			</s:if>
    			<s:else>
    				<img src="${session.moko_user_headimg}" id="previewImg" onerror="onerror=null;src='/wkmoko/resource/home/images/zwtx.png'"/>
    			</s:else>
			</div>
			
			<div id="main">
				<input id="file" type="file" name="uploadImage"/>
			</div>
			
			<div class="userUpdateHeadImg_detail">
				<span id="detail"></span>
				<!-- 显示百分比 -->
				<span id="percent"></span>
		 		<span class="bar"></span>
		 		
				<!-- 显示图片名字 -->
				<span id="filename"> </span>
				
				<!-- 显示图片 -->
				<span id="showing" > </span>
			</div>
			
			
			<!-- 确认修改头像，点击完成 -->
			<div class="userUpdateHeadImg_form">
				<form action="userUpdateHeadImg" method="post">
					<input type="hidden" class="userId" name="user.userid" value="${session.moko_user.userid}"/>
					<input id="headimg" class="userPicture" type="hidden" name="user.picture" value="${session.moko_user.picture}"/>
					<p><input class="submit" type="submit" value="完成"></p>
				</form>
			</div>
		</div>
	</s:else>

	<script type="text/javascript">
	<!--
	 $(function(){         
		var $percent=$("#percent");//获取进度百分比
		var $bar=$(".bar");//进度条
		var $showing=$("#showing");//将要显示的图片div
		var $filename=$("#filename");//上传文件名
		var $file=$("#file");//上传的文件
		var $headimg=$("#headimg");//上传文件之后表单的文件名
	   
		//动态添加form,利用wrap函数   
		$("#main").wrap("<form id='myform' method='post' enctype='multipart/form-data'></form>");
		
		//当文件改变时触发的事件
		$("#file").change(function(){ 
			//window.alert("ok");
			var $var_option={
				//写在Struts.xml中配置的对应action
				url:'postPhoto',
				//dataTpye:'json',
				//开始的上传触发的函数
				beforeSend:function(){
					$showing.empty();//图片显示设置为空
					$percent.show();//显示进度数
					var $percentVal='0%';//初始化进度
				},
				//上传过程中不断触发的函数
				uploadProgress:function(event,position,total,percentComplete){
					var $percentVal=percentComplete+'%';//percentComplete:改函数返回的进程数
					$percent.html($percentVal);
					$bar.width(percentComplete);//设置进度条view
				},
				//成功时触发的函数
				success:function(data){
					//把成功返回的字符串转成json数据；就是说要把字符串以json形式返回。
					/*
					 例如这个项目的返回信息可以这样：
					{"name":"2.png","path":"images/2.png"}
					*/
					var $data=jQuery.parseJSON(data);
	                //获取文件路径
	                var $img=$data.path;
	                
	                //动态添加标签
	                $("#detail").html("上传信息：");
	                $showing.html("<img src='"+$img+"'  style='width:100px;height:100px;'/>");
	                $filename.html($img);
	                $percent.html("上传成功");
	                $headimg.val($img);
	                $file.html($data.name);
	                $("#previewImg").prop("src",$img);
				},
				error:function(){
					$percent.html("上传失败");
				}
	         };
	         
			$("#myform").ajaxSubmit($var_option);
		});
	});
	
	
	//-->
	</script>
	
	<script type="text/javascript">
		$("#previewImg").click(function(){
			$("#file").click();
		});
	</script>
  </body>
</html>
