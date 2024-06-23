<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Student</title>
</head>
<body>
    <h2>Edit Student</h2>
    
    <%@ page import="java.sql.*" %>

    <%
        String connectionUrl = "jdbc:sqlserver://sqlserver:1433;databaseName=XSCJ;user=sa;password=Fyy@12345678";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionUrl);
            stmt = conn.createStatement();

            int studentID = Integer.parseInt(request.getParameter("studentID"));
            rs = stmt.executeQuery("SELECT * FROM Students WHERE StudentID=" + studentID);
            rs.next();
    %>
            <form action="student.jsp?action=edit" method="post">
                <input type="hidden" name="studentID" value="<%= rs.getInt("StudentID") %>">
                Name: <input type="text" name="name" value="<%= rs.getString("Name") %>"><br>
                Gender: <input type="text" name="gender" value="<%= rs.getString("Gender") %>"><br>
                Major: <input type="text" name="major" value="<%= rs.getString("Major") %>"><br>
                Score: <input type="text" name="score" value="<%= rs.getDouble("Score") %>"><br>
                <input type="submit" value="Update">
            </form>
    <%
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
</body>
</html>
