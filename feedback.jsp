<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<%
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
String title=request.getParameter("title");
String message=request.getParameter("message");
if(session.getAttribute("name")==null){
  out.println("<script>alert('請先登入在留言');location.replace('http://140.135.112.140/board.jsp');</script>");//location.replace('http://140.135.112.140/board.jsp');
}else{
  if(title!=null&&message!=null){
    sql="select * from member where no='"+session.getAttribute("UID")+"'";
    ResultSet rs=con.createStatement().executeQuery(sql);
    while(rs.next()){
      sql="insert into `guestbook` (`owner`,`email`,`title`,`content`)values ('"+rs.getString("name")+"','"+rs.getString("email")+"','"+title+"','"+message+"')";
      con.createStatement().execute(sql);
    }
  }
}
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
        <h2><marquee http-equiv=“alternate”>～～歡迎光臨娃娃屋～～</marquee>
      </header>
      <div class="show">
          <p align='center'>
          <table border="1" text-align="center" vertical-align="middle" width="80%" padding-top="20px" align="center" vertical-align="middle">
      <%
        out.println("<tr><td align='center' width='20%'><font size='5px' color='#AF1EBD'>留言人姓名</font></td><td align='center'><font size='5px' color='#AF1EBD'>主旨</font></td><td align='center'><font size='5px' color='#AF1EBD'>內容</font></td><td align='center'><font size='5px' color='#AF1EBD'>時間</font></td></tr>");
        sql="select * from guestbook"; 
        ResultSet rs=con.createStatement().executeQuery(sql);
        rs.last();
        int total_content=rs.getRow();
        out.println("<center>共"+total_content+"項留言<p>");
        int page_num=(int)Math.ceil((double)total_content/5.0); 
        if (page_num==0)
          page_num=1;
        out.println("<center>請選擇頁數");
        for(int i=1;i<=page_num;i++){
          out.print("<a href='feedback.jsp?page="+i+"'>"+i+"</a>&nbsp;");
        }
        out.println("<p>"); 
        String page_string = request.getParameter("page");
        if (page_string == null) 
          page_string = "1";  
        Integer current_page=Integer.valueOf(page_string);
        int start_record=(current_page-1)*5;
        sql="SELECT * FROM guestbook ORDER BY time DESC LIMIT ";
        sql+=start_record+",5";
        rs=con.createStatement().executeQuery(sql);
        int a = 0;
        sql="select * from guestbook";
        rs=con.createStatement().executeQuery(sql);
        while(rs.next()){
          out.println("<tr><td align='center' width='20%'><font size='5px'>"+rs.getString("owner")+"</font></td><td align='center'><font size='5px'>"+rs.getString("title")+"</font></td><td align='center'><font size='5px'>"+rs.getString("content")+"</font></td><td align='center'><font size='5px'>"+rs.getString("time")+"</font></td></tr>");
        }
      %>
      </table>
      </p>
      </div>
        <form name="feedback" action="feedback.jsp" method="post">
          <p align="center">
            主旨：<input type='text' size='20' name='title'><br><br>
            內容：<textarea name='message' size='50'></textarea><br>
            <input type='submit' name='submit' value='留言'>
          </p>
        </form>
      </p>
    </body>
</html>
