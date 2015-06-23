<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
if(session.getAttribute("name")==null){
  out.println("<script>alert('請先登入在進行購物');location.replace('http://140.135.112.140/board.jsp');</script>");//location.replace('http://140.135.112.140/board.jsp');
}
%>
<%@include file="db_link.jsp"%>
<!DOCTYPE html>
<html lang="en">
    <head>
    <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>database</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta name="description" content="Slideshow with jmpress.js" />
        <meta name="author" content="for Codrops" />
        <link rel="shortcut icon" href="../favicon.ico">
        <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:700,300,300italic' rel='stylesheet' type='text/css'>
        <link rel="stylesheet" type="text/css" href="css/demo.css" />
        <link rel="stylesheet" type="text/css" href="css/style.css" />
    <!--[if lt IE 9]>
    <link rel="stylesheet" type="text/css" href="css/style_ie.css" />
    <![endif]-->
    <!-- jQuery -->
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
    <!-- jmpress plugin -->
    <script type="text/javascript" src="js/jmpress.min.js"></script>
    <!-- jmslideshow plugin : extends the jmpress plugin -->
    <script type="text/javascript" src="js/jquery.jmslideshow.js"></script>
    <script type="text/javascript" src="js/modernizr.custom.48780.js">
    </script>
    </head>
    <body>
        <div class="container">
      <!-- Codrops top bar -->
            <div class="codrops-top">

            </div><!--/ Codrops top bar -->
      <header>
        <h1>(๑´ڡ`๑) <span>Doll's House</span></h1>
        <br>
        <nav class="codrops-demos">
          <a class="current-demo" href="index.jsp"><font color="#AF1EBD">回到首頁</font></a>
          <a class="current-demo" href="shopcar.jsp"><font color="#AF1EBD">繼續購物</font></a>
          
        </nav>
        <h2><marquee http-equiv=“alternate”>～～歡迎光臨娃娃屋～～</marquee>
      </header>
      <div class="show">
          <p align='center'>
          <table border="1" text-align="center" vertical-align="middle" width="80%" padding-top="20px" align="center" vertical-align="middle">
      <%
        Cookie cookie = null;
        Cookie[] cookies = null;
        int count=0;
        int sales=0;
        int total=0;
        int price=0;
        // Get an array of Cookies associated with this domain
        cookies = request.getCookies();
        out.println("<tr><td align='center' width='20%'><font size='5px' color='#AF1EBD'>圖片</font></td><td align='center'><font size='5px' color='#AF1EBD'>商品名稱</font></td><td align='center'><font size='5px' color='#AF1EBD'>數量</font></td><td align='center'><font size='5px' color='#AF1EBD'>小計</font></td></tr>");
        if( cookies != null ){
          for (int i = 0; i < cookies.length; i++){
            cookie = cookies[i];
            if(application.getAttribute("item_"+i)!=null&&application.getAttribute("quantity-item_"+i)!=null){
              String product_ID=(String)application.getAttribute("item_"+i);
              String quantity=(String)application.getAttribute("quantity-item_"+i);
              count=Integer.parseInt(quantity);
              sql="select * from product where Product_ID='"+product_ID+"'"; 
              ResultSet rs=con.createStatement().executeQuery(sql);
              while(rs.next()){
                String dollar=(String)rs.getString("Product_price");
                price=Integer.parseInt(dollar);
                //out.print("<tr><td align='center'><img src='/database/"+rs.getString("pic_position")+"' width='70%'></td>");
                out.print("<td align='center'><img src='/"+rs.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
                out.println("<td align='center'><font size='4px'>"+rs.getString("Product_name")+"</font></td>");
                out.println("<td align='center'><font size='4px'>"+quantity+"個</font></td>");
                sales=count*price;
                total=total+sales;
                out.println("<td align='center'><font size='4px'>"+sales+"元</font></td></tr>");
              }
            }
          }
          if(application.getAttribute("order_count")!=null){
            String total_count=(String)application.getAttribute("order_count");
            int total_content=Integer.parseInt(total_count);
            sql="select * from cart where member_no='"+session.getAttribute("UID")+"' and checked='N'";
            ResultSet rs=con.createStatement().executeQuery(sql);
            while(rs.next()){
              total_content++;
              sql="select * from product where Product_name='"+rs.getString("products")+"'";
              ResultSet results=con.createStatement().executeQuery(sql);
              while(results.next()){
                //out.print("<tr><td align='center'><img src='/database/"+results.getString("pic_position")+"' width='70%'></td>");
                out.print("<td align='center'><img src='/"+results.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
              }
              out.println("<td align='center'><font size='4px'>"+rs.getString("products")+"</font></td>");
              out.println("<td align='center'><font size='4px'>"+rs.getString("quantity")+"個</font></td>");
              out.println("<td align='center'><font size='4px'>"+rs.getString("check_price")+"元</font></td></tr>");
              String check_price=(String)rs.getString("check_price");
              sales=Integer.parseInt(check_price);
              total=total+sales;
            }
            total_count=Integer.toString(total_content);
            application.setAttribute("order_count",total_count);
            out.println("<font size='3px'><center>共買了"+total_content+"項商品<p>");
            int page_num=(int)Math.ceil((double)total_content/5.0); 
            if (page_num==0)
              page_num=1;
            out.println("<center>請選擇頁數");
            for(int i=1;i<=page_num;i++){
              out.print("<a href='order.jsp?page="+i+"'>"+i+"</a>&nbsp;");
            }
            out.println("<p></font>"); 
            String page_string = request.getParameter("page");
            if (page_string == null) 
              page_string = "1";  
            Integer current_page=Integer.valueOf(page_string);
            int start_record=(current_page-1)*5;
          }else{
            int total_content=0;
            sql="select * from cart where member_no='"+session.getAttribute("UID")+"' and checked='N'";
            ResultSet rs=con.createStatement().executeQuery(sql);
            while(rs.next()){
              total_content++;
              sql="select * from product where Product_name='"+rs.getString("products")+"'";
              ResultSet results=con.createStatement().executeQuery(sql);
              while(results.next()){
                //out.print("<tr><td align='center'><img src='/database/"+results.getString("pic_position")+"' width='70%'></td>");
                out.print("<td align='center'><img src='/"+results.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
              }
              out.println("<td align='center'><font size='4px'>"+rs.getString("products")+"</font></td>");
              out.println("<td align='center'><font size='4px'>"+rs.getString("quantity")+"個</font></td>");
              out.println("<td align='center'><font size='4px'>"+rs.getString("check_price")+"元</font></td></tr>");
              String check_price=(String)rs.getString("check_price");
              sales=Integer.parseInt(check_price);
              total=total+sales;
            }
            String total_count=Integer.toString(total_content);
            application.setAttribute("order_count",total_count);
            out.println("<font size='3px'><center>共買了"+total_content+"項商品<p>");
            int page_num=(int)Math.ceil((double)total_content/5.0); 
            if (page_num==0)
              page_num=1;
            out.println("<center>請選擇頁數");
            for(int i=1;i<=page_num;i++){
              out.print("<a href='order.jsp?page="+i+"'>"+i+"</a>&nbsp;");
            }
            out.println("<p></font>"); 
            String page_string = request.getParameter("page");
            if (page_string == null) 
              page_string = "1";  
            Integer current_page=Integer.valueOf(page_string);
            int start_record=(current_page-1)*5;
          }
        }
      %>
      </table>
      </p>
      </div>
        <form name="order" action="order_act.jsp" method="post">
          <table border="1" text-align="center" vertical-align="middle" width="80%" padding-top="20px" align="center" vertical-align="middle">
            <tr><td align='center'><font size='5px' color='#AF1EBD'>購買人</font></td><td align='center'><font size='5px' color='#AF1EBD'>付款方式</font></td><td align='center'><font size='5px' color='#AF1EBD'>收件人</font></td><td align='center'><font size='5px' color='#AF1EBD'>收件地址</font></td><td align='center'><font size='5px' color='#AF1EBD'>聯絡電話</font></td><td align='center'><font size='5px' color='#AF1EBD'>購買總額</font></td></tr>
          <%
            out.println("<tr><td align='center'><font size='5px'>"+session.getAttribute("name")+"<input type='hidden' value='"+session.getAttribute("name")+"' name='order_man' required></font></td><td align='center'><font size='5px'><select name='pay_way'><option value='ATM' selected='selected'>ATM轉帳<option value='post'>郵局劃撥<option value='home'>貨到付款<option value='credit'>信用卡付款</select></font></td><td align='center'><font size='5px'><input type='text' name='receiver' size='5' required></font></td><td align='center'><font size='5px'><input type='text' name='receiver_address' size='10' required></font></td><td align='center'><font size='5px'><input type='text' name='receiver_tel' size='10' required></font></td><td align='center'><font size='5px'>"+total+"元</font><input type='hidden' name='total_price' value='"+total+"' required></td></tr>");
          %>
          </table>
            <p align="center">
            <input type="submit" name="check" value="結帳">
            <input type="submit" name="store" value="儲存清單">
            </p>
        </form>
      </p>
    </body>
</html>
