<%@ page language="java" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="ctx" value="${pageContext.request.contextPath}"/>
<!doctype html public "-/w3c/dtd html 4.01 transitional/en" "http://www.w3.org/tr/html4/loose.dtd">

<html>
  <head>
    <title>晓风彩票管理系统</title>
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="SwimApply">
	
    <link rel="stylesheet" type="text/css" href="${ctx}/resources/css/index/login.css">
    <script type="text/javascript" src="${ctx}/resources/easyui/jquery-1.8.0.min.js"></script>
	
	<style type="text/css">
	
    </style>
    
    <script type="text/javascript">
	//将用户名设置到session中
	function setUserName(){
		var userName = $("#userName").val();	//隐藏域中的上级机构id，即当前机构的pId
		$.post("setUserName?userName="+userName,$("#loginForm").serializeArray(),function(data){});
	}
	</script>
	
  </head>
  <body style="font-size:12px; font-family:Tahoma; color:#000000; margin:0; padding:0;background:#dfdfdf;">
  	
  	<div style="border:solid 1px #dfdfdf; background:url(${ctx}/resources/image/admin/login_main_bg.jpg); width:690px;height:600px; margin-left:200px;">
  		<div style="border:solid 0px red; position:relative; margin-left:400px; margin-top:180px">
  			<form class="form-2" id="loginForm" action="${ctx}/j_spring_security_check" method="post">
				<h1><span class="log-in">登录</span></h1>
				<p class="float">
					<label for="login"><i class="icon-user"></i>用户名</label>
					<input type="text" name="j_username" placeholder="请输入用户名">
				</p>
				<p class="float">
					<label for="password"><i class="icon-lock"></i>密码</label>
					<input type="password" name="j_password" placeholder="请输入密码" class="showpassword">
				</p>
				<p class="float">用户长时间未登录，请重新登录！</p>
			</form>
  		</div>
  	</div>
  	
  </body>
</html>