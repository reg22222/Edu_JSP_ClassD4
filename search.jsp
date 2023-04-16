<%@ page language="java" contentType="text/html; charset=EUC-KR"

pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="EUC-KR">

<title>Insert title here</title>

</head>

<body>

<%

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//String s_word = request.getParameter("search_word");

//out.println("search-word: "+s_word);

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery("SELECT * FROM coffee_info");

while (rs.next()) {

out.println("<hr size='3'>");

out.println("<b>Coffee Name:</b> " + rs.getString("cf_name") + "<br>");

out.println("<b>Price:</b> " + rs.getString("cf_price") + "<br>");

out.println("<br>");

}

%>

</body>

</html>