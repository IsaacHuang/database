<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String update=request.getParameter("update");
String product_name=request.getParameter("Product_name");
String product_note=request.getParameter("Product_note");
String home1=request.getParameter("home1");
String home2=request.getParameter("home2");
String product_price=request.getParameter("Product_price");
String product_stock=request.getParameter("Product_stock");
try{
  if(con.isClosed())
    out.print("資料庫關閉");
  else {
    sql="select pic_position from product where Product_ID="+update;
    ResultSet rs=con.createStatement().executeQuery(sql);
    if(rs.next()){
      sql="update product set `Product_name`='"+product_name+"',`Product_note`='"+product_note+"',`subtitle_1`='"+home1+"',`subtitle_2`='"+home2+"',`Product_price`='"+product_price+"',`product_stock`='"+product_stock+"'where `Product_ID`='"+update+"'";
      con.createStatement().execute(sql);
      con.close();
    }
    response.sendRedirect("Update.jsp");
  }
  
}
catch (SQLException sExec) {
  out.println("SQL錯誤");
}
%>