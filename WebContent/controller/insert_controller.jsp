<%@page import="java.lang.Math"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.Timestamp"%>
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
	Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("user_session");

	String ID_poezd=request.getParameter("ID_poezd");
	String Shirota=request.getParameter("Shirota");
	String Dolgota=request.getParameter("Dolgota");
	String Type_of_ch_p=request.getParameter("Type_of_ch_p");
	String Name_dejurniy=obj_Login_Bean.getFIO();
	java.sql.Timestamp date = new java.sql.Timestamp(System.currentTimeMillis());
	int ID_objects=1 + (int)(Math.random() * 5);
	
	System.out.println(ID_objects);
	
	System.out.println(date.toString());
	
	Insert_Values obj_Insert_Values = new Insert_Values();
	
	obj_Insert_Values.insert_values(ID_poezd, Shirota, Dolgota, Type_of_ch_p, Name_dejurniy, date, ID_objects);
	
	session.setAttribute("insert_message", "Информация была успешно отправлена!");
%>
<script type="text/javascript">
window.location.href="http://localhost:8080/ISVP/dezh.jsp"
</script>
</body>
</html>