<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="test3.User3" %>
<!DOCTYPE html>
<html>
<head>
    <title>Set User Information</title>
</head>
<body>
    <%
        // 创建并设置 User 对象
        User user = new User();
        user.setUserid(1);
        user.setUsername("JohnDoe");
        user.setGender("Male");
        user.setAge(30);
        user.setMember(true);

        // 将 User 对象放入 application 范围
        application.setAttribute("user", user);
    %>

    <h2>User Information Set</h2>
    <p>User information has been set in the application scope.</p>
</body>
</html>
