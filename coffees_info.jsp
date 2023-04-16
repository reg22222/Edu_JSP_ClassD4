<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="UTF-8"%>
       <%@ page import="java.sql.*" %>
    <%@ page import="javax.sql.*" %>
    <%@ page import="javax.naming.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>coffees_info.jsp</title>
</head>
<body>
	<h1>coffees_info.jsp</h1>
	
<%
String url = "jdbc:mysql://localhost:3306/coffees";
String user = "root";
String password = "";
Connection conn = DriverManager.getConnection(url,user,password);
%>
	
	<% 
	PreparedStatement stmt1 = null;
	stmt1 = conn.prepareStatement("DELETE FROM coffee_info WHERE cf_name='Americano'");
	
%>


</body>
</html>