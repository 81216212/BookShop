<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<head>
		<title>订单列表</title>
		<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/common.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
    	<script type="text/javascript" src="<c:url value='/jsps/pager/pager.js'/>"></script>
	    <script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
	<style>
	a{
		color:#3265d9;
	}
	</style>
<script type="text/javascript">
function submitForm() {
	var a = $("#opt option:selected").val();
	if(a == "订单金额") {
		var form = document.getElementById("myform");
		form.submit();
	}
}
$(function(){
	var b = $(".status").text();
	for(var i = 1; i<=5;i++){
		if(b==i){
			$(".opt1").attr("value","<c:url value='/admin/AdminOrderServlet?method=findByStatustime&status="+i+"'/>");
			$(".opt2").attr("value","<c:url value='/admin/AdminOrderServlet?method=findByStatusmoney&status="+i+"'/>");
		}
	}
});
</script>
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
	
					<div class="am-form am-g" style="margin: -23px auto 15px auto;">
					<div>
  <a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=1'/>">未付款</a>  | 
  <a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=2'/>">已付款</a>  | 
  <a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=3'/>">已发货</a>  | 
  <a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=4'/>">交易成功</a>  | 
  <a href="<c:url value='/admin/AdminOrderServlet?method=findByStatus&status=5'/>">已取消</a>
</div>
	<form style="width:300px;float:right;" action="<c:url value='/admin/AdminOrderServlet'/>" method="get" target="body" id="form1">
        <input type="hidden" name="method" value="findByoid"/>
        <input type="text" name="oid" style="border-radius:4px;box-sizing:border-box;border:1px solid #c8cccf;
        height:28px;width:200px;display:initial;" placeholder="搜索订单" autocomplete="off" value="${dingdanoid }">
        <button style="height: 28px;border-radius: 5px;margin-left: -5px;" class="am-btn am-btn-xs am-xiao">
		<a style="color:black" href="javascript:document.getElementById('form1').submit();" target="body">搜索</a></button>
		</form>
		<form action="<c:url value='/admin/AdminOrderServlet'/>" method="get" target="body" id="form2">
        <input type="hidden" name="method" value="findBytime"/>
        <input type="date" value="${dingdantime }" name="ordertime" style="border-radius:4px;box-sizing:border-box;border:1px solid #c8cccf;
        height:28px;width: 10%;display:initial;margin-left: 60%">
        <button style="height: 28px;border-radius: 5px;margin-left: -5px;" class="am-btn am-btn-xs am-xiao">
		<a style="color:black" href="javascript:document.getElementById('form2').submit();" target="body">搜索</a></button>
		</form>
						<table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
							<thead>
								<tr class="am-success">
									<th style="line-height:40px;width: 55%;" class="table-title">商品信息 (${order })
									<span class="status" style="display:none">${status }</span>
									<select id="opt" onchange="window.location=this.value" style="width:95px; font-size: 13px;height: 35px;float:right;margin-top:5px;">
									<option>选择排序</option>
									<option class="opt1" value="<c:url value='/admin/AdminOrderServlet?method=findAll'/>">订单时间</option>
									<option class="opt2" value="<c:url value='/admin/AdminOrderServlet?method=findAllmoney'/>">订单金额</option>
									</select>
									</th>
									<th style="width:15%;line-height: 40px;" class="table-title">金额</th>
									<th style="width:15%;line-height: 40px;" class="table-title">订单状态</th>
									<th style="width:15%;line-height: 40px;" class="table-set">操作</th>
								</tr>
							</thead>

							<c:forEach items="${pb.beanList }" var="order">	
							<c:if test="${empty pb }">没有订单</c:if>
								<tbody>
									<tr>	
										<td colspan="4">订单号：<a href="<c:url value='/admin/AdminOrderServlet?method=load&oid=${order.oid }'/>">${order.oid }</a> 
			&nbsp;&nbsp;下单时间：${order.ordertime }</td>
									</tr>
									<tr>
										<td><c:forEach items="${order.orderItemList }" var="orderItem">
	    			<img border="0" width="70" src="<c:url value='/${orderItem.book.image_b }'/>"/>
  										</c:forEach></td>
										<td><span>&yen;${order.total }</span></td>
										<td>
										<c:choose>
									<c:when test="${order.status eq 1 }">(等待付款)</c:when>
								<c:when test="${order.status eq 2 }">(准备发货)</c:when>
										<c:when test="${order.status eq 3 }">(等待确认)</c:when>
									<c:when test="${order.status eq 4 }">(交易成功)</c:when>
							<c:when test="${order.status eq 5 }">(已取消)</c:when>
								</c:choose>	
										</td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
												<a title="查看订单" class="button11" href="<c:url value='/admin/AdminOrderServlet?method=load&oid=${order.oid }'/>">查看</a><br/>
												<a title="删除订单" class="button11" onclick="return confirm('您是否真要删除该订单?')" style="color:red"
												href="<c:url value='/admin/AdminOrderServlet?method=delete&oid=${order.oid }'/>">删除</a><br/>
					<c:if test="${order.status eq 1 }">
				<a title="取消订单" class="button11" href="<c:url value='/admin/AdminOrderServlet?method=load&oid=${order.oid }&btn=cancel'/>">取消</a><br/>						
					</c:if>
					<c:if test="${order.status eq 2 }">
				<a title="订单发货" class="button11" href="<c:url value='/admin/AdminOrderServlet?method=load&oid=${order.oid }&btn=deliver'/>">发货</a><br/>
					</c:if>	
												</div>
											</div>
										</td>
									</tr>
								</tbody>

							</c:forEach>

						</table>
						</div>
						<%@include file="/jsps/pager/pager.jsp" %>
	</body>
</html>