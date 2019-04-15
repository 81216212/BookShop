<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>main.jsp</title>
	</head>
	<style>
		body{
			margin: 0px;
			border: 0px;
			padding: 0px;
		}
	</style>
	<body>
		<iframe width="100%" height="50px" scrolling="no" frameborder="0" src="<c:url value='/adminjsps/admin/top.jsp'/>" name="top"></iframe>
		<iframe height="92.5%" width="13%" style="float:left;" scrolling="no" frameborder="0" src="<c:url value='/admin/AdminBookServlet?method=findCategoryAll'/>" name="left"></iframe>
		<iframe height="92.5%" width="87%" style="float:left;" frameborder="0" scrolling="yes" src="<c:url value='/adminjsps/admin/body.jsp'/>" name="body"></iframe>
	</body>
</html>