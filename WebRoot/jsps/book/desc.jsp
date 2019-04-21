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
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>">
		<script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
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
		
		.fan {
			border: 1px solid #ececec;
			color: #777;
			display: inline-block;
			font-size: 13px;
			font-family: 'Montserrat', sans-serif;
			letter-spacing: 0.52px;
			margin-left: 10px;
			margin-right: 10px;
			padding: 16px 60px 14px;
			text-decoration: none;
			line-height: 1.42857143;
			text-transform: uppercase;
		}
		
		#jijia {
			padding: 12px 0px;
			line-height: 2px;
			font-size: 20px;
			width: 36px;
			height: 36px;
			float: left;
			margin-left: 30%;
		}
		
		.goubutton {
			height: 36px;
			font: 16px/36px "Microsoft Yahei";
			overflow: hidden;
			margin: 0 0 3px 10px;
			float: left;
			padding: 0 15px;
			color: white;
			border-radius: 3px;
			background-color: #287eff;
			text-decoration: none;
		}
		
		#cnt {
			width: 40px;
			height: 36px;
			text-align: center;
			display: inline-block;
			float: left;
			margin-top: 0.1px;
		}
		.goubutton:HOVER {
			background-color:#ff2832;
		}
	</style>
	<script type="text/javascript">
		function tijiao() {
			alert("添加购物车成功");
		}
		$(function() {
			$(".add").click(function() {
				var t = $(this).parent().find("input[id*=cnt]");
				t.val(parseInt(t.val()) + 1);
			});
			$(".min").click(function() {
				var t = $(this).parent().find("input[id*=cnt]");
				t.val(parseInt(t.val()) - 1);
				if(parseInt(t.val()) < 1) {
					alert("禁止操作");
					t.val(1);
				}
			});
		});
	</script>

	<body data-offset="200" data-spy="scroll" data-target=".ow-navigation">
		<div class="main-container">
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
								<form id="form1" action="<c:url value='/CartItemServlet'/>" method="post">
									<input type="hidden" name="method" value="add" />
									<tr>
										<td><input type="hidden" name="bid" value="${book.bid }" />
											<input id="jijia" class="min" type="button" value="-" />
											<input autocomplete="off" id="cnt" type="text" name="quantity" value="1" />
											<input style="margin-left: 0" id="jijia" class="add" type="button" value="+" />
											<a class="goubutton" onclick="tijiao()" href="javascript:$('#form1').submit();">加入购物车</a>
										</td>
									</tr>
								</form>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>

</html>