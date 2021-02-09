<%@page import="java.util.Iterator"%>
<%@page import="database.Ch_P"%>
<%@page import="java.util.List"%>
<%@page import="database.Read_Values"%>
<%@page import="bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>АРМ Дежурного станции</title>
<link rel="stylesheet" type="text/css" href="css/arm.css">
</head>
<body background="images/2.gif" bgcolor="#B2D4EA">
<% 
Login_Bean obj_Login_Bean=(Login_Bean)session.getAttribute("user_session");
if(obj_Login_Bean==null){
	session.setAttribute("login_message", "Пожалуйста, авторизуйтесь");
%>
<script type="text/javascript">
		window.location.href="http://localhost:8080/ISVP/index.jsp"
	</script>
<%	
}
else
{
	String Rolele=obj_Login_Bean.getRole();
	if(Rolele.equals("Dezh")==false){
		session.setAttribute("login_message", "Пожалуйста, авторизуйтесь под корректным логином");
%>
<script type="text/javascript">
		window.location.href="http://localhost:8080/ISVP/index.jsp"
	</script>
<%	
	}
}
	%>


<div align="right">
<!-- Кнопка выхода и вывод логина -->
<table border="0">
<tr>
<td> <font size="4">Добро пожаловать, <%if(obj_Login_Bean!=null){%>
	<%=obj_Login_Bean.getFIO()%>!</font>
	<%
	}
	%>
</td>
<td> 
<a href="controller/Signoutcontroller.jsp"><font size="4">Выйти</font></a>               
</td>
</tr>
</table>
</div>
<hr>

<!-- Ввод данных для БД -->
<center>
<div class="form_nach_block" align="center">
<p class="form_auth_block_head_text">Введите следующую информацию об аварии</p>
<form action="controller/insert_controller.jsp">
<table border="0">
<tr>
	<td align="right">Номер поезда:</td>
	<td><input type="text" name="ID_poezd" required/></td>
</tr>
<tr>
	<td align="right">Широта:</td>
	<td><input type="text" name="Shirota" required/></td>
</tr>
<tr>
	<td align="right">Долгота:</td>
	<td><input type="text" name="Dolgota" required/></td>
</tr>
<tr>
	<td align="right">Характер происшествия:</td>
	<td><input type="text" name="Type_of_ch_p" required/></td>
</tr>
<tr>
	<td></td>
	<td align="right"><br><input class="rounded-input" type="submit" value="Отправить"></td>
</tr>
</table>
<%
String message=(String)session.getAttribute("insert_message");

if(message!=null){
	%>
	<p class="form_auth_block_head_text">
	<%
	out.println(message);
	session.removeAttribute("insert_message");
}

%>
</p>

</form>
</div>
</center>

</body>
</html>