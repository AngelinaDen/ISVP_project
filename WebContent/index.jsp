<%@ page language="java" contentType="text/html; charset=UTF-8" 
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ИС ВП</title>
<link rel="stylesheet" type="text/css" href="css/arm.css">
</head>
<body background="images/2.gif" bgcolor="#B2D4EA">
<div class="form_auth_block">
<font color="black" class="form_auth_block_head_text">Авторизация</font>
<center><br><br><br>
	<form action="controller/Sign_in_controller.jsp" method="post">
			
			<font class="stroke" color="white" size=5>Логин:</font><br>
			<input class="rounded-input" type="text" name="user_name" placeholder="Введите Ваш логин" required/><br>

			<font class="stroke" color="white" size=5>Пароль:</font><br>
			<input class="rounded-input" type="password" name="password" placeholder="Введите пароль" required/><br>
			<input class="rounded-input"  type="submit"  value="Войти" /><br>
		</form>
		<br>
		<br>
<%
String message=(String)session.getAttribute("login_message");

if(message!=null){
	%>
	<p class="form_auth_block_head_text">
	<%
	out.println(message);
	session.removeAttribute("login_message");
}

%>
</center>
</div>
</body>
</html>