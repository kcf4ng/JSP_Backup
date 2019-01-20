<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8" session="true" import="java.util.*,java.text.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn"   uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<sql:setDataSource 	driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" 
							url="jdbc:sqlserver://52.246.164.133:1433;databaseName=northwind;" 
							user="lnb" 
							password="lnb" 
	/> 

<sql:query var="result" >
 select *  from vote2
</sql:query>

<table>
<tr><td>地點</td><td>得票</td></tr>


	<c:forEach var="row" items="${result.rows}">
     	<tr>
   				<td>${row.Place}</td> 
				<td>${row.vote }</td>

		</tr>
	</c:forEach>
</table>

<ul><li> <a href="Vote.html">再投一次</a></li></ul>
</body>
</html>