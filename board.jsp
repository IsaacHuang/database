<%@ page import = "java.sql.*,java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setContentType("text/html;charset=UTF-8"); %>
<html>
<head>
<title></title>
</head>
<style type="text/css">
<!--
body {
	background-color: #CDC0A0;
	padding-top: 15%;
}
-->
</style>
<body>
		<div align="center">
			<button><a href="register.jsp"><font size='3px'>註冊會員</font></a></button>
			<p>
			<form name="Login" method="post" action="loginxx.jsp" align="center">
				帳號<input type="text" name="account" placeholder="請輸入email">
				<br>
				<br>密碼<input type="password" name="password" placeholder="密碼">
				<br><input type="submit" name="submit" value="登入">
			</form>
			</p>
		</div>
		
</body>
</html>
