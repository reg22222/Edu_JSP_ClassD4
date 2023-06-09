<%@ page language="java" contentType="text/html; charset=EUC-KR"

pageEncoding="EUC-KR"%>

<%@ page import="java.sql.*" %>

<!DOCTYPE html>

<html>

<head>

<meta charset="EUC-KR">

<title>search2</title>

</head>

<body>

<h1>search2.jsp</h1>

<%

//============ 접속부분 ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== 검색어를 전달받는부분 =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

//=============================================================================

String search_target = request.getParameter("search_target");

ResultSet rs=null;

// search3.html 페이지로부터 전달된것을 처리할부분

if(search_target.equals("search3"))

{

//최저가,최고가 처리하는부분

String min = request.getParameter("min");

String max = request.getParameter("max");

//최저가~최고가를 검색할수있는 SQL문장

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_price>=? AND cf_price<=?");

//min, max를 숫자값으로 바꿔준후 적용한다.

int _min = Integer.valueOf(min);

int _max = Integer.valueOf(max);

stmt.setInt(1, _min);

stmt.setInt(2, _max);

rs = stmt.executeQuery(); 

}//=====================================================================

if(search_target.equals("cf_name")) //검색하려고 하는것이 cf_name인지 알아낸다.

{

//========== 문자열패턴검색 ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name LIKE ?");

stmt.setString(1, "%"+s_word+"%" );

rs = stmt.executeQuery(); 

}//=============================================================================

else

{

//========== 숫자검색 ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_price=?");

stmt.setString(1, s_word );

rs = stmt.executeQuery(); 

} 

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

%>

</body>

</html>