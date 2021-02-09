<%@page import="java.util.Iterator"%>
<%@page import="database.Ch_P"%>
<%@page import="database.Poezd"%>
<%@page import="java.util.List"%>
<%@page import="database.Read_Values"%>
<%@page import="bean.Login_Bean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>АРМ Начальника ВП</title>
<link rel="stylesheet" type="text/css" href="css/arm.css">
</head>
<body background="images/2.gif" bgcolor="#B2D4EA">
<%
System.out.println("ID=");
String id = request.getParameter("id");
String ID_poezd=request.getParameter("poezd");
System.out.println(id);
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
	if(Rolele.equals("NachVP")==false){
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

List<Poezd> poezd_list=obj_Read_Values.get_poezd(ID_poezd);
List<Ch_P> list=obj_Read_Values.get_1_Ch_P(id);

Iterator<Poezd> poezd_it_list=poezd_list.iterator();
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
<div class="form_data_ch_p_block" align="center">
<p class="form_auth_block_head_text">Информация о ЧП</p>
<!-- Вывод выбранного ЧП из БД -->
<table border="1" class="tablee_Ch_P">
<tr>
			<td bgcolor="#A2B8E5">ID ЧП</td>
			<td bgcolor="#A2B8E5">ФИО дежурного</td>
			<td bgcolor="#A2B8E5">Дата</td>
			<td bgcolor="#A2B8E5">Широта</td>
			<td bgcolor="#A2B8E5">Долгота</td>
			<td bgcolor="#A2B8E5">Характер ЧП</td>
			<td bgcolor="#A2B8E5">Ж/Д объекты</td>
			<td bgcolor="#A2B8E5">Хоз. объекты</td>
			<td bgcolor="#A2B8E5">Номер поезда</td>
</tr>
<!-- Вывод строки из таблицы Ch_P -->
<%
while(it_list.hasNext()){
	Ch_P obj_Ch_P=new Ch_P();
	obj_Ch_P=it_list.next();
	
%>
		<tr>
			<td><%=obj_Ch_P.getID() %></td>
			<td><%=obj_Ch_P.getName_dejurniy() %></td>
			<td><%=obj_Ch_P.getDate() %></td>
			<td><%=obj_Ch_P.getShirota() %></td>
			<td><%=obj_Ch_P.getDolgota() %></td>
			<td><%=obj_Ch_P.getType_of_ch_p() %></td>
			<td><%=obj_Ch_P.getZh_d_objects() %></td>
			<td><%=obj_Ch_P.getHoz_objects() %></td>
			<td><%=obj_Ch_P.getID_poezd() %></td>
		</tr>
<%	
}
 %>
</table>

<br><br><br>

<!-- Вывод поезда попавшего в выбранное ЧП из БД -->
<table border="1" class="tablee_Ch_P">
<tr>
			<td bgcolor="#A2B8E5">Номер поезда</td>
			<td bgcolor="#A2B8E5">Таб. номер машиниста</td>
			<td bgcolor="#A2B8E5">ФИО машиниста</td>
			<td bgcolor="#A2B8E5">Тип поезда</td>
			<td bgcolor="#A2B8E5">Вагоны</td>
			<td bgcolor="#A2B8E5">Кол-во вагонов</td>
			<td bgcolor="#A2B8E5">Грузы</td>
</tr>
<!-- здесь надо добавить связь с БД, вывести таблицу Poezd -->
<%
while(poezd_it_list.hasNext()){
	Poezd obj_Poezd=new Poezd();
	obj_Poezd=poezd_it_list.next();
	
%>
		<tr>
			<td><%=obj_Poezd.getID() %></td>
			<td><%=obj_Poezd.getTab_num() %></td>
			<td><%=obj_Poezd.getMashinist() %></td>
			<td><%=obj_Poezd.getType_poezd() %></td>
			<td><%=obj_Poezd.getVagon() %></td>
			<td><%=obj_Poezd.getKolichestvo_vagonov() %></td>
			<td><%=obj_Poezd.getGruz() %></td>
		</tr>
<%	
}
 %>
</table>
<br><a href="http://localhost:8080/ISVP/controller/accept_Ch_P.jsp?id=<%=id%>">Принять вызов</a><br>
<form action=http://localhost:8080/ISVP/nachVP.jsp>
	<center><input class="rounded-input" type="submit" value="Назад" /><br></center>
</form>
</div>

</center>
</body>
</html>