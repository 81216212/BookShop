<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>pwd.jsp</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/newlist.css'/>">	
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/jsps/js/user/pwd.js'/>"></script>
	<script src="<c:url value='/js/common.js'/>"></script>
  </head>
<style>
	    
</style>
<script type="text/javascript">
	function change(obj) {
		obj.src = "/cmj/VerifyCodeServlet?time=" + new Date().getTime();
	}
</script>  
			<main><!-- Page Banner -->
				<div class="page-banner container-fluid no-padding"><!-- Container -->
					<div class="container">
						<div class="banner-content">
							<h3>修改密码</h3>
							<p>修改您的密码！</p>
						</div>
						<ol class="breadcrumb">
							<li>
								<a title="主页" href="<c:url value='/index.jsp'/>" target="_parent">主页</a>
							</li>
							<li class="active">修改密码</li>
						</ol>
					</div><!-- Container /- -->
				</div><!-- Page Banner /- -->
				<!-- Checkout -->
			<div class="container-fluid no-left-padding no-right-padding woocommerce-checkout">
				<!-- Container -->
				<div class="container">
					<!-- Login -->
					<div class="col-md-12 col-sm-12 col-xs-12 login-block">
						<div class="login-check">
							<div class="col-md-7 col-sm-6 col-xs-6 login-form">
								<form action="<c:url value='/UserServlet'/>" method="post" target="_top">
								<input type="hidden" name="method" value="updatePassword"/>
									<div class="form-group">
										<label class="error">${msg }</label>
									</div>
									<div class="form-group">
<span>原密码: </span><input class="form-control input" autocomplete="off" type="password" placeholder="原密码 *" name="loginpass" id="loginpass" value="${user.loginpass }"/>
										<label id="loginpassError" class="error"></label>
									</div>
									<div class="form-group">
<span>新密码: </span><input class="form-control input" autocomplete="off"  placeholder="新密码 *" type="password" name="newpass" id="newpass" value="${user.newpass }"/>
										<label id="newpassError" class="error"></label>
									</div>
									<div class="form-group">
<span>确认密码: </span><input class="form-control input" autocomplete="off"  placeholder="确认密码 *" type="password" name="reloginpass" id="reloginpass" value="${user.reloginpass }"/>
										<label id="reloginpassError" class="error"></label>
									</div>
									<div class="form-group">
<span>验证码: </span><input class="form-control input" autocomplete="off"  placeholder="验证码 *" type="text" name="verifyCode" id="verifyCode" value="${user.verifyCode }"/>
										<label id="verifyCodeError" class="error"></label><br>
									 <img style="width:100px" id="vCode" src="<c:url value='/VerifyCodeServlet'/>" title="点击切换" onclick="change(this)" border="1"/>
		    	  					<a style="text-decoration: none;" href="javascript:_change();">看不清，换一张</a>
									</div>
									<input id="submit" type="submit" value="修改密码"/>
								</form>
							</div>
							
						</div>
					</div><!-- Login /- -->
				</div><!-- Container /- -->
			</div><!-- Checkout /- -->
  	</main>
</div>  

				 
	</div>
  </body>
</html>
