<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>分类列表</title>
<link rel="icon" type="image/png"
	href="<c:url value='/images/ico.png'/>">
<link rel="stylesheet"
	href="<c:url value='/adminjsps/admin/new/css/amazeui.min.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/adminjsps/admin/new/css/common.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/adminjsps/admin/new/css/admin.css'/>" />
<link rel="stylesheet"
	href="<c:url value='/adminjsps/admin/css/category/category.css'/>" />
<script type="text/javascript"
	src="<c:url value="/adminjsps/admin/new/js/jquery.min.js"/>"></script>
</head>
<script type="text/javascript">	
$(document).ready(function(){

$("#fenlei").mousedown(function() {
	 $(".fenlei").slideToggle(10);
	});
$(".x").mousedown(function() {
	 $(".fenlei").hide(10);
	});
  
});
$(function(){
if($(".msg").text()=="该分类已经存在"){
	 $(".fenlei").css("display","block");
}
if($(".cuo").text()=="该分类已存在"){
	 alert("已存在分类");
}
if($(".dui").text()=="保存成功"){
	 alert("保存成功");
}
});
function dianji(id){
	$(".zifenle"+id).slideToggle(150);
	$("#jiaerle"+id).remove();
	$("#le"+id).attr("onclick","jiaer(this.id)");
	var a = $(".ile"+id).text();
	if(a==">"){
		$(".ile"+id).text("∨");
	}else{
		$(".ile"+id).text(">");
	}
}

function xianfu(id){
	$("#fu"+id+"span").css("display","none");
	$("#32fu"+id+"input").css("display","block");
	$("#fu"+id).css("display","block");
	$("#2fu"+id).css("display","block");
	$("#"+id).css("display","none");
}

function xianchildren(id){
	$("#"+id).css("display","none");
	$("#52"+id).css("display","none");
	$("#432"+id).css("display","block");
	$("#32"+id).css("display","block");
	$("#2"+id).css("display","block");
}

function submitform() {
	if($(".yijifenlei").val()=="") {
		alert("分类名不能为空！");
	}else{
		$("#yijiform").submit();	
	}
}

function parentform(id) {
	if($("#43"+id+"input").val()=="") {
		alert("分类名不能为空！");
	}else{
		$("#"+id+"form").submit();	
	}
}

function childrenform(id) {
	if($("#4"+id).val()=="") {
		alert("分类名不能为空！");
	}else{
		$("#"+id+"form").submit();	
	}
}

function childrenform2(id) {
	if($("#cname"+id).val()=="") {
		alert("分类名不能为空！");
	}else{
		$("#form"+id).submit();	
	}
}

function xiaobutton(id) {
	$("#"+id+"span").css("display","block");
	$("#32"+id+"input").css("display","none");
	$("#"+id).css("display","none");
	$("#2"+id).css("display","none");
	$("."+id+"p").css("display","block");
	$("."+id+"p2").css("display","none");
}

function xiaobutton2(id) {
	$("."+id).css("display","block");
	$("#"+id).css("display","none");
	$("#3"+id).css("display","none");
	$("#43"+id).css("display","none");
	$("#5"+id).css("display","block");
}

function xiaobutton3(id) {
	$("#"+id).remove();
	$("."+id).attr("onclick","jiaer(this.id)");
}



</script>
<body>
	<div class="am-cf admin-main">
		<div class=" admin-content">
			<div class="daohang">
				<ul>
					<li>
						<button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">首页
					</li>
					<li>
						<button type="button"
							class="am-btn am-btn-default am-radius am-btn-xs">
							商品栏目管理<a class="am-close" title="关闭"
								href="<c:url value='/adminjsps/admin/body.jsp'/>">×</a>
						</button>
				</ul>
			</div>
			<div class="fenlei" style="display:none">
				<span class="msg"
					style="color:red;display: -webkit-box; position: absolute;margin-top: -30px; float: left;">${msg
					}</span>
				<form action="<c:url value='/admin/AdminCategoryServlet'/>" id="yijiform" method="post">
					<input type="hidden" name="method" value="addParent" /> 
					分类名称:<input type="text" name="fucname" autocomplete="off" class="yijifenlei"/>
					<input onclick="submitform()" class="but" type="button" value="添加一级分类">
					<span class="x" style="float: right; position: relative;line-height: 20px;cursor: pointer;">x</span>
				</form>
			</div>
			<div class="admin-biaogelist">
				<div class="listbiaoti am-cf">
					<ul class="am-icon-flag on">商品栏目管理
					</ul>
					<dl class="am-icon-home" style="float: right;">
						当前位置： 首页 >
						<a href="#">商品栏目列表</a>
					</dl>
					<dl>
						<button type="button" id="fenlei"
							class="am-btn am-btn-danger am-round am-btn-xs am-icon-plus">添加商品一级分类</button>
					</dl>
				</div>
				<div class="am-form am-g">
					<div style="width:100%;height:40px;">
						<span class="cuo" style="display: none;">${cuo}</span>
						<span class="dui" style="display: none;">${dui}</span>
						<div class="title" style="border:1px solid #ddd">分类名称</div>
						<div class="title" style="border:1px solid #ddd">操作</div>
					</div>
					<div class="cd-accordion-menu">
						<c:forEach items="${parents}" var="parent" varStatus="status">
							<li style="list-style-type:none;"><input
								style="display:none" type="checkbox" id="labelfup${status.index}">
							<div class="fu" style="float: right;">
										<input title="修改分类" type="button" value="修改"
											style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;"
											id="p${status.index}" onclick="xianfu(this.id)"class="fup${status.index}p button1">
										<input title="保存"
											style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;display:none;"
											id="2fup${status.index}" onclick="parentform(this.id)"
											class="fup${status.index}p2 button1" type="button" value="保存">
										<input title="取消" style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;display:none;"
											id="fup${status.index}" onclick="xiaobutton(this.id)"
											class="button2" type="button" value="取消"> 
										<label title="只能添加一个分类" style="height: 35px;cursor: pointer;line-height: 31px;font-size: 15px;font-weight: 500;"
											class="button2 jiaerlei${status.index}" id="lei${status.index}" onclick="jiaer(this.id)">添加二级分类</label>
										<a title="删除分类" style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;"
											class="button3" onclick="return confirm('您是否真要删除该一级分类？')"
											href="<c:url value='/admin/AdminCategoryServlet?method=deleteParent&cid=${parent.cid }'/>">删除</a>
									</div>
								<label onclick="dianji(this.id)" id="i${status.index}"
								style="width:50%;float: right; font-size: 25px;" for="labelfup${status.index}">
									<div class="fu">
										<span style="margin-top: -4px;font-size: 40px;float: left;" class="ilei${status.index}">></span>
										<form id="2fup${status.index}form" action="<c:url value='/admin/AdminCategoryServlet'/>" method="post">
											<input type="hidden" name="cid" value="${parent.cid }"/> 
											<input type="hidden" name="method" value="editParent" /> 
											<input value="${parent.cname }" class="fucname2" autocomplete="off"
												style="margin-left:27.5px;position: absolute;width: 200px;height: 30px;margin-top:5px;display: none;"
												type="text" name="fucname2" id="32fup${status.index}input">
										</form>
										<span id="fup${status.index}span" style="display: block;margin-top: -15px;">${parent.cname}</span>
										<span style="display:none;" class="minglei${status.index}">${parent.cid}</span>
									</div>
									</label>
								<ul class="zifenlei${status.index}" style="display:none">
									<c:choose>
										<c:when test="${empty parent.children }"> 没有分类  </c:when>
										<c:otherwise>
											<c:forEach items="${parent.children}" var="child">
												<li class="zi">
													<div class="fu" style="margin-left: 10%;width: 40%;"><span id="52c${child.cid}">${child.cname}</span>
													<form id="32c${child.cid}form" action="<c:url value='/admin/AdminCategoryServlet'/>" method="post">
												<input type="hidden" name="method" value="editChild"/>
    											<input type="hidden" name="cid" value="${child.cid }"/>
    											<input type="hidden" name="pid" value="${parent.cid }"/>
												<input value="${child.cname}" autocomplete="off" style="margin-left:-1px;display:none;position: absolute;width: 200px;height: 30px;margin-top:4px;"
												type="text" name="ercname2" id="432c${child.cid}">
												</form>
													</div>
													<div class="fu">
										<input title="保存"
											style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;display:none;"
											class="button1" id="32c${child.cid}" onclick="childrenform(this.id)" type="button" value="保存">
										<input title="取消"
											style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;display:none;"
											id="2c${child.cid}" onclick="xiaobutton2(this.id)" class="button2" type="button" value="取消"> 
														<input title="修改分类" style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;"
														id="c${child.cid}" onclick="xianchildren(this.id)" class="2c${child.cid} button1" type="button" value="修改" >
														<a title="删除分类" style="height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;"
															class="button3" onclick="return confirm('您是否真要删除该二级分类？')"
															href="<c:url value='/admin/AdminCategoryServlet?method=deleteChild&cid=${child.cid }'/>">删除</a>
													</div></li>
													<script type="text/javascript">
													function jiaer(id) {
														var zhi = $(".ming"+id).text();
														 $(".zifen"+id).append("<li id='jiaer"+id+"' class='zi'><div class='fu' style='margin-left: 10%;width:40%;'>"+
																 "<form id='former"+id+"' action='<c:url value='/admin/AdminCategoryServlet'/>' method='post'>"+
																 "<input type='hidden' name='method' value='addChild'/>"+
																 "<input type='hidden' name='pid' value='"+zhi+"'>"+
																 "<input placeholder='请输入分类名称' autocomplete='off' style='position: absolute;width: 200px;height: 30px;margin-top:5px;'"+ 
																 "type='text' id='cnameer"+id+"' name='ercname'>"+
																 "</form></div>"+
																 "<div class='fu'><input title='保存' style='height: 35px;line-height: 31px;font-size: 15px;font-weight: 500;"+
													"id='er"+id+"' onclick='childrenform2(this.id)' class='button1' type='button' value='保存'>"+
													"<input title='取消' style='eight: 35px;line-height: 31px;font-size: 15px;font-weight: 500;border-bottom-right-radius:15px;border-top-right-radius:15px;'"+ 
														"id='jiaer"+id+"' onclick='xiaobutton3(this.id)' class='button2' type='button' value='取消'></li>");
														 $(".zifen"+id).slideDown(150);
														 $("#"+id).attr("onclick","");
														 var a = $(".i"+id).text();
															if(a==">"){
																$(".i"+id).text("∨");
															}
													}
													</script>
											</c:forEach>
										</c:otherwise>
									</c:choose>
								</ul></li>
						</c:forEach>
					</div>
				</div>
			</div>
			</li>
		</div>
	</div>
</body>
</html>