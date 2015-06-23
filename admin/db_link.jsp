<%
Class.forName("com.mysql.jdbc.Driver");
String account="root";
String password="root";
String db_select="dollseller";
String url="jdbc:mysql://localhost:3306/"+db_select+"?user="+account+"&password="+password+"&useUnicode=true&characterEncoding=UTF-8";
String sql="";
Connection con=DriverManager.getConnection(url);
%>