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
//기본 골격만 완성한것



//============ 접속부분 ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== 검색어를 전달받는부분 =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

String search_target = request.getParameter("search_target");

if(search_target.equals("cf_name")) //검색하려고 하는것이 cf_name인지 알아낸다.

{

//========== 문자열패턴검색 ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name LIKE ?");

stmt.setString(1, "%"+s_word+"%" );

ResultSet rs = stmt.executeQuery(); 

}


else

{
//========== 숫자검색 ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_price=?");

stmt.setString(1, s_word );

ResultSet rs = stmt.executeQuery(); 

} 

%>

</body>

</html>