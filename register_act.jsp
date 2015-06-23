<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<%
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
String pass=request.getParameter("password");
String name=request.getParameter("name");
String tel=request.getParameter("tel");
String addr=request.getParameter("addr");
String email=request.getParameter("email");
String gender=request.getParameter("gender");
String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
if(gender!="N"){
	sql="insert into member(`username`,`password`,`name`,`tel`,`addr`,`email`,`gender`,`birth`) values ('member','"+pass+"','"+name+"','"+tel+"','"+addr+"','"+email+"','"+gender+"','"+year+"-"+month+"-"+day+"')";
	con.createStatement().execute(sql);
	response.sendRedirect("board.jsp");
}else{
	out.println("<script>alert('請選擇性別！');location.replace('http://140.135.112.140/register.jsp');</script>");
}
%>