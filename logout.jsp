<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<% response.setContentType("text/html;charset=UTF-8"); 
session.removeAttribute("name");
session.removeAttribute("UID");
Cookie cookie = null;
Cookie[] cookies = null;
cookies = request.getCookies();
for (int i = 0; i < cookies.length; i++){
	cookie = cookies[i];
	if(application.getAttribute("item_"+i)!=null&&application.getAttribute("quantity-item_"+i)!=null){
		application.removeAttribute("item_"+i);
		application.removeAttribute("quantity-item_"+i);
	}
	cookie.setMaxAge(0);
	response.addCookie(cookie);
}
application.removeAttribute("order_count");
application.removeAttribute("name");
response.sendRedirect("index.jsp");
%>