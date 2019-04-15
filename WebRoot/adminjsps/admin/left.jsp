<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>My JSP 'left.jsp' starting page</title>
<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/style.css'/>" />
	    	<script type="text/javascript" src="<c:url value="/adminjsps/admin/new/js/jquery.min.js"/>"></script>
	    	<script type="text/javascript" src="<c:url value="/adminjsps/admin/new/js/main.js"/>"></script>
  </head>
<script>
  function dianji(id){
	var src =$("."+id).attr("src");
	if(src=="/cmj/images/plus.png"){
		$("."+id).attr("src","/cmj/images/minus.png");
		}else{
			$("."+id).attr("src","/cmj/images/plus.png");
		}
	}
  
</script>
<body style="background: #5f7994;">
	<ul class="cd-accordion-menu">
		<c:if test="${empty parents }">
			没有商品
		</c:if>

		<c:forEach items="${parents}" var="parent" varStatus="status">
			<li>
				<input type="checkbox" id="group${status.index}">
				<div class="menu" style="height:35px">
					<label id="label${status.index}" onclick="dianji(this.id)" for="group${status.index}">
				<a class="img"></a>${parent.cname}<img id="img2" class="label${status.index}" src="/cmj/images/plus.png"></label></div>
				<ul class="zi">
					<c:choose>
						<c:when test="${empty parent.children }">
							没有分类
						</c:when>
						<c:otherwise>
							<c:forEach items="${parent.children}" var="child">
								<li>
									<a class="lian" href="/cmj/BookServlet?method=adminfindByCategory&cid=${child.cid}" target="body">${child.cname}</a>
								</li>
							</c:forEach>
						</c:otherwise>
					</c:choose>
				</ul>
			</li>
		</c:forEach>
	</ul>
</body>
</html>