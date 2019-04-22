<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>图书商城</title>
		<link rel="shortcut icon" href="<c:url value='/jsps/img/logo.png'/>" type="image/x-icon" />
	</head>
<style> 
a, address, b, big, blockquote, body, center, cite, code, dd, del, div, dl, dt, em, fieldset, font, form, h1, h2, h3, h4, h5, h6, html, i, iframe, img, ins, label, legend, li, ol, p, pre, small, span, strong, u, ul, var {
    margin: 0;
    padding: 0;
}
</style> 	
	<body>
		<iframe height="170px" width="100%" scrolling="no" frameborder="0" src="<c:url value='/jsps/top.jsp'/>" name="top"></iframe>
		<iframe height="135px" width="100%" style="" scrolling="no" frameborder="0" src="<c:url value='/CategoryServlet?method=findAll'/>" name="query"></iframe>
		<iframe height="1100px" width="100%" style="" scrolling="no" frameborder="0" src="<c:url value='/jsps/body.jsp'/>" name="body"></iframe>
	</body>
</html>