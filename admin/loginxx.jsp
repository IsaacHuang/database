<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@include file="db_link.jsp"%>
<html>
<body>
	<%
    request.setCharacterEncoding("UTF-8");
	String id=request.getParameter("account");
    String pwd=request.getParameter("password");
    try{
        sql="select * from member where email ='"+id+"'and password='"+pwd+"'and username='admin'";
        ResultSet rs=con.createStatement().executeQuery(sql);
        while(rs.next()){
            session.setAttribute("username",rs.getString("username"));
            response.sendRedirect("index.jsp");
        }
    }
    catch(SQLException sExec){
        out.print("SQL錯誤");
    }
    out.print("<script>alert('您輸入的帳號密碼錯誤');location.replace('http://140.135.112.140/admin/board.jsp');</script>");

	%>
	</body>
</html>