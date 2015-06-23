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
					<a class="current-demo" href="index.jsp"><font color="#AF1EBD">首頁</font></a>
          			<a href="http://140.135.112.140/index.jsp?about=us"><font color="#AF1EBD">關於我們</font></a>
		  			<a href="intro.jsp"><font color="#AF1EBD">產品介紹</font></a>
          			<%
          				if(session.getAttribute("name")!=null){
          					out.println("<a href='feedback.jsp'><font color='#AF1EBD'>留言板</font></a><a href='shopcar.jsp'><font color='#AF1EBD'>購物車</font></a><a href='logout.jsp'><font color='#AF1EBD'>會員登出</font></a>");
          				}else{
          					out.println("<a href='board.jsp'><font color='#AF1EBD'>會員登入</font></a>");
          				}
          				if(session.getAttribute("name")!=null){
          					sql="select * from member where name='"+session.getAttribute("name")+"'and username='admin'";
          					ResultSet rs=con.createStatement().executeQuery(sql);
          					while(rs.next()){
          						session.setAttribute("username",rs.getString("username"));
          						out.println("<a href='admin/index.jsp'><font color='#AF1EBD'>後台管理</font></a>");
          					}
          					out.println(application.getAttribute("name")+"您好！");
          				}
          			%>
				</nav>
        <h2><marquee http-equiv="alternate">～～歡迎光臨娃娃屋～～</marquee>
			</header>
			<section id="jms-slideshow" class="jms-slideshow">
			<%
			if(request.getParameter("about")!=null){
			%>
				<div class='step' data-color='color-1' data-x='4500' data-z='1000' data-rotate-y='45' ><div class='jms-content'><h3><font color='#cd5c5c'>黃彩雲</font></h3><p><font color='#AF1EBD'>資管三乙<br>10144230<br><a id='partner' href="javascript:function FB()" target='_blank'>FB</a></font></p></div><img src='doll/10144230.jpg'/></div><div class='step' data-color='color-1' data-x='4500' data-z='1000' data-rotate-y='45'><div class='jms-content'><h3><font color='#cd5c5c'>黃翰隆</font></h3><p><font color='#AF1EBD'>資管三乙<br>10144259<br><a id='partner' href="javascript:function FB()" target='_blank'>FB</a></font></p></div><img src='doll/10144259.jpg'/></div><div class='step' data-color='color-1' data-x='4500' data-z='1000' data-rotate-y='45'><div class='jms-content'><h3><font color='#cd5c5c'>吳佩心</font></h3><p><font color='#AF1EBD'>資管二乙<br>10244247<br><a id='partner' href="javascript:function FB()" target='_blank'>FB</a></font></p></div><img src='doll/10244247.jpg'/></div>"
			<%}else{
				sql="select * from product";
				ResultSet rs=con.createStatement().executeQuery(sql);
				rs.last();
    			int count=rs.getRow();
    			sql="select * from product";
				rs=con.createStatement().executeQuery(sql);
				while(rs.next()){
					int a=Integer.parseInt(rs.getString("Product_ID"));
					if(a>5){
						a=a%5;
					}
					switch(a){
						case 1:
							out.println("<div class='step' data-color='color-2'><div class='jms-content'><h3><font color='#6495ed'>"+rs.getString("subtitle_1")+"</font></h3><p><font color='#1e90ff'>"+rs.getString("subtitle_2")+"</font></p></div><img src='"+rs.getString("pic_position")+"'/></div>");
							break;
						case 2:
							out.println("<div class='step' data-color='color-3' data-y='900' data-rotate-x='80'><div class='jms-content'><h3><font color='#ffa500'>"+rs.getString("subtitle_1")+"</font></h3><p><font color='#ff7f50'>"+rs.getString("subtitle_2")+"</font></p></div><img src='"+rs.getString("pic_position")+"'/></div>");
							break;
						case 3:
							out.println("<div class='step' data-color='color-4' data-x='-100' data-z='1500' data-rotate='170'><div class='jms-content'><h3><font color='#778899'>"+rs.getString("subtitle_1")+"</font></h3><p><font color='#808080'>"+rs.getString("subtitle_2")+"</font></p></div><img src='"+rs.getString("pic_position")+"'/></div>");
							break;
						case 4:
							out.println("<div class='step' data-color='color-5' data-x='3000'><div class='jms-content'><h3><font color='#ff1493'>"+rs.getString("subtitle_1")+"</font></h3><p><font color='#ff69b4'>"+rs.getString("subtitle_2")+"</font></p></div><img src='"+rs.getString("pic_position")+"'/></div>");
							break;
						case 5:
							out.println("<div class='step' data-color='color-1' data-x='4500' data-z='1000' data-rotate-y='45'><div class='jms-content'><h3><font color='#cd5c5c'>"+rs.getString("subtitle_1")+"</font></h3><p><font color='#AF1EBD'>"+rs.getString("subtitle_2")+"</font></p></div><img src='"+rs.getString("pic_position")+"'/></div>");
							break;
					}	
				}
			}
			%>
			</section>
        </div>
        <%
        if(request.getParameter("about")!=null){
        %>
        <script type='text/javascript'>
        	var count=0;
        	$(document).ready(
        		function(){
        			var url=["https://www.facebook.com/caiyun.huang.96","https://www.facebook.com/hanlong.huang","https://www.facebook.com/wu.p.xin.9?fref=nf"];
        			var jmpressOpts={
        					animation:{
        						transitionDuration:'0.8s'
        					}
        				};
        			$( '#jms-slideshow' ).jmslideshow(
        				$.extend( true, 
        					{jmpressOpts:jmpressOpts}, 
        					{
        						autoplay:true,
        						bgColorSpeed: '0.8s',
        						arrows:false
        					}
        				)

        			);
        			count++;
        			if(count==url.length)
        			{count=0;}
        		$("a").bind("click",function FB(){
        			location.target="_blank";
        			location.href=url[count];
        		});
        	});
        	
        </script>
        <%
    	}else{%>
    		<script type='text/javascript'>
    			$(function(){
    				var jmpressOpts= {
    					animation:{ 
    						transitionDuration : '0.8s' 
    					}
    				};
    				$( '#jms-slideshow' ).jmslideshow( 
    					$.extend( 
    						true, 
    						{ jmpressOpts:jmpressOpts}, 
    						{
    							autoplay:true,
    							bgColorSpeed: '0.8s',
    							arrows: false
    						}
    					)
    				);
    			});
    		</script>
    	<%}
        %>
    </body>
</html>
