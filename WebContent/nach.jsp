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
<%
Read_Values obj_Read_Values = new Read_Values();

List<Ch_P> list=obj_Read_Values.get_values();

Iterator<Ch_P> it_list=list.iterator();
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
<p class="form_auth_block_head_text">Выберите ЧП для вывода подробной информации</p>
<form action="data_Ch_P.jsp" method="post">
<!-- Вывод значений из БД -->
<table border="1" class="tablee">
<tr>
			<td bgcolor="#A2B8E5"></td>
			<td bgcolor="#A2B8E5">ID ЧП</td>
			<td bgcolor="#A2B8E5">Широта</td>
			<td bgcolor="#A2B8E5">Долгота</td>
			<td bgcolor="#A2B8E5">Характер ЧП</td>
</tr>
<%

while(it_list.hasNext()){
	Ch_P obj_Ch_P=new Ch_P();
	obj_Ch_P=it_list.next();
	
%>
		<tr>
			<!-- <td><input type="radio" name="IDD" value="${obj_Ch_P.getID()}"></td> -->
			<td><a href="data_Ch_P.jsp?id=<%=obj_Ch_P.getID()%>&poezd=<%=obj_Ch_P.getID_poezd()%>">Назначить</a></td>
			<td><%=obj_Ch_P.getID() %></td>
			<td><%=obj_Ch_P.getShirota() %></td>
			<td><%=obj_Ch_P.getDolgota() %></td>
			<td><%=obj_Ch_P.getType_of_ch_p() %></td>
		</tr>
<%	
}
%>
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
	</form>
	</div>
 </center>
</body>
</html>