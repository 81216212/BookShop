<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>注册页面</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/regist.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/user/templatemo-style.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/regist.js'/>"></script>
  </head>
<script type="text/javascript">
	function change(obj) {
		obj.src = "/cmj/VerifyCodeServlet?time=" + new Date().getTime();
	}
</script>
<style> 
a {
    color: black;
}
</style> 
	<body>
			<ul class="cb-slideshow">
	            <li></li>
	            <li></li>
	            <li></li>
	            <li></li>
	            <li></li>
	        </ul>
	<div class="container">
		<div class="register">
			<h2>用户登录</h2>
			<form action="<c:url value='/UserServlet'/>" method="post" id="registForm" autocomplete="off">
				<input type="hidden" name="method" value="regist"/> 
				<input class="inputClass" type="text" name="loginname" id="loginname" autocomplete="off" value="${form.loginname }" placeholder="用户名"/>
				<label class="errorClass" id="loginnameError">${errors.loginname }</label>

				<input class="inputClass" type="text" name="email" id="email" autocomplete="off" value="${form.email }" placeholder="邮箱"/>
				<label class="errorClass" id="emailError">${errors.email}</label>

				<input class="inputClass" type="password" name="loginpass" id="loginpass" autocomplete="new-password" value="${form.loginpass }" placeholder="登录密码"/>
				<label class="errorClass" id="loginpassError">${errors.loginpass }</label>

				<input class="inputClass" type="password" name="reloginpass" id="reloginpass" autocomplete="new-password" value="${form.reloginpass }" placeholder="确认密码"/>
				<label class="errorClass" id="reloginpassError">${errors.reloginpass}</label>

				<input class="inputClass" type="text" name="verifyCode" id="verifyCode" autocomplete="off" value="${form.verifyCode }" placeholder="验证码"/>
				<div>
				<img id="imgVerifyCode" src="<c:url value='/VerifyCodeServlet'/>" title="点击切换" onclick="change(this)"/>
				</div>
				<label class="errorClass" id="verifyCodeError">${errors.verifyCode}</label>
				<label class="login"><input type="submit" id="submitBtn" value="免费注册"></label>
		</div>
			</form>
			<label><a class="login" href="<c:url value='/jsps/user/login.jsp'/>" target="_parent">已有帐号?马上登录!</a></label>
			<label><a class="login" href="<c:url value='/index.jsp'/>" target="_parent">主页</a></label>
		</div>
		
	</div>
	
</body>
</html>
