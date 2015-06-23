<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.sql.*,java.util.*"%>
<%@include file="db_link.jsp"%>
<html>
<body>
<%
response.setContentType("text/html;charset=UTF-8");
request.setCharacterEncoding("UTF-8");
String order_man=request.getParameter("order_man");
String pay_way=request.getParameter("pay_way");
String receiver=request.getParameter("receiver");
String receiver_address=request.getParameter("receiver_address");
String receiver_tel=request.getParameter("receiver_tel");
String total_price=request.getParameter("total_price");
String check=request.getParameter("check");
//out.println("check:"+check);
String store=request.getParameter("store");
//out.println("store:"+store);
Cookie cookie = null;
Cookie[] cookies = null;
int count=0;
int sales=0;
int total=0;
int price=0;
// Get an array of Cookies associated with this domain
cookies = request.getCookies();
if( cookies != null ){
	for (int i = 0; i < cookies.length; i++){
		cookie = cookies[i];
		if(application.getAttribute("item_"+i)!=null&&application.getAttribute("quantity-item_"+i)!=null){
			String product_ID=(String)application.getAttribute("item_"+i);String quantity=(String)application.getAttribute("quantity-item_"+i);
			count=Integer.parseInt(quantity);
			sql="select * from product where Product_ID='"+product_ID+"'";
			ResultSet rs=con.createStatement().executeQuery(sql);
			while(rs.next()){
				String dollar=(String)rs.getString("Product_price");
				price=Integer.parseInt(dollar);
				sales=count*price;//小計
				total=total+sales;
				try{
					sql="insert into `Cart`(`member_no`,`products`,`quantity`,`check_price`,`checked`) values('"+session.getAttribute("UID")+"','"+rs.getString("Product_name")+"','"+count+"','"+sales+"','N')";
					con.createStatement().execute(sql);
				}catch (SQLException sExec){
					out.println(sExec);
				}
			}
			application.removeAttribute("item_"+i);
			application.removeAttribute("quantity-item_"+i);
			application.removeAttribute("order_count");
		}
		cookie.setMaxAge(0);
		response.addCookie(cookie);
	}
}
if(check!=null){
	sql="select * from member where name='"+order_man+"'";
	ResultSet rs=con.createStatement().executeQuery(sql);
	while(rs.next()){
		sql="INSERT INTO `order_form`( `member_ID` , `price`,`pay_way`,`receiver_name`,`receiver_address`,`receiver_tel`) VALUES ('"+rs.getString("no")+"','"+total_price+"','"+pay_way+"','"+receiver+"','"+receiver_address+"','"+receiver_tel+"')";
		con.createStatement().execute(sql);
		sql="select * from cart where member_no='"+rs.getString("no")+"' and checked='N'";
		rs=con.createStatement().executeQuery(sql);
		while(rs.next()){
			sql="update `Cart` set `checked`='Y' where id='"+rs.getString("id")+"'";
			con.createStatement().execute(sql);
		}
	}
}
response.sendRedirect("index.jsp");
%>
</body>
</html>

