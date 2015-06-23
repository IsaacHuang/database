<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Class.forName("com.mysql.jdbc.Driver");
String account="root";
String password="root";
String db_select="dollseller";
String url="jdbc:mysql://localhost/"+db_select+"?user="+account+"&password="+password+"&useUnicode=true&characterEncoding=utf-8";
String sql="";
Connection con=DriverManager.getConnection(url);
%>