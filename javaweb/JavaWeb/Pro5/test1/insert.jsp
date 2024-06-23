<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8"/>
</head>
<body>
<%
String jdbc_driver = "com.mysql.jdbc.Driver";
String db_url = "jdbc:mysql://localhost:3306/web_test?useUnicode=true&characterEncoding=UTF-8";
String user = "root";
String password = "123456";
Class.forName(jdbc_driver);
Connection conn = DriverManager.getConnection(db_url, user, password);
Statement stmt = conn.createStatement();
String sql = "INSERT INTO goods(gName,gPrice) VALUES('红米 K30Pro','2699.00')";
// 插入时使用 executeUpdate() 方法，返回插入行数
int i = stmt.executeUpdate(sql);

out.println("成功添加" + i + "行数据");
stmt.close();
conn.close();
%>
</body>
</html>
