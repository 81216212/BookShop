<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>book_desc.jsp</title>
<link rel="stylesheet" type="text/css" href="<c:url value='/adminjsps/admin/css/book/desc.css'/>">
<link rel="stylesheet" type="text/css" href="<c:url value='/jquery/jquery.datepick.css'/>">
<script type="text/javascript" src="<c:url value='/jquery/jquery-1.5.1.js'/>"></script>
<link rel="icon" type="image/png" href="<c:url value='/images/ico.png'/>">
<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/common.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
		<link rel="stylesheet" href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick.js'/>"></script>
<script type="text/javascript" src="<c:url value='/jquery/jquery.datepick-zh-CN.js'/>"></script>
<script type="text/javascript" src="<c:url value='/adminjsps/admin/js/book/desc.js'/>"></script>

<script type="text/javascript">

$(function() {
	$("#box").attr("checked", false);
	$("#formDiv").css("display", "none");
	$("#show").css("display", "");	
	
	// 操作和显示切换
	$("#box").click(function() {
		if($(this).attr("checked")) {
			$("#show").css("display", "none");
			$("#formDiv").css("display", "");
		} else {
			$("#formDiv").css("display", "none");
			$("#show").css("display", "");		
		}
	});
});

function loadChildren() {
	/*
	1. 获取pid
	2. 发出异步请求，功能之：
	  3. 得到一个数组
	  4. 获取cid元素(<select>)，把内部的<option>全部删除
	  5. 添加一个头（<option>请选择2级分类</option>）
	  6. 循环数组，把数组中每个对象转换成一个<option>添加到cid中
	*/
	// 1. 获取pid
	var pid = $("#pid").val();
	// 2. 发送异步请求
	$.ajax({
		async:true,
		cache:false,
		url:"/cmj/admin/AdminBookServlet",
		data:{method:"ajaxFindChildren", pid:pid},
		type:"POST",
		dataType:"json",
		success:function(arr) {
			// 3. 得到cid，删除它的内容
			$("#cid").empty();//删除元素的子元素
			$("#cid").append($("<option>====请选择2级分类====</option>"));//4.添加头
			// 5. 循环遍历数组，把每个对象转换成<option>添加到cid中
			for(var i = 0; i < arr.length; i++) {
				var option = $("<option>").val(arr[i].cid).text(arr[i].cname);
				$("#cid").append(option);
			}
		}
	});
}

function editForm() {
	$("#method").val("edit");
	$("#form").submit();
}
function deleteForm() {
	$("#method").val("delete");
	$("#form").submit();	
}

</script>
  </head>
  <body>
<div class="am-cf admin-main">
			<div class=" admin-content">
				<div class="daohang">
					<ul>
						<li>
							<button type="button" style="margin-left: -10px;margin-top: -20px;" class="am-btn am-btn-default am-radius am-btn-xs">首页</li><li>
        <button type="button" style="margin-left: -10px;margin-top: -20px;" class="am-btn am-btn-default am-radius am-btn-xs">商品图书管理
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
					</div>
	<dir>
    <input style="font-size: larger;" type="checkbox" id="box"><label for="box">编辑图书</label>
    <br/>
    <br/>
  <div id="show">
    <div class="sm">${book.bname }</div>
    <img align="top" src="<c:url value='/${book.image_w }'/>" class="tp"/>
    <div id="book" style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>当前价：<span class="price_n">&yen;${book.currPrice }</span></li>
	    	<li>定价：<span style="text-decoration:line-through;">&yen;${book.price }</span>　折扣：<span style="color: #c30;">${book.discount }</span>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					作者：${book.author }著
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：${book.press }</a>
				</td>
			</tr>
			<tr>
				<td colspan="3">出版时间：${book.publishtime }</td>
			</tr>
			<tr>
				<td>字数：${book.wordNum }</td>
			</tr>
			
			<tr>
				<td>库存：${book.total }</td>
			</tr>
			<tr>
				<td><input style="float:left" type="button" value="返回" onclick="history.go(-1)"/></td>
			</tr>
		</table>
	</div>
  </div>
  
  
  <div id='formDiv'>
   <div class="sm">&nbsp;</div>
   <form action="<c:url value='/admin/AdminBookServlet'/>" method="post" id="form">
    <input type="hidden" name="method" id="method"/>
   	<input type="hidden" name="bid" value="${book.bid }"/>
    <img align="top" src="<c:url value='/${book.image_w }'/>" class="tp"/>
    <div style="float:left;">
	    <ul>
	    	<li>商品编号：${book.bid }</li>
	    	<li>书名：　<input id="bname" type="text" name="bname" value="${book.bname }" style="width:500px;"/></li>
	    	<li>当前价：<input id="currPrice" type="text" name="currPrice" value="${book.currPrice }" style="width:50px;"/></li>
	    	<li>定价：　<input id="price" type="text" name="price" value="${book.price }" style="width:50px;"/>
	    	折扣：<input id="discount" type="text" name="discount" value="${book.discount }" style="width:30px;"/>折</li>
	    </ul>
		<hr style="margin-left: 50px; height: 1px; color: #dcdcdc"/>
		<table class="tab">
			<tr>
				<td colspan="3">
					作者：　　<input id="author" type="text" name="author" value="${book.author }" style="width:150px;"/>
				</td>
			</tr>
			<tr>
				<td colspan="3">
					出版社：　<input id="press" type="text" name="press" value="${book.press }" style="width:200px;"/>
				</td>
			</tr>

			<tr>
				<td>字数：　　<input id="wordNum" type="text" name="wordNum" value="${book.wordNum }" style="width:80px;"/></td>
			</tr>
			<tr>
				<td>字数：　　<input id="total" type="text" name="total" value="${book.total }" style="width:80px;"/></td>
			</tr>
			<tr>
				<td>
					一级分类：<select name="pid" id="pid" onchange="loadChildren()">
						<option value="">==请选择1级分类==</option>
<c:forEach items="${parents }" var="parent">
  <option value="${parent.cid }" <c:if test="${book.category.parent.cid eq parent.cid }">selected="selected"</c:if>>${parent.cname }</option>
</c:forEach>
					</select>
				</td>
				<td>
					二级分类：<select name="cid" id="cid">
						<option value="">==请选择2级分类==</option>
<c:forEach items="${children }" var="child">
  <option value="${child.cid }" <c:if test="${book.category.cid eq child.cid }">selected="selected"</c:if>>${child.cname }</option>
</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td colspan="2">
					<input onclick="editForm()" type="button" name="method" id="editBtn" class="btn" value="编　　辑">
					<input onclick="deleteForm()" type="button" name="method" id="delBtn" class="btn" value="删　　除">
					<input type="button" value="返回" onclick="history.go(-1)"/>
				</td>
			</tr>
			
		</table>
	</div>
   </form>
</div>
</dir>
</div>
  </body>
</html>
