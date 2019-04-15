<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>


<!DOCTYPE HTML PUBLIC "-//W3C//Dth HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>showitem.jsp</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/css/cart/newlist.css'/>">	
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
		<script src="<c:url value='/jsps/new/js/functions.js'/>"></script>
		<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<script src="<c:url value='/js/round.js'/>"></script>
<style type="text/css">
</style>

<script type="text/javascript">
	//计算合计
	$(function() {
		var total = 0;
		$(".subtotal").each(function() {
			total += Number($(this).text());
		});
		$("#total").text(round(total, 2));
	});
</script>
  </head>
<style>
	body{
	font-family: 'Arizonia', cursive;
	font-size: 18px;
	}
</style>  
			<main><!-- Page Banner -->
				<div class="page-banner container-fluid no-padding"><!-- Container -->
					<div class="container">
						<div class="banner-content">
							<h3>购物车</h3>
							<p>尽情挑选您喜欢的商品吧！</p>
						</div>
						<ol class="breadcrumb">
							<li>
								<a title="主页" href="<c:url value='/index.jsp'/>" target="_parent">主页</a>
							</li>
							<li class="active">购物车</li>
						</ol>
					</div><!-- Container /- -->
				</div><!-- Page Banner /- -->
				
				<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
					<!-- Container -->
					<div class="container">
						<!-- Cart Table -->
						<div class="col-md-12 col-sm-12 col-xs-12 cart-table">

							<table class="table table-bordered table-responsive">
								<thead>
								<tr>
									<th colspan="5"><span>生成订单</span></th>
								</tr>
									<tr>
										<th>商品</th>
										<th>图书名称</th>
										<th>单价</th>
										<th>数量</th>
										<th>总价</th>
									</tr>
								</thead>
  <c:choose>
  	<c:when test="${empty cartItemList }">没有商品 请先登录！</c:when>
  	<c:otherwise>
  	
<form id="form1" action="<c:url value='/OrderServlet'/>" method="post">
	<input type="hidden" name="cartItemIds" value="${cartItemIds }"/>
	<input type="hidden" name="method" value="createOrder"/>

<c:forEach items="${cartItemList }" var="cartItem">
	<tr align="center">
		<td style="padding: 10px">
			<a class="linkImage" href="<c:url value='/jsps/book/desc.jsp'/>"><img border="0" width="54" align="top" src="<c:url value='/${cartItem.book.image_b }'/>"/></a>
		</td>
		<th align="left">
			<a href="<c:url value='/jsps/book/desc.jsp'/>"><span>${cartItem.book.bname }</span></a>
		</th>
		<th>&yen;${cartItem.book.currPrice }</th>
		<th>${cartItem.quantity }</th>
		<th>
			<span class="price_n">&yen;<span class="subtotal">${cartItem.subtotal }</span></span>
		</th>
	</tr>
</c:forEach>

	<tr>
		<td colspan="6" align="right">
			<span>总计：</span><span class="price_t">&yen;<span id="total">${total }</span></span>
		</td>
	</tr>
	<tr>
		<td colspan="1" ><span style="font-weight: 900">收货地址</span></td>
		<td colspan="4" align="left">
			<input style="width:800px;" id="addr" type="text" name="address" value="深圳市 龙华新区 cmj"/>
		</td>
	</tr>
	<tr>
		<td colspan="5" class="action" align="right">
			<a style="background: #e4ddc6;" id="linkSubmit" href="javascript:$('#form1').submit();">提交订单</a>
		</td>
	</tr>
</table>
</form>
</div>
</div>
</div>
</main>
  	</c:otherwise>
  </c:choose>
  </body>
</html>
