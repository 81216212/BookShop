<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>订单详细</title>
<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/common.css'/>" />
	<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/order/desc.css'/>">
  </head>
  
<body>
<div class="am-cf admin-main">
			<div class=" admin-content">
				<div class="daohang">
					<ul>
						<li>
							<button type="button" class="am-btn am-btn-default am-radius am-btn-xs">首页</li> <li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">
        订单管理<a class="am-close" title="关闭" href="<c:url value='/adminjsps/admin/body.jsp'/>">×</a>
        </button></ul></div>
				<div class="admin-biaogelist">
      <div class="listbiaoti am-cf">
        <ul class="am-icon-flag on">订单管理</ul>
        <dl class="am-icon-home" style="float: right;"> 当前位置： 首页 > <a href="#">订单列表</a></dl></div>	
        
	<div class="divOrder">
		<span>订单号：${oder.oid }
<c:choose>
	<c:when test="${order.status eq 1 }">(等待付款)</c:when>
	<c:when test="${order.status eq 2 }">(准备发货)</c:when>
	<c:when test="${order.status eq 3 }">(等待确认)</c:when>
	<c:when test="${order.status eq 4 }">(交易成功)</c:when>
	<c:when test="${order.status eq 5 }">(已取消)</c:when>
</c:choose>
		　　　下单时间：${order.ordertime }
		</span>
	</div>
	<div class="divRow">
		<div class="divContent">
			<dl>
				<dt>收货人信息： ${order.address }</dt>
				<dt>用户信息： ${order.owner.loginname }</dt>
			</dl>
		</div>
		<div class="divContent">
			<dl>
				<dt>商品清单</dt>
				<dd>
					<table cellpadding="0" cellspacing="0">
						<tr>
							<th class="tt">商品名称</th>
							<th class="tt" align="left">单价</th>
							<th class="tt" align="left">数量</th>
							<th class="tt" align="left">小计</th>
						</tr>




<c:forEach items="${order.orderItemList }" var="orderItem">
						<tr style="padding-top: 20px; padding-bottom: 20px;">
							<td class="td" width="400px">
								<div class="bookname">
								  <img align="middle" width="70" src="<c:url value='/${orderItem.book.image_b }'/>"/>
								  ${orderItem.book.bname }
								</div>
							</td>
							<td class="td" >
								<span>&yen;${orderItem.book.currPrice }</span>
							</td>
							<td class="td">
								<span>${orderItem.quantity }</span>
							</td>
							<td class="td">
								<span>&yen;${orderItem.subtotal }</span>
							</td>			
						</tr>
</c:forEach>

							
							
							
					</table>
				</dd>
			</dl>
		</div>
		<div class="divBtn">
			<span class="spanTotal">合　　计：</span>
			<span class="price_t">&yen;${order.total }</span>
			<br/>
<c:if test="${order.status eq 2 and btn eq 'deliver' }">
	<a title="订单发货" id="deliver" href="<c:url value='/admin/AdminOrderServlet?method=deliver&oid=${order.oid }'/>">发　　货</a><br>
</c:if>
<c:if test="${order.status eq 1 and btn eq 'cancel' }">
	<a title="取消订单" id="cancel" href="<c:url value='/admin/AdminOrderServlet?method=cancel&oid=${order.oid }'/>">取　　消</a><br>
</c:if>
		<br>
		<a title="返回列表" style="font-size:1.2em" class="button11" href="<c:url value='/admin/AdminOrderServlet?method=findAll'/>" target="body">返回订单管理</a>
		<br>
		</div>
	</div>
</body>
</html>

