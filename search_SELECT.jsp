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

//============ 접속부분 ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== 검색어를 전달받는부분 =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

//========== 검색어를 SELECT 문에 끼워넣어주는 부분(문장완성) ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name=?");

stmt.setString(1, s_word );

//stmt.executeUpdate(); 

ResultSet rs = stmt.executeQuery(); 

//출력부분(커피이름은 중복될수있기 때문에, 여러개의 결과가 나올수있다. 반복문을 사용해야함)

out.println("<table border='1'>");

out.println("<tr><td>Coffee Name</td><td>Price</td></tr>");

while (rs.next()) { 

out.println("<tr>"); 

out.println("<td>");

out.println(rs.getString("cf_name"));

out.println("</td>"); 

out.println("<td>");

out.println(rs.getString("cf_price"));

out.println("</td>"); 

out.println("</tr>");

} 

out.println("</table>");

/*

Statement stmt = conn.createStatement();

ResultSet rs = stmt.executeQuery("SELECT * FROM coffee_info");

out.println("<table border='1'>");

out.println("<tr><td>Coffee Name</td><td>Price</td></tr>");

while (rs.next()) { 

out.println("<tr>"); 

out.println("<td>");

out.println(rs.getString("cf_name"));

out.println("</td>"); 

out.println("<td>");

out.println(rs.getString("cf_price"));

out.println("</td>"); 

out.println("</tr>");

} 

out.println("</table>");

*/

%>

</body>

</html>