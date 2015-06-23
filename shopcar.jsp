<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
int list=1;
if(session.getAttribute("name")==null){
	out.println("<script>alert('請先登入在進行購物');location.replace('http://140.135.112.140/board.jsp');</script>");//location.replace('http://140.135.112.140/board.jsp');
}else{
	String item=request.getParameter("shopcar");
	String quantity=request.getParameter("quantity");
	String order_count=null;
	if(application.getAttribute("order_count")!=null)
	{
		order_count=(String)application.getAttribute("order_count");
	}else{
		order_count=null;
	}
	if(order_count!=null){
		Integer record=Integer.parseInt(order_count);
		list=record;
		list++;
		String order_item="item_"+list;
		if(item!=null&&quantity!=null){
			order_item="item_"+list;
			Cookie cookie = new Cookie (order_item,item);
			application.setAttribute(order_item,item);
			Cookie order_num=new Cookie("quantity-"+order_item,quantity);
			application.setAttribute("quantity-"+order_item,quantity);
			response.addCookie(cookie);
			response.addCookie(order_num);
			order_count=String.valueOf(list);
			Cookie count=new Cookie("order_count",order_count);
			response.addCookie(count);
			application.setAttribute("order_count",order_count);
		}
	}else{
		String order_item="item_"+list;
		if(item!=null&&quantity!=null){
			order_item="item_"+list;
			Cookie cookie = new Cookie (order_item,item);
			application.setAttribute(order_item,item);
			Cookie order_num=new Cookie("quantity-"+order_item,quantity);
			application.setAttribute("quantity-"+order_item,quantity);
			response.addCookie(cookie);
			response.addCookie(order_num);
			order_count=String.valueOf(list);
			Cookie count=new Cookie("order_count",order_count);
			response.addCookie(count);
			application.setAttribute("order_count",order_count);
		}
	}
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
		<script type="text/javascript" src="js/modernizr.custom.48780.js"></script>
		</script>
		<noscript>
			<style>
			.step {
				width: 100%;
				position: relative;
			}
			.step:not(.active) {
				opacity: 1;
				filter: alpha(opacity=99);
				-ms-filter: "progid:DXImageTransform.Microsoft.Alpha(opacity=99)";
			}
			.step:not(.active) a.jms-link{
				opacity: 1;
				margin-top: 40px;
			}
			.show{
				font-size:h6;
				color:blue;
			}
			td{
    			vertical-align: middle;
  			}
  			table{
  				margin-bottom: 20px;
  				padding-top: 20px;
  				border: 1;
  				text-align: center;
  				vertical-align: middle;
  				padding-left: 15px;
  				padding-right: 15px;
  			}
			</style>
		</noscript>
    </head>
    <body>
        <div class="container">
			<!-- Codrops top bar -->
            <div class="codrops-top">

            </div><!--/ Codrops top bar -->
			<header>
				<h1>(๑´ڡ`๑) <span><a href="intro.jsp">Doll's House</a></span></h1>
				<br>
				<nav class="codrops-demos">
					<a class="current-demo" href="index.jsp"><font color="#AF1EBD">回到首頁</font></a>
					<a class="current-demo" href="order.jsp"><font color="#AF1EBD">我的購物車</font></a>
					
				</nav>
        <h2><marquee http-equiv=“alternate”>～～歡迎光臨娃娃屋～～</marquee>
			</header>
			<div class="show">
    		<form name="order" action="shopcar.jsp" method="post">
    			<table border="1" text-align="center" vertical-align="middle" width="80%" padding-top="20px" align="center" vertical-align="middle">
			<%
				try{
    				if(con.isClosed())
      					out.print("資料庫關閉");
    				else {
      					sql="select * from product"; 
      					ResultSet rs=con.createStatement().executeQuery(sql);
      					rs.last();
      					int total_content=rs.getRow();
      					out.println("<font size='3px'><center>共"+total_content+"項商品<p>");
      					int page_num=(int)Math.ceil((double)total_content/5.0); 
      					if (page_num==0)
        					page_num=1;
      					out.println("<center>請選擇頁數");
      					for(int i=1;i<=page_num;i++){
        					out.print("<a href='shopcar.jsp?page="+i+"'>"+i+"</a>&nbsp;");
      					}
						out.println("<p></font>"); 
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
				  				out.println("<tr><td align='center'></td><td align='center' width='20%'><font size='5px' color='#AF1EBD'>圖片</font></td><td align='center'><font size='5px' color='#AF1EBD'>商品名稱</font></td><td align='center'><font size='5px' color='#AF1EBD'>商品價格</font></td><td align='center'><font size='5px' color='#AF1EBD'>數量</font></td><td align='center'></td></tr>");
				  				a = 1;
							}
							out.print("<tr><td align='center'><input type='radio' name='shopcar' value='"+rs.getString("Product_ID")+"'></td>");
							//out.print("<td><img src='/database/"+rs.getString("pic_position")+"' width='70%'></td>");
        					out.print("<td align='center'><img src='/"+rs.getString("pic_position")+"' width='70%'></td>");//(windows路徑)
        					out.println("<td align='center'><font size='4px'>"+rs.getString("Product_name")+"</font></td>");
							out.println("<td align='center'><font size='4px'>"+rs.getString("Product_price")+"元</font></td>");
							out.println("<td align='center'><select name='quantity'>");
							String get= rs.getString("Product_stock");
							Integer opt=Integer.valueOf(get);
							for( int i = 1 ; i <= opt ; i++ )
							{
	 							if(i==1){
	 								out.print("<option value ="+i+" selected='selected' >"+i);
	 							}else{
	 								out.print("<option value ="+i+" >"+i);
	 							}
							}
							out.println("</select><font size='4px'>個</font></td>");
							out.print("<td align='center'><input type='hidden' value='"+list+"' name='order_count'><input type='submit' name='submit' value='加入購物車'></td></tr>");
						}
						con.close();
    				}
  				}
  				catch (SQLException sExec) {
    				out.println("SQL錯誤");
  				}
			%>
			</table>
		</form>
	</div>
    </body>
</html>
