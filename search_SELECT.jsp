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

//============ ���Ӻκ� ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== �˻�� ���޹޴ºκ� =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

//========== �˻�� SELECT ���� �����־��ִ� �κ�(����ϼ�) ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name=?");

stmt.setString(1, s_word );

//stmt.executeUpdate(); 

ResultSet rs = stmt.executeQuery(); 

//��ºκ�(Ŀ���̸��� �ߺ��ɼ��ֱ� ������, �������� ����� ���ü��ִ�. �ݺ����� ����ؾ���)

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