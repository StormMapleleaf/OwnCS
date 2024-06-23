<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>乘法表</title>
</head>
<body>
<table border="1">
<% for(int i = 1; i <= 10; i++) { %>
<tr>
<% for(int j = 1; j <= i; j++) { %>
<td><%= j + " * " + i + " = " + (i * j) %></td>
<% } %>
</tr>
<% } %>
</table>
</body>
</html>