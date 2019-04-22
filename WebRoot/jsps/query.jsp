<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>分类</title>
		<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
	<script type="text/javascript">
		$(document).ready(function() {
			$(".gengduo").click(function() {
				if(($("#div1").css("height")) == "63px") {
					$("#div1").css("height", "127px");
				} else {
					$("#div1").css("height", "63px");
				}
			});
		});
	</script>
	<style>
		#div1 {
			height: 63px;
			background-color: #44a5ff;
			width: 80%;
			overflow: hidden;
			position: absolute;
			left: 10%;
			border-radius: 15px;
		}
		
		#ul1 {
			display: table;
			margin: 0 auto;
			text-align: center;
			height: 50px;
			padding: 0;
			padding: 0px 30px;
		}
		
		.li1 {
			text-align: center;
			margin-right: 5px;
			list-style: none;
			float: left;    
			margin: 6px;
    		margin-bottom: 0px;
			line-height: 50px;
			list-style-type: none;
			width: 120px;
			font-size: 16px;
			padding: 0px 10px;
		}
		
		#ul1>.li1>a {
			color: white;
			text-decoration: none;
			display: inline-block;
    		width: 120px;
		}
		
		.gengduo {
			color: white;
			float: right;
			text-align: center;
			margin-right: 5px;
			margin-top: 6px;
			line-height: 50px;
			width: 55px;
			font-size: 16px;
			background: transparent;
			border: 0;
			cursor: pointer;
		}
		
		li:HOVER {
			background:#4aa0ef;
		}
	</style>

	<body>
		<div id="div1">
			<a class="gengduo">更多</a>
			<ul id="ul1">
				<c:forEach items="${parents}" var="parent" varStatus="status">
					<c:forEach items="${parent.children}" var="child">
						<li class="li1 nav-item">
							<a href="<c:url value='/BookServlet?method=findByCategory&cid=${child.cid}'/>" target="body">${child.cname}</a>
						</li>
					</c:forEach>
				</c:forEach>
			</ul>
		</div>
	</body>

</html>