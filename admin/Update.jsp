<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% response.setContentType("text/html;charset=UTF-8"); %>
<%@include file="db_link.jsp"%>
<html>
<style type="text/css">
body {
	background-color: #CDC0A0;
	padding-top: 15%;
}
</style>
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
	<table BORDER=1 WIDTH='100%' align='center'>
    <form name="update" action="act_update.jsp" method="post">
<%
try{
    if(con.isClosed())
    	out.print("資料庫關閉");
    else {
    	sql="select * from product"; 
      	ResultSet rs=con.createStatement().executeQuery(sql);
      	rs.last();
      	int total_content=rs.getRow();
      	out.println("<center>共"+total_content+"項商品<p>");
      	int page_num=(int)Math.ceil((double)total_content/5.0); 
      	if (page_num==0)
        	page_num=1;
      	out.println("<center>請選擇頁數");
      	for(int i=1;i<=page_num;i++){
        	out.print("<a href='index.jsp?page="+i+"'>"+i+"</a>&nbsp;");
      	}
		out.println("<p>"); 
      	String page_string = request.getParameter("page");
      	if (page_string == null) 
        	page_string = "1";  
      	Integer current_page=Integer.valueOf(page_string);
      	int start_record=(current_page-1)*5;
      	sql="SELECT * FROM product ORDER BY Product_ID DESC LIMIT ";
      	sql+=start_record+",5";
      	rs=con.createStatement().executeQuery(sql);
		int a = 0;
		while(rs.next())
		{
		   	while(a!=1)
			{
				out.println("<tr><td></td><td width='25%'>圖片</td><td width='10%'>商品名稱</td><td width='25%'>商品介紹</td><td width='10%'>商品主標題</td><td width='15%'>商品副標題</td><td width='10%'>商品價格</td><td width='5%'>數量</td><td></td></tr>");
				a = 1;
			}
			out.print("<tr><td><input type='checkbox' name='update' value='"+rs.getString("Product_ID")+"'></td>");
			//out.print("<td><img src='/database/"+rs.getString("pic_position")+"' width='100%'></td>");
        	out.print("<td><img src='/"+rs.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
        	out.println("<td><input type='text' name='Product_name' value='"+rs.getString("Product_name")+"'></input></td>");
        	out.println("<td><textarea name='Product_note'>"+rs.getString("Product_note")+"</textarea></td>");
        	out.println("<td><textarea name='home1'>"+rs.getString("subtitle_1")+"</textarea></td>");
        	out.println("<td><textarea name='home2'>"+rs.getString("subtitle_2")+"</textarea></td>");
			out.println("<td><input type='text' name='Product_price' value='"+rs.getString("Product_price")+"' size='3'></input>元</td>");
			out.println("<td><input type='text' name='Product_stock' value='"+rs.getString("Product_stock")+"' size='3'></input>罐</td>");
			out.print("<td><input type='submit' name='submit' value='更改'></td></tr>");
		}
		con.close();
    }
}
catch (SQLException sExec) {
	out.println("SQL錯誤");
}

%>