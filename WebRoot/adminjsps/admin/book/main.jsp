<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>

	<head>
		<title>图书列表</title>
		<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/common.css'/>" />
		<link rel="stylesheet" type="text/css" href="<c:url value='/jsps/pager/pager.css'/>" />
	    	<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
	</head>
<script type="text/javascript">
$(function(){
	var b =$("span").size();
	for(var i = 0; i<=b;i++){
		var a =$("#booktotal"+i).text();
		if(a<20){
			$("#booktotal"+i).css("color","red");
			$("#booktotal"+i).append("<p style='color:red;'>商品缺货</p>");
		}
	}
});
</script>
<style>
input:focus{
	outline:none;
	background-color: transparent;
}
</style>
	<body>
		<div class="am-cf admin-main">
			<div class=" admin-content">
				<div class="daohang">
					<ul>
						<li>
							<button type="button" class="am-btn am-btn-default am-radius am-btn-xs">首页</li><li>
        <button type="button" class="am-btn am-btn-default am-radius am-btn-xs">商品图书管理
		<a class="am-close" title="关闭" href="<c:url value='/adminjsps/admin/body.jsp'/>">×</a>
        </button></ul>
				</div>
				</div>
				</div>
				
				<div class="admin-biaogelist">
					<div class="listbiaoti am-cf">
						<ul class="am-icon-flag on">商品图书管理</ul>
						<dl class="am-icon-home" style="float: right;">前位置： 首页 ><a href="#">商品图书列表</a></dl>
						<dl>
          <a title="添加图书" class="button" href="<c:url value='/admin/AdminBookServlet?method=addPre'/>" style="width: 70px;">添加图书</a>
        </dl>
        <dl>
       			 <form action="<c:url value='/BookServlet'/>" method="get" target="body" id="form1">
    				<input type="hidden" name="method" value="adminfindByBname2"/>
							<p class="ycfg"><input type="text" style="border-radius:4px;box-sizing: border-box;border: 1px solid #c8cccf;height: 28px;" name="bname" placeholder="搜索商品" /></p>
							<p><button style="float:right;border-radius: 5px;height:28px;margin-top:-28px;margin-right: -50px;" class="am-btn am-btn-xs am-xiao">
							<a href="javascript:document.getElementById('form1').submit();" target="body">搜索</a></button></p>
					</form>
							</dl>
					</div>
					<div class="am-form am-g">
						<table width="100%" class="am-table am-table-bordered am-table-radius am-table-striped am-table-hover">
							<thead>
								<tr class="am-success">
									<th style="width: 10%;">图书图片</th>
									<th style="width: 30%;">图书名称</th>
									<th style="width: 10%;">图书价格</th>
									<th style="width: 10%;">图书作者</th>
									<th style="width: 15%;">图书出版社</th>
									<th style="width: 10%;">图书库存</th>
									<th style="width: 15%;" class="table-set">操作</th>
								</tr>
							</thead>
							<c:if test="${empty pb.beanList }"><h1>没有图书</h1></c:if>
							<c:forEach items="${pb.beanList }" var="book" varStatus="num">
								<tbody>
									<tr>
										<td style="text-align: center;"><a title="点击查看图书信息" href="<c:url value='/admin/AdminBookServlet?method=load&bid=${book.bid }'/>">
										<img src="<c:url value='/${book.image_b }'/>" style="width:55px" border="0"/></a></td>
										<td><div style="width: 500px;display: -webkit-box; -webkit-box-orient: vertical; -webkit-line-clamp: 2;overflow: hidden;">
										<a title="点击查看图书信息" href="<c:url value='/admin/AdminBookServlet?method=load&bid=${book.bid }'/>">
										${book.bname }</a></td></div>
										<td>${book.currPrice }</td>
										<td>${book.author }</td>
										<td>${book.press }</td>
										<td><span id="booktotal${num.index }">${book.total }</span></td>
										<td>
											<div class="am-btn-toolbar">
												<div class="am-btn-group am-btn-group-xs">
			<a title="查看图书信息" class="button1" href="<c:url value='/admin/AdminBookServlet?method=load&bid=${book.bid }'/>">查看</a>
			<a title="删除图书" class="button3" onclick="return confirm('您是否真要删除该图书?')" href="<c:url value='/admin/AdminBookServlet?method=delete&bid=${book.bid }'/>">删除</a>
												</div>
											</div>
										</td>
									</tr>
								</tbody>
							</c:forEach>
						</table>
						</div>
						</div>
						<%@include file="/jsps/pager/pager.jsp" %>
	</body>

</html>