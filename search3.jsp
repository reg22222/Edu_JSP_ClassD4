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

//============ ���Ӻκ� ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== �˻�� ���޹޴ºκ� =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

//=============================================================================

String search_target = request.getParameter("search_target");

ResultSet rs=null;

// search3.html �������κ��� ���޵Ȱ��� ó���Һκ�

if(search_target.equals("search3"))

{

//������,�ְ� ó���ϴºκ�

String min = request.getParameter("min");

String max = request.getParameter("max");

//������~�ְ��� �˻��Ҽ��ִ� SQL����

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_price>=? AND cf_price<=?");

//min, max�� ���ڰ����� �ٲ����� �����Ѵ�.

int _min = Integer.valueOf(min);

int _max = Integer.valueOf(max);

stmt.setInt(1, _min);

stmt.setInt(2, _max);

rs = stmt.executeQuery(); 

}//=====================================================================

if(search_target.equals("cf_name")) //�˻��Ϸ��� �ϴ°��� cf_name���� �˾Ƴ���.

{

//========== ���ڿ����ϰ˻� ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name LIKE ?");

stmt.setString(1, "%"+s_word+"%" );

rs = stmt.executeQuery(); 

}//=============================================================================

else

{

//========== ���ڰ˻� ========//

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