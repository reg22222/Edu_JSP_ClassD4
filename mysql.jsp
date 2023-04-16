<%@ page language="java" contentType="text/html; charset=UTF-8"

pageEncoding="UTF-8"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="UTF-8">

<title>mysql.jsp</title>

</head>

<body>

<h1>mysql.jsp</h1>

<%

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

%>

<%

//DELETE (prepared스타일문장사용)

PreparedStatement stmt = null;

stmt = conn.prepareStatement("DELETE FROM coffee_info WHERE cf_name=?");

stmt.setString(1, "UnknownCoffee2");

stmt.executeUpdate();

//INSERT (prepared스타일문장사용)

stmt = null;

stmt = conn.prepareStatement("INSERT INTO coffee_info (cf_name,cf_price) VALUES (?,?)");

stmt.setString(1, "Americano");

stmt.setInt(2, 54000);

stmt.executeUpdate();

//UPDATE (prepared스타일문장사용)

stmt = null;

stmt = conn.prepareStatement("UPDATE coffee_info SET cf_price=5700");

stmt.executeUpdate();

%>

</body>

</html>