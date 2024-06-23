<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Student</title>
</head>
<body>
    <h2>Delete Student</h2>
    
    <%@ page import="java.sql.*" %>

    <%
        String connectionUrl = "jdbc:sqlserver://sqlserver:1433;databaseName=XSCJ;user=sa;password=Fyy@12345678";
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionUrl);
            stmt = conn.createStatement();

            int studentID = Integer.parseInt(request.getParameter("studentID"));
            stmt.executeUpdate("DELETE FROM Students WHERE StudentID=" + studentID);
            response.sendRedirect("student.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
