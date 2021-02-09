<%@page import="java.sql.Date"%>
<%@page import="database.Insert_Values"%>
<%@page import="bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String ID=request.getParameter("id");
	
	Insert_Values obj_Insert_Values = new Insert_Values();
	
	obj_Insert_Values.insert_vizov_prinyat(ID);
	
	session.setAttribute("insert_message", "Вызов был успешно принят!");
%>
<script type="text/javascript">
window.location.href="http://localhost:8080/ISVP/nachVP.jsp"
</script>
</body>
</html>