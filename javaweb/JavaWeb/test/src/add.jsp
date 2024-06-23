<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Student</title>
</head>
<body>
    <h2>Add Student</h2>
    
    <%@ page import="java.sql.*" %>

    <%
        String connectionUrl = "jdbc:sqlserver://sqlserver:1433;databaseName=XSCJ;user=sa;password=Fyy@12345678";
        Connection conn = null;
        Statement stmt = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionUrl);
            stmt = conn.createStatement();

            if (request.getMethod().equals("POST")) {
                String name = request.getParameter("name");
                String gender = request.getParameter("gender");
                String major = request.getParameter("major");
                double score = Double.parseDouble(request.getParameter("score"));
                String sql = "INSERT INTO Students (Name, Gender, Major, Score) VALUES (?, ?, ?, ?)";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, name);
                ps.setString(2, gender);
                ps.setString(3, major);
                ps.setDouble(4, score);
                ps.executeUpdate();
                response.sendRedirect("student.jsp");
            }
    %>
            <form action="student.jsp?action=add" method="post">
                Name: <input type="text" name="name"><br>
                Gender: <input type="text" name="gender"><br>
                Major: <input type="text" name="major"><br>
                Score: <input type="text" name="score"><br>
                <input type="submit" value="Add">
            </form>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
