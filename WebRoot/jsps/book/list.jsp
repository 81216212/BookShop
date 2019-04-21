<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>body</title>
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
    
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
    <link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list2.css'/>">
    <script type="text/javascript" src="<c:url value='/jsps/new/js/jquery.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jsps/new/js/lib.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/jsps/new/js/function.js'/>"></script>
  </head>
  <style>
	</style>
  <body>
		<main>
			<!-- Product Section -->
			<div id="product-section" class="product-section container-fluid no-padding">
				<!-- Container -->
				<div class="container">
					<div class="row">
						<!-- Products -->
						<ul class="products">
							<!-- Product -->
							<c:if test="${empty pb.beanList }"><span class="wu">没有图书</span></c:if>
							<c:forEach items="${pb.beanList }" var="book">
							<li class="product video" style="margin-bottom: 30px;margin-top:10px;">
								<a href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">
									<img src="<c:url value='/${book.image_b }'/>" border="0"/></a>
									<div style="width:280px;overflow:hidden;white-space:nowrap;text-overflow:ellipsis;">
									<a id="bookname" title="${book.bname }" href="<c:url value='/BookServlet?method=load&bid=${book.bid }'/>">${book.bname }</a></div>
									<span class="price"><del>&yen;${book.price }</del>&yen;${book.currPrice }</span>
									<c:url value="/BookServlet" var="authorUrl">
									<c:param name="method" value="findByAuthor"/>
											<c:param name="author" value="${book.author }"/>
									</c:url>
									<c:url value="/BookServlet" var="pressUrl">
											<c:param name="method" value="findByPress"/>
											<c:param name="press" value="${book.press }"/>
									</c:url>
									<div><a href="${authorUrl }" title='${book.author }'>${book.author }</a></div>
									<div><a href="${pressUrl }">${book.press }</div>
								</a>
							</li><!-- Product /- -->
							</c:forEach>
					</div><!-- Row /- -->
					<%@include file="/jsps/pager/fenye.jsp" %>
					
				</div><!-- Container /- -->
			</div><!-- Product Section /- -->
			</main>
  </body>
<script type="text/javascript">
	function _go() {
		var pc = $("#pageCode").val();//获取文本框中的当前页码
		if(!/^[1-9]\d*$/.test(pc)) {//对当前页码进行整数校验
			alert("请输入正确的页码!");
			return;
		}
		if(pc > ${pb.tp}) {//判断当前页码是否大于最大页
			alert("超出页数!");
			return;
		}
		location = "${pb.url}&pc=" + pc;
	}
</script>
</html>
