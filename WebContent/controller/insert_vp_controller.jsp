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
	String ID_vosst_poezd=request.getParameter("idvp"); // заполнять нулем или лучше не заполнять
	
	Insert_Values obj_Insert_Values = new Insert_Values();
	
	obj_Insert_Values.insert_VP_into_Ch_P(ID, ID_vosst_poezd);
	
	session.setAttribute("insert_message", "Восстановительный поезд был успешно назначен!");
%>
<script type="text/javascript">
window.location.href="http://localhost:8080/ISVP/nach.jsp"
</script>
</body>
</html>