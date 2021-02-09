<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<%@page import="modal.Login_Modal" %>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="obj_Login_Bean" class="bean.Login_Bean"></jsp:useBean>
<jsp:setProperty property="*" name="obj_Login_Bean"/>

<% 
System.out.println(obj_Login_Bean.getUser_name());
System.out.println(obj_Login_Bean.getPassword());

Login_Modal Obj_Login_Modal=new Login_Modal();

boolean flag=Obj_Login_Modal.check_user_name(obj_Login_Bean);

if(flag){
	session.setAttribute("user_session", obj_Login_Bean);
	if(obj_Login_Bean.getRole().equals("Nach")){
	%>
	<script type="text/javascript">
		window.location.href="http://localhost:8080/ISVP/nach.jsp";
	</script>
<%
	} else if(obj_Login_Bean.getRole().equals("Dezh")) {
		%>
		<script type="text/javascript">
			window.location.href="http://localhost:8080/ISVP/dezh.jsp";
		</script>
	<%
	} else if(obj_Login_Bean.getRole().equals("NachVP")) {
		%>
		<script type="text/javascript">
			window.location.href="http://localhost:8080/ISVP/nachVP.jsp";
		</script>
	<%
	}
}else{
	session.setAttribute("login_message", "Неправильный логин и/или пароль");
%>
	<script type="text/javascript">
		window.location.href="http://localhost:8080/ISVP/index.jsp"
	</script>
<%
}

%>

</body>
</html>