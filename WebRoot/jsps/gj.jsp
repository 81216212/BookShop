<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <title>组合查询</title>
<style type="text/css">
	table {
		color: #404040;
		font-size: 10pt;
	}
	.soubutt{
		position: absolute;
    background: none;
    border: none;
    height: 25px;
    line-height:25px;
    padding: 0 10px;
    color: #FFF;
    background-color: #44a5ff;
    -webkit-border-radius: 20px;
    -moz-border-radius: 20px;
    -ms-border-radius: 20px;
    -o-border-radius: 20px;
    border-radius: 20px;
    font-size: 12px;
    cursor: pointer;
    font-family: 'Microsoft Yahei', 'PingFang SC';
	}
</style>
  </head>
  
  <body>
  <form action="<c:url value='/BookServlet'/>" method="get">
  	<input type="hidden" name="method" value="findByCombination"/>
<table align="center">
	<tr>
		<td>书名：</td>
		<td><input type="text" name="bname"/></td>
	</tr>
	<tr>
		<td>作者：</td>
		<td><input type="text" name="author"/></td>
	</tr>
	<tr>
		<td>出版社：</td>
		<td><input type="text" name="press"/></td>
	</tr>
	<tr>
		<td>&nbsp;</td>
		<td>
			<input class="soubutt" type="submit" value="搜　　索"/>
			<input class="soubutt" style="margin-left: 85px;" type="reset" value="重新填写"/>
		</td>
	</tr>
</table>
	</form>
  </body>
</html>
