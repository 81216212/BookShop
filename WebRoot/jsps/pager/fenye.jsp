<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>分页</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">

		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list2.css'/>">
		<script type="text/javascript" src="<c:url value='/jsps/new/js/jquery.min.js'/>"></script>
		<script type="text/javascript" src="<c:url value='/jsps/new/js/lib.js'/>"></script>
	</head>
	<style>
	</style>

	<body>
		<nav class="ow-pagination">
			<ul class="pager">
				<c:choose>
					<c:when test="${pb.pc eq 1 }">
						<li><i class="zi" style="float:left">首页</i></li>
					</c:when>
					<c:otherwise>
						<li>
							<a style="float: left;border:0px;" href="${pb.url }&pc=1"><i style="font-style: normal;">首页</i></a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pb.pc eq 1 }">
						<li><i class="zi" style="float:left"><</i></li>
					</c:when>
					<c:otherwise>
						<li>
							<a style="float: left;border:0px;" href="${pb.url }&pc=${pb.pc-1}"><i><</i></a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pb.tp <= 6 }">
						<c:set var="begin" value="1" />
						<c:set var="end" value="${pb.tp }" />
					</c:when>
					<c:otherwise>
						<c:set var="begin" value="${pb.pc-2 }" />
						<c:set var="end" value="${pb.pc + 3}" />
						<c:if test="${begin < 1 }">
							<c:set var="begin" value="1" />
							<c:set var="end" value="6" />
						</c:if>
						<c:if test="${end > pb.tp }">
							<c:set var="begin" value="${pb.tp-5 }" />
							<c:set var="end" value="${pb.tp }" />
						</c:if>
					</c:otherwise>
				</c:choose>

				<li>
					<a style="float:right;border:0px;" href="javascript:_go();" class="aSubmit">确定</a>
				</li>
				<li><i class="zi" style="display:inline-block;margin-top: -3px;float:right;">到
							<input style="width:25px;" type="text" class="inputPageCode" id="pageCode" value="${pb.pc }"/>页</i></a>
				</li>
				<li><i class="zi" style="float:right">共${pb.tp }页</i></li>

				<c:choose>
					<c:when test="${pb.pc eq pb.tp }">
						<li><i class="zi" style="float:right">尾页</i></li>
					</c:when>
					<c:otherwise>
						<li>
							<a style="float:right;border:0px;" href="${pb.url }&pc=${pb.tp }"><i style="font-style: normal;">尾页</i></a>
						</li>
					</c:otherwise>
				</c:choose>
				<c:choose>
					<c:when test="${pb.pc eq pb.tp }">
						<li><i class="zi" style="float:right">></i></li>
					</c:when>
					<c:otherwise>
						<li>
							<a style="float:right;border:0px;" href="${pb.url }&pc=${pb.pc+1}"><i>></i></a>
						</li>
					</c:otherwise>
				</c:choose>

			</ul>
		</nav>

	</body>

</html>