<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>欢迎页面</title>
</head>
<body>

<%
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect("login.jsp");
    }
%>

    <h2>欢迎</h2>
    <p>欢迎您，<%= session.getAttribute("username") %>！</p>
    <form action="LogoutServlet" method="post">
        <input type="submit" value="退出">
    </form>
</body>
</html>
