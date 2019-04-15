<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<head>
    <meta charset="UTF-8">
    <title>404!找不到页面</title>
    <link rel="stylesheet" href="<c:url value='/404/css/404.css'/>">
</head>
<body>
    <div class="container">
            <div class="text-center">
                <span class="display-1">404</span>
                <div class="mb-4">${msg }</div>
                <a target="_top" href="<c:url value='/jsps/user/login.jsp'/>">登录用户!</a><br><br>
                <a target="_top" href="<c:url value='/jsps/user/regist.jsp'/>">没有账号？注册用户!</a>
            </div>
    </div>
</body>
</html>
