<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="jsp/bsp/layout/taglib.jsp" %>
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
	<meta http-equiv="description" content="Simple">
	<script type="text/javascript" src="${ctx}/resources/js/jquery-1.8.2.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/supersized.3.2.7.min.js"></script>
	<script type="text/javascript" src="${ctx}/resources/js/supersized-init.js"></script>
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/reset.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/supersized.css">
	<link rel="stylesheet" type="text/css" href="${ctx}/resources/css/style.css">
	<style type="text/css">
	
	*{margin:0;padding:0;list-style-type:none;}
	a.mya,a.mya:visited{color:#5e5e5e; text-decoration:none;}
	a.mya:hover{color:red;text-decoration:underline;}
	
	.content {width:300px;margin:100px auto;padding:10px 20px;border:1px solid #ccc;border-radius:10px;box-shadow:0 0 30px #ccc;}
	.ipt {border:1px solid #ddd;padding:5px 5px;width:220px;outline:none;border-radius:3px;background-color:#fff;}
	.ipt:focus {background-color:#fefefe;box-shadow:0 0 3px #aaa;}
	.thead {font-family: '微软雅黑';font-size:16px;padding-bottom:20px!important;text-shadow:1px 1px 1px #fff;}
	.content th {color:#666;font-size:12px;text-shadow: 1px 1px 1px #fff;}
	.content td {padding:5px 0;}
	#submit_btn {background-color:#4797ED;border:none;border-radius:10px;box-shadow:0 0 3px #aaa;width:280px;height:30px;line-height:30px;color:#fff;font-size:14px;font-weight:bold;cursor:pointer;margin-right:0px;display:block;outline:none;text-shadow:0 1px 1px #777;}
	#submit_btn:hover {background-color:#f0f0f0;color:#666;text-shadow:1px 1px 1px #fff;}
	
    </style>
    
    <script type="text/javascript">
	jQuery.ajaxSetup({cache:false});//ajax不缓存

	//支持Enter键登录
	document.onkeydown = function(e){
		if(!e) e = window.event;
		if((e.keyCode || e.which) == 13){
			var obtnLogin=document.getElementById("submit_btn");
			obtnLogin.focus();
		}
	};

	
	$(function(){
	 $('.page-container form').submit(function(){
	        var username = $(this).find('.username').val();
	        var password = $(this).find('.password').val();
	        if(username == '') {
	            $(this).find('.error').fadeOut('fast', function(){
	                $(this).css('top', '27px');
	            });
	            $(this).find('.error').fadeIn('fast', function(){
	                $(this).parent().find('.username').focus();
	            });
	            return false;
	        }else if(password == '') {
	            $(this).find('.error').fadeOut('fast', function(){
	                $(this).css('top', '96px');
	            });
	            $(this).find('.error').fadeIn('fast', function(){
	                $(this).parent().find('.password').focus();
	            });
	            return false;
	        }else{
				$('#loginForm').submit();
			}
	    });
	});

	    $('.page-container form .username, .page-container form .password').keyup(function(){
	        $(this).parent().find('.error').fadeOut('fast');
	    });
	//返回首页
	function goBack(){
		window.location.href="${ctx}/index.jsp";
	}
	//将用户名设置到session中
	function setUserName(){
		var userName = $("#userName").val();	//隐藏域中的上级机构id，即当前机构的pId
		$.post("setUserName?userName="+userName,$("#loginForm").serializeArray(),function(data){});
	}
	</script>
	
  </head>
  <body>
	
  	</div>
  	<div class="page-container">
            <h1>晓风彩票后台管理软件</h1>
            <form id="loginForm" action="${ctx}/j_spring_security_check" method="post">
                <input type="text" name="j_username" class="username" placeholder="用户名" onblur="setUserName()">
                <input type="password" name="j_password" class="password" placeholder="密码">
                <button type="submit" id="submit">登录</button>
                <div class="error"><span>+</span></div>
            </form>
            <div class="connect">
                <p>Or connect with:</p>
                <p>
                    <a class="facebook" href=""></a>
                    <a class="twitter" href=""></a>
                </p>
            </div>
        </div>
  </body>
</html>