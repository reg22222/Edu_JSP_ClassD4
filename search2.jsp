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
//�⺻ ��ݸ� �ϼ��Ѱ�



//============ ���Ӻκ� ================//

String url="jdbc:mysql://localhost:3306/coffees";

String user="root";

String password="";

Connection conn=DriverManager.getConnection(url,user,password);

//=========== �˻�� ���޹޴ºκ� =============//

String s_word = request.getParameter("search_word");

out.println("search-word: "+s_word);

String search_target = request.getParameter("search_target");

if(search_target.equals("cf_name")) //�˻��Ϸ��� �ϴ°��� cf_name���� �˾Ƴ���.

{

//========== ���ڿ����ϰ˻� ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_name LIKE ?");

stmt.setString(1, "%"+s_word+"%" );

ResultSet rs = stmt.executeQuery(); 

}


else

{
//========== ���ڰ˻� ========//

PreparedStatement stmt = null;

stmt = conn.prepareStatement("SELECT * FROM coffee_info WHERE cf_price=?");

stmt.setString(1, s_word );

ResultSet rs = stmt.executeQuery(); 

} 

%>

</body>

</html>