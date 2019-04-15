<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'mgs.jsp' starting page</title>

  </head>
<body>
		<div>
			<jsp:include page="/adminjsps/admin/top2.jsp" flush="true" />
			<div class="am-cf admin-main">
				<div class=" admin-content">
					<div class="daohang">
						<ul>
							<li style="margin:0px;margin-right:5px">
								<button type="button" class="am-btn am-btn-default am-radius am-btn-xs">首页</li>
        <li style="margin:0px;">
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        商品栏目管理<a href="javascript: void(0)" class="am-close am-close-spin" data-am-modal-close="">×</a>
        </button>
						</ul>
					</div>
				</div>
			</div>

			<div class="admin-biaogelist" style="background-color: #fff;">
				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">
						商品栏目管理
					</ul>
					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">会员列表</a>
					</dl>
				</div>
<h2>${msg }</h2>
<ul>
<c:forEach items="${links }" var="link">
	<li>${link }</li>
</c:forEach>
</ul>
  </body>
</html>
