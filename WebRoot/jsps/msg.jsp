<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title></title>

  </head>
  
  <body>
		<h1>${msg }</h1>
		<br/>
		<span style="margin-left: 50px;"><a target="_top" href="<c:url value='/jsps/user/login.jsp'/>">登录</a></span>
		<span style="margin-left: 50px;"><a target="_top" href="<c:url value='/index.jsp'/>">主页</a></span>

  </body>
</html>
