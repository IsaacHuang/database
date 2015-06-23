<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@page import="java.io.*"%>
<%@include file="db_link.jsp"%>
<%
request.setCharacterEncoding("UTF-8");
String clear=request.getParameter("clear");
try{
  if(con.isClosed())
    out.print("資料庫關閉");
  else {
    sql="select pic_position from product where Product_ID="+clear;
    ResultSet rs=con.createStatement().executeQuery(sql);
    if(rs.next()){
      String filePath="/"+rs.getString("pic_position");
      File myFile= new File(filePath);
      String name=myFile.getName();
      out.print("<br>"+name);
      try{
        String path="Library/Tomcat/webapps/ROOT/database/doll/";
        File del=new File(path,name);
        if(del.exists()){
          del.delete();
        }
      }catch(Exception e){
        String path="C:\\xampp\\tomcat\\webapps\\ROOT\\doll\\";
        //(此為windows檔案路徑)
        File del=new File(path,name);
        if(del.exists()){
          del.delete();
        }
      }
    }   
  }
  sql="delete from product where Product_ID="+clear;
  con.createStatement().execute(sql);
  con.close();
}
catch (SQLException sExec) {
  out.println("SQL錯誤");
}
//out.print("<a href='index.jsp'><font color=034cca size=36>回首頁</font></a>");
response.sendRedirect("putOff.jsp");
%>