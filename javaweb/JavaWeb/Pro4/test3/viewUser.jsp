<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="test3.User3" %>
<!DOCTYPE html>
<html>
<head>
    <title>View User Information</title>
</head>
<body>
    <h2>User Information</h2>
    <%
        // 从 application 范围中获取 User 对象
        User user = (User) application.getAttribute("user");
    %>
    <p>User ID: <%= user.getUserid() %></p>
    <p>Username: <%= user.getUsername() %></p>
    <p>Gender: <%= user.getGender() %></p>
    <p>Age: <%= user.getAge() %></p>
    <p>Member: <%= user.getMember() %></p>
</body>
</html>
