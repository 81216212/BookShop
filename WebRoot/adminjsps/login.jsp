<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>管理员登录页面</title>
		<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<script type="text/javascript">
			function checkForm() {
				if(!$("#adminname").val()) {
					alert("管理员名称不能为空！");
					return false;
				}
				if(!$("#adminpwd").val()) {
					alert("管理员密码不能为空！");
					return false;
				}
				return true;
			}
		</script>
	</head>
	<style>
		* {
			box-sizing: border-box;
		}
		
		body {
			font-family: Helvetica;
			background: #eee;
			-webkit-font-smoothing: antialiased;
		}
		
		hgroup {
			text-align: center;
			margin-top: 4em;
		}
		
		h1,
		h3 {
			font-weight: 300;
		}
		
		h1 {
			color: #636363;
		}
		
		h3 {
			color: #4a89dc;
		}
		
		form {
			width: 380px;
			margin: 4em auto;
			padding: 3em 2em 2em 2em;
			background: #fafafa;
			border: 1px solid #ebebeb;
			box-shadow: rgba(0, 0, 0, 0.14902) 0px 1px 1px 0px, rgba(0, 0, 0, 0.09804) 0px 1px 2px 0px;
		}
		
		.group {
			position: relative;
			margin-bottom: 45px;
		}
		
		input {
			font-size: 18px;
			padding: 10px 10px 10px 5px;
			-webkit-appearance: none;
			display: block;
			background: #fafafa;
			color: #636363;
			width: 100%;
			border: none;
			border-radius: 0;
			border-bottom: 1px solid #757575;
		}
		
		input:focus {
			outline: none;
		}
		
		.bar:before,
		.bar:after {
			content: '';
			height: 2px;
			width: 0;
			bottom: 1px;
			position: absolute;
			background: #4a89dc;
			transition: all 0.2s ease;
		}
		
		.bar:before {
			left: 50%;
		}
		
		.bar:after {
			right: 50%;
		}
		
		input:focus~.bar:before,
		input:focus~.bar:after {
			width: 50%;
		}
		
		.button {
			display: inline-block;
			padding: 12px 24px;
			color: #fff;
			line-height: 20px;
			background: transparent;
			transition: all 0.15s ease;
		}
		
		.buttonBlue {
			background: #4a89dc;
			text-shadow: 1px 1px 0 rgba(39, 110, 204, .5);
		}
		
		.buttonBlue:hover {
			background: #357bd8;
		}
	</style>
	<body>
		<hgroup>
			<h1>管理員界面</h1>
			<h3>只有被授權的管理員才能登錄！</h3>
		</hgroup>
		<form action="<c:url value='/AdminServlet'/>" method="post" target="_top">
			<input type="hidden" name="method" value="login" />
			<div class="group">
				<input type="text" name="adminname" id="adminname" autocomplete="off" placeholder="管理员账号"><span class="bar"></span>
			</div>
			<div class="group">
				<input type="password" name="adminpwd" id="adminpwd" autocomplete="off" placeholder="登录密码"><span class="bar"></span>
			</div>
			<p style="font-weight: 900; color: red">${msg }</p>
			<input type="submit" value="进入后台" class="button buttonBlue">
		</form>
	</body>

</html>