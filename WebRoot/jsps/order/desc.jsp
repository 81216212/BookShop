<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
    	<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/book/list2.css'/>">
		<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
	<style>
		#confirm {
	background: url(/cmj/images/confirm.jpg) no-repeat;
	display: inline-block;
	height: 34px;
	width: 142px;
	font-size: 20px;
	font-weight: 900;
	color: #fff;
	text-align: left;
	padding-top: 6px;
	padding-left: 30px;
}

#cancel {
	background: url(/cmj/images/hei_1_btn.jpg) no-repeat;
	display: inline-block;
	height: 34px;
	width: 142px;
	font-size: 20px;
	font-weight: 900;
	color: #fff;
	text-align: left;
	padding-top: 6px;
	padding-left: 30px;
}
#pay {
	background: url(/cmj/images/sprites_orderdetails.gif)
		no-repeat;
	display: inline-block;
	background-position: 0 -200px;
	height: 34px;
	width: 142px;
	margin-top: 10px;
}

	</style>
			<main>
				<!-- Page Banner -->
				<div class="page-banner container-fluid no-padding">
					<!-- Container -->
					<div class="container">
						<div class="banner-content">
							<h3>订单列表</h3>
							<p>查看您的订单记录！</p>
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
									<td colspan="4">
									<span>订单号：${order.oid }</span>
									<c:choose>
											<c:when test="${order.status eq 1 }"><span style="color:#c30;">(等待付款)</span></c:when>
											<c:when test="${order.status eq 2 }"><span style="color:#4eac9b">(准备发货)</span></c:when>
											<c:when test="${order.status eq 3 }"><span style="color:#248bb4;">(等待确认)</span></c:when>
											<c:when test="${order.status eq 4 }"><span>(交易成功)</span></c:when>
											<c:when test="${order.status eq 5 }"><span style="color:gray;">(已取消)</span></c:when>
									</c:choose>	
									<span>下单时间：${order.ordertime }</span>
									</td>
								</tr>
								<tr>
									<td colspan="4"><span>地址：${order.address }</span></td>
								</tr>
								<tr>
									<td>商品信息</td>
									<td>单价</td>
									<td>数量</td>
									<td>小计</td>
								</tr>
								<c:forEach items="${order.orderItemList }" var="item">
						<tr>
							<td align="left">
								  <img align="middle" width="70" src="<c:url value='/${item.book.image_b }'/>"/>
								  <a style="text-decoration:none;" href="<c:url value='/BookServlet?method=orderload&bid=${item.book.bid }'/>">${item.book.bname }</a>
							</td>
							<td>
								<span>&yen;${item.book.currPrice }</span>
							</td>
							<td>
								<span>${item.quantity }</span>
							</td>
							<td>
								<span>&yen;${item.subtotal }</span>
							</td>			
						</tr>
					</c:forEach>
								<tr>
									<td colspan="4" align="right">合计金额：&yen;${order.total }</td>
								</tr>
								<tr>
									<td colspan="4" align="right">
<c:if test="${order.status eq 1 }">
	<a href="<c:url value='/OrderServlet?method=paymentPre&oid=${order.oid }'/>" id="pay"></a><br/>
</c:if>
<c:if test="${order.status eq 1 and btn eq 'cancel'}">
    <a onclick="return confirm('您是否要取消该订单信息?')" id="cancel" href="<c:url value='/OrderServlet?method=cancel&oid=${order.oid }'/>">取消订单</a><br/>
</c:if>
<c:if test="${order.status eq 3 and btn eq 'confirm'}">
	<a id="confirm" href="<c:url value='/OrderServlet?method=confirm&oid=${order.oid }'/>">确认收货</a><br/>
</c:if>
									</td>
								</tr>
								
								</thead>
								</table>
								</div>
								</div>
								</div>
								</div>
								</main>
								</div>
</body>
</html>

