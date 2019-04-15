<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>图书详细</title>
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/lib.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/shortcode.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/style.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/font-family.css'/>">
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/new/css/navigation-menu.css'/>">
		<script src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
		<script src="<c:url value='/jsps/js/book/desc.js'/>"></script>
	</head>
	<style>
		#btn {
			background: url(/cmj/images/all.png) no-repeat;
			display: inline-block;
			background-position: 0 -70px;
			height: 36px;
			width: 146px;
		}
		
		#btn:HOVER {
			background: url(/cmj/images/all.png) no-repeat;
			display: inline-block;
			background-position: 0 -106px;
			height: 36px;
			width: 146px;
		}
	</style>
	<script type="text/javascript">
		function tijiao() {
			alert("添加购物车成功");
		}
	</script>
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
				<!-- Cart -->
				<div class="woocommerce-cart container-fluid no-left-padding no-right-padding">
					<!-- Container -->
					<div class="container">
						<!-- Cart Table -->
						<div class="row">
							<div class="col-md-12 col-sm-12 col-xs-12 cart-table">
								<table class="table table-bordered table-responsive">
									<tr>
										<td colspan="2" align="left">${book.bname }</td>
									</tr>
									<tr>
										<td rowspan="11">
											<img align="top" src="<c:url value='/${book.image_w }'/>" class="img_image_w" />
										</td>
									</tr>
									<tr>
										<td>折扣价：<span class="price_n">&yen;${book.currPrice }</span></td>
										</tr>
											<tr>
												<td>定价：<span class="spanPrice"><del>&yen;${book.price }</del></span>　折扣：<span style="color: #c30;">${book.discount }</span>折</td>
											</tr>
											<tr>
												<td>
													作者：${book.author } 著
												</td>
											</tr>
											<tr>
												<td>
													出版社：${book.press }
												</td>
											</tr>
											<tr>
												<td>出版时间：${book.publishtime }</td>
											</tr>
											<tr>
												<td>字数：${book.wordNum }</td>
											</tr>
									<tr>
										<td>商品编号：${book.bid }</td>
									</tr>
											<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
										<input type="hidden" name="method" value="cartadd" />
											<tr>
												<td><input type="hidden" name="bid" value="${book.bid }" /><span>我要买：</span>
												<input autocomplete="off" id="cnt" style="width: 40px;text-align: center;" type="text" name="quantity" value="1" /><span>件 </span>
												<a style="margin-left:40px;margin-top:-5px;position:absolute;" id="btn" onclick="tijiao()" href="javascript:$('#form1').submit();"></a>
												</td>
											</tr>
											</form>
											
								</table>
							</div>
	</body>

</html>