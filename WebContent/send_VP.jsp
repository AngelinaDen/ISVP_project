<%@page import="database.Vosst_Poezd"%>
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
<title>АРМ Начальника станции ВП</title>
<link rel="stylesheet" type="text/css" href="css/arm.css">
</head>
<body background="images/2.gif" bgcolor="#B2D4EA">
<center>
<% 
	String id = request.getParameter("id");
%>
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
	if(Rolele.equals("Nach")==false){
		session.setAttribute("login_message", "Пожалуйста, авторизуйтесь под корректным логином");
%>
<script type="text/javascript">
		window.location.href="http://localhost:8080/ISVP/index.jsp"
	</script>
<%
	}
}
	%>
</center>

 <%
Read_Values obj_Read_Values = new Read_Values();

List<Vosst_Poezd> list=obj_Read_Values.get_vosst_poezda();

Iterator<Vosst_Poezd> it_list=list.iterator();
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

<center>
<div class="form_nach_block" align="center">
<p class="form_auth_block_head_text">Выберите бригаду ВП, чтобы отправить её на устранение ЧП</p>
<!-- Вывод значений из БД -->
<table border="1" class="tablee_Ch_P">
<tr>
			<td bgcolor="#A2B8E5"></td>
			<td bgcolor="#A2B8E5">Номер восст. поезда</td>
			<td bgcolor="#A2B8E5">ФИО начальника восст. поезда</td>
			<td bgcolor="#A2B8E5">Тип восст. поезда</td>
</tr>
<%

while(it_list.hasNext()){
	Vosst_Poezd obj_Vosst_Poezd=new Vosst_Poezd();
	obj_Vosst_Poezd=it_list.next();
	
%>
		<tr>
			<td><a href="http://localhost:8080/ISVP/controller/insert_vp_controller.jsp?id=<%=request.getParameter("id")%>&idvp=<%=obj_Vosst_Poezd.getID()%>">Назначить</a></td>
			<td><%=obj_Vosst_Poezd.getNumber_poezd() %></td>
			<td><%=obj_Vosst_Poezd.getName_nachalnik_poezda() %></td>
			<td><%=obj_Vosst_Poezd.getType_poezd() %></td>
		</tr>
<%	
}
 %>
 </table>
 <br><form action=http://localhost:8080/ISVP/nach.jsp>
	<input class="rounded-input"  type="submit"  value="Отмена" /><br>
</form>
</div>
 </center>
</body>
</html>