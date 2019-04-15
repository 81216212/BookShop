<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<title>订单列表</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
    	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list2.css'/>">
		<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
	<style>
	</style>
			<main>
				<!-- Page Banner -->
				<div class="page-banner container-fluid no-padding">
					<!-- Container -->
					<div class="container">
						<div class="banner-content">
							<h3>订单列表</h3>
							<p>查看您的订单！</p>
						</div>
						<ol class="breadcrumb">
							<li>
								<a title="主页" href="<c:url value='/index.jsp'/>" target="_parent">主页</a>
							</li>
							<li class="active">订单列表</li>
						</ol>
					</div>
					<!-- Container /- -->
				</div>
				<!-- Page Banner /- -->

				<!-- Cart -->
				<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
					<!-- Container -->
					<div class="container">
						<!-- Cart Table -->
							<div class="row">
						<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
							<table class="table table-bordered table-responsive">
								<thead>
									<tr>
										<th>商品信息</th>
										<th>金额</th>
										<th>订单状态</th>
										<th>操作</th>
									</tr>
									<c:forEach items="${pb.beanList }" var="order">
										<tr>
											<td colspan="4" align="left">${order.owner.uid }订单号：
												<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }'/>">
													${order.oid }</a>下单时间：${order.ordertime }
											</td>
										</tr>
								</thead>
								<tr>
									<td style="padding:0px">
										<c:forEach items="${order.orderItemList }" var="orderItem">
											<a class="link2" href="<c:url value='/BookServlet?method=orderload&bid=${orderItem.book.bid }'/>">
												<img style="width:110px;" border="0" width="70" src="<c:url value='/${orderItem.book.image_b }'/>" /></a>
										</c:forEach>
									</td>
									<td>
										<span class="price_t">&yen;${order.total }</span>
									</td>
									<td>
										<c:choose>
											<c:when test="${order.status eq 1 }"><span style="color:#c30;">(等待付款)</span></c:when>
											<c:when test="${order.status eq 2 }"><span style="color:#4eac9b">(准备发货)</span></c:when>
											<c:when test="${order.status eq 3 }"><span style="color:#248bb4;">(等待确认)</span></c:when>
											<c:when test="${order.status eq 4 }"><span>(交易成功)</span></c:when>
											<c:when test="${order.status eq 5 }"><span style="color:gray;">(已取消)</span></c:when>
										</c:choose>
									</td>
									<td>
										<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }'/>">查看</a><br/>
										<c:if test="${order.status eq 1 }">
											<a href="<c:url value='/OrderServlet?method=paymentPre&oid=${order.oid }'/>">支付</a><br/>
											<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }&btn=cancel'/>">取消</a><br/>
										</c:if>
										<c:if test="${order.status eq 3 }">
											<a href="<c:url value='/OrderServlet?method=load&oid=${order.oid }&btn=confirm'/>">确认收货</a><br/>
										</c:if>
										<a onclick="return confirm('您是否要删除该订单信息?')" href="<c:url value='/OrderServlet?method=delete&oid=${order.oid }'/>">删除记录</a><br/>
									</td>
								</tr>
								</c:forEach>
							</table>
							</div>
							<%@include file="/jsps/pager/fenye.jsp" %>
						</div>
						</div>
						</div>
						</main>
						</div>
	</body>
</html>