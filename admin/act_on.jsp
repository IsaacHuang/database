<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<html>
<body>
<%
request.setCharacterEncoding("UTF-8");
String new_itemname=request.getParameter("itemname");
String new_itemintro=request.getParameter("itemintro");
String new_price=request.getParameter("price");
String new_quantity=request.getParameter("quantity");
String main_title=request.getParameter("home1");
String sub_title=request.getParameter("home2");
int p= 0;
int q= 0;
//String.valueOf(price)=new_price;
try{
  p=Integer.parseInt(new_price);
  q=Integer.parseInt(new_quantity);
}catch(Exception w){
  out.print(w);
}
try{
  if(con.isClosed())
    out.print("資料庫關閉");
  else {
    sql="select * from product"; 
    ResultSet rs=con.createStatement().executeQuery(sql);
    rs.last();
    int count=rs.getRow();
    if(rs.getString("Product_name")==null){
      sql="UPDATE `product` SET `Product_name`="+'"'+new_itemname+'"'+",`Product_note`="+'"'+new_itemintro+'"'+",`Product_price`="+p+",`Product_stock`="+q+",`subtitle_1`="+'"'+main_title+'"'+",`subtitle_2`="+'"'+sub_title+'"'+" WHERE `Product_ID`="+count;
      con.createStatement().execute(sql);
      response.sendRedirect("putOn.jsp");
    }else{
      out.print("<font size=20>您尚未上傳圖片！<br>");
      out.print("請<a href='putOn.jsp'>按此重新填寫！</a></font>");
    }
    con.close();
  }
}
catch (SQLException sExec) {
  out.println(sExec);
}
%>
</body>
</html>

