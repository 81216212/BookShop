<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
		<title>header</title>
		<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
	    	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
	<script type="text/javascript">
	$(function() {
		$.ajax({
			url:"/cmj/usernumservlet",
			data:{},
			type:"POST",
			dataType:"json",
			async:false,
			cache:false,
			success:function(result) {
				 $("#xiao").text(result);
				}
		});
	});
	
</script>
<style>
	.guan{
		line-height: 50px;
    	padding: 0 10px;
	}
</style>
	<body>
  <header class="am-topbar admin-header">
				<div class="am-topbar-brand"><img src="<c:url value='/images/logo.png'/>"></div>
				<div class="am-collapse am-topbar-collapse" >
				<span class="guan" >管理员：${sessionScope.admin.adminname }</span>
					<a class="guan" target="_top" href="<c:url value='/adminjsps/login.jsp'/>">退出</a>
					<ul class="am-nav am-nav-pills am-topbar-nav admin-header-list">
						<li class="kuanjie">
							<a href="<c:url value='/UserServlet?method=finduser'/>" target="body">用户管理
							<span style="margin-left:5px" class="am-badge am-badge-danger am-round"><p id="xiao"></p></span></a>
							<a href="<c:url value='/admin/AdminCategoryServlet?method=findAll'/>" target="body">分类管理</a>
							<a href="<c:url value='/admin/AdminBookServlet?method=findbook'/>" target="body">图书管理</a>
							<a href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>" target="body">订单管理</a>
						</li>
						<li class="soso">
						<form action="<c:url value='/BookServlet'/>" method="get" target="body" id="form1">
    	<input type="hidden" name="method" value="adminfindByBname"/>
							<p class="ycfg"><input type="text" name="bname" class="am-form-field am-input-sm" placeholder="搜索商品" /></p>
							<p><button class="am-btn am-btn-xs am-xiao"><a href="javascript:document.getElementById('form1').submit();" target="body">搜索</a></button></p>
							</form>
						</li>
						<li class="am-hide-sm-only" style="float: right;">
							<a href="<c:url value='/adminjsps/admin/book/gj.jsp'/>" target="body">多级搜索</a>
						</li>
					</ul>
				</div>
			</header>
  </body>
</html>
