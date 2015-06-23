<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<% 
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
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
        <meta name="keywords" content="jmpress, slideshow, container, plugin, jquery, css3" />
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
			</style>
		</noscript>
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
					<%
					String product=request.getParameter("product");
					sql="select * from product";
					ResultSet rs=con.createStatement().executeQuery(sql);
					while(rs.next()){
						out.println("<a href=http://140.135.112.140/intro.jsp?product="+rs.getString("pic_position")+"><font color='#AF1EBD'>"+rs.getString("Product_name")+"</font></a>");
						/*out.println("<a href=http://localhost:8080/database/intro.jsp?product="+rs.getString("pic_position")+"><font color='#AF1EBD'>"+rs.getString("Product_name")+"</font></a>");*///localhost
					}
					%>
				</nav>
        <h2><marquee http-equiv=“alternate”>～～歡迎光臨娃娃屋～～</marquee>
			</header>
			<section id="jms-slideshow" class="jms-slideshow">
				<%
				sql="select * from product where pic_position='"+product+"'";
				rs=con.createStatement().executeQuery(sql);
				if(rs.next()){
					out.println("<div class='step' data-color='color-2'><div class='jms-content'><h3><font color='#AF1EBD'>"+rs.getString("Product_name")+"</font></h3><br><p><font color='#0000cd'>"+rs.getString("Product_note")+"</font></p></div><img src='"+rs.getString("pic_position")+"' /></div>");
				}else{
					out.println("<div class='step' data-color='color-2'><div class='jms-content'><h3><font color='#191970'>心動不如馬上行動</font></h3><p><font color='#0000cd'>喜歡就把我們帶走吧</font></p></div><img src='doll/intro.jpg' /></div>");
				}
				%>				
			</section>
        </div>
		<script type="text/javascript">
			$(function() {

				var jmpressOpts	= {
					animation		: { transitionDuration : '0.8s' }
				};

				$( '#jms-slideshow' ).jmslideshow( $.extend( true, { jmpressOpts : jmpressOpts }, {
					autoplay	: true,
					bgColorSpeed: '0.8s',
					arrows		: false
				}));

			});
		</script>
    </body>
</html>
