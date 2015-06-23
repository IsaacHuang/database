<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<%
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
%>
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
        <h1>(๑´ڡ`๑) <span><a href="intro.jsp">Doll's House</a></span></h1>
        <br>
        <nav class="codrops-demos">
          <a class="current-demo" href="index.jsp"><font color="#AF1EBD">回到首頁</font></a>
        </nav>
      </header>
      <div class="show">
        <p align='center'>
         <form name="register" action="register_act.jsp" method="post">
         	<table border="1" text-align="center" vertical-align="middle" width="80%" padding-top="20px" align="center" vertical-align="middle">
         	<tr>
         		<td align='center' width="20%"><font size='5px' color='#AF1EBD'>密碼</font>
         		</td>

         		<td align='center' width="80%"><input type='password' size='90%' name='password' required>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>姓名</font></td>

         		<td align='center'><input type="text" size='90%' name="name" required>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>電話</font></td>

         		<td align='center'><input type="number" size="90%" name="tel" min="0000000001" max="9999999999" required>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>地址</font></td>

         		<td align='center'><input type="text" size="90%" name="addr" required>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>email</font></td>

         		<td align='center'><input type="email" size="90%" name="email" required>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>性別</font></td>

         		<td align='center'><select name="gender" required><option value="N">--請選擇--</option><option value="male">男</option><option value="female">女</option></select>
         		</td>
         	</tr>
         	<tr>
         		<td align='center'><font size='5px' color='#AF1EBD'>生日</font></td>

         		<td align='center'><select name="year" required>
         			<%
         				for(int i=1900;i<=2100;i++){
         					out.println("<option value='"+i+"'>"+i+"</option>");
         				}
         				out.println("</select><font size='3px'>年</font><select name='month' required>");
         				for(int i=1;i<=12;i++){
         					out.println("<option value='"+i+"'>"+i+"</option>");
         				}
         				out.println("</select><font size='3px'>月</font><select name='day' required>");
         				for(int i=1;i<=31;i++){
         					out.println("<option value='"+i+"'>"+i+"</option>");
         				}
         				out.println("</select><font size='3px'>日</font>");
         			%>
         		</td>
         	</tr>
          </table>
            <p align="center">
            <input type="reset" name="reset" value="清除">
            <input type="submit" name="submit" value="送出">
            </p>
         </form>
      </p>
      </div>
    </body>
</html>