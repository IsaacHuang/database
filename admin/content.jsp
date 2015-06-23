<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<html>
<style type="text/css">
  td{
    vertical-align: middle;
    text-align: center;
  }

</style>
<body>
	<table BORDER=1 WIDTH='100%' align='center'>
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
      out.print("<a href='/admin/index.jsp?page="+i+"'>"+i+"</a>&nbsp;");
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
				out.println("<tr><td width='25%'>圖片</td><td width='10%'>商品名稱</td><td width='25%'>商品介紹</td><td width='10%'>商品主標題</td><td width='15%'>商品副標題</td><td width='10%'>商品價格</td><td width='5%'>數量</td></tr>");
				a = 1;
			}
			//out.print("<tr><td rowspan = 2><img src=/database/"+rs.getString("pic_position")+" width='70%'></td>");
      out.print("<tr><td rowspan = 2><img src='/"+rs.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
      out.println("<tr><td>"+rs.getString("Product_name")+"</td>");
			out.println("<td>"+rs.getString("Product_note")+"</td>");
      out.println("<td>"+rs.getString("subtitle_1")+"</td>");
      out.println("<td>"+rs.getString("subtitle_2")+"</td>");
			out.println("<td>"+rs.getString("Product_price")+"元</td>");
		  out.println("<td>"+rs.getString("Product_stock")+"罐</td></tr>");
		}
		con.close();
  }
}
catch (SQLException sExec) {
  out.println("SQL錯誤");
}
%>
	</table>
	</body>
</html>