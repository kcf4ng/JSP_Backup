<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" session="true" import="java.util.*,java.text.*,java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Result</title>
</head>
<body>

<%

Connection con = null;
try {
	Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
	con = DriverManager.getConnection("jdbc:sqlserver://52.246.164.133:1433;database=northwind", "lnb",
			"lnb");
} catch (Exception e) {
	out.println("無法連結資料庫");
}

String sql = "select vote from vote2 where id = "+request.getParameter("place"); 

PreparedStatement pst = con.prepareStatement(sql);

ResultSet rs= pst.executeQuery();

while(rs.next()){
//out.println("<table><tr><td>"+rs.getObject("vote")+"</td></tr></table>");
	String str1 = rs.getString("vote");
	int i = Integer.parseInt(str1);
	i = i+1;
	String str2 =  Integer.toString(i);
	out.println("<table><tr><td>"+str2+"</td></tr></table>");
    String sql2 = "update vote2 set vote="+str2+ "where id ="+request.getParameter("place"); 	
    PreparedStatement pst2 = con.prepareStatement(sql2);
    pst2.executeUpdate();
    response.sendRedirect("TotalVote.jsp");
}
%>




<% 
/*
String str1 = rs.getString("vote");
int i = Integer.parseInt(str1);
i = i+1;
String str2 =  Integer.toString(i);
out.println("<table><tr><td>"+str1+"</td></tr></table>");
/*
String sql2 = "update vote2 set vote=220  where id = 1"; 

PreparedStatement pst2 = con.prepareStatement(sql2);

pst.executeUpdate();

/*
int getvote = rs.getInt("vote");

getvote = getvote + 1 ;

String strVote = Integer.toString(getvote);

String sql2 = "update vote set vote=' "+strVote+"from vote where id = "+ request.getParameter("place"); 

pst.executeUpdate(sql2);
*/

%>

</body>
</html>