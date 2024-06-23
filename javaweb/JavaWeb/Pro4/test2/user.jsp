<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="test2.User" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Information</title>
</head>
<body>

<%
    // 创建一个User对象
    User user = new User();

    // 设置用户属性值
    user.setUserId(1);
    user.setUsername("John Doe");
    user.setGender("Male");
    user.setAge(30);
    user.setMember(true);
%>

<h1>User Information</h1>
<ul>
    <li>User ID: <%= user.getUserId() %></li>
    <li>Username: <%= user.getUsername() %></li>
    <li>Gender: <%= user.getGender() %></li>
    <li>Age: <%= user.getAge() %></li>
    <li>Member: <%= user.isMember() ? "Yes" : "No" %></li>
</ul>

</body>
</html>
