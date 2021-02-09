<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
session.removeAttribute("user_session");

session.setAttribute("login_message", "Выход произошел успешно");
%>

<script type="text/javascript">
window.location.href="http://localhost:8080/ISVP/index.jsp";
</script>