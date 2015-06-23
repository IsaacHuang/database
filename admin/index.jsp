<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("username")==null){
	out.println("<script>alert('您尚未登入');location.replace('http://140.135.112.140/admin/board.jsp');</script>");
	/*out.println("<script>alert('您尚未登入');location.replace('http://localhost:8080/database/admin/board.jsp');</script>");*///localhost測試
}
%>
<html>
<style type="text/css">
body {
	background-color: #CDC0A0;
	padding-top: 15%;
}
</style>
<head><title>後台管理</title></head>
<body>
	<div>
		<font color="0934ad" size="36"><a href="index.jsp" target="_top">HOME</a>
		<a href="putOn.jsp">商品上架</a>
		<a href="putOff.jsp">商品下架</a>
		<a href="Update.jsp">更改資料</a>
		<a href="../index.jsp">回網頁</a>
		</font>
	</div>
	<div>
		<%@include file="content.jsp"%>
	</div>
	<body>
</html>