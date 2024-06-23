<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Student Management</title>
</head>
<body>
    <h2>Student Management</h2>
    
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.*" %>

    <%
        String connectionUrl = "jdbc:sqlserver://sqlserver:1433;databaseName=XSCJ;user=sa;password=Fyy@12345678";
        Connection conn = null;
        Statement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection(connectionUrl);
            stmt = conn.createStatement();

            String action = request.getParameter("action");

            if (action == null) {
                action = "list";
            }

            if (action.equals("list")) {
                rs = stmt.executeQuery("SELECT * FROM Students");
    %>
                <h3>Student List</h3>
                <table border="1">
                    <tr>
                        <th>StudentID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Major</th>
                        <th>Score</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
    <%
                    while (rs.next()) {
    %>
                        <tr>
                            <td><%= rs.getInt("StudentID") %></td>
                            <td><%= rs.getString("Name") %></td>
                            <td><%= rs.getString("Gender") %></td>
                            <td><%= rs.getString("Major") %></td>
                            <td><%= rs.getDouble("Score") %></td>
                            <td><a href="edit.jsp?studentID=<%= rs.getInt("StudentID") %>">Edit</a></td>
                            <td><a href="delete.jsp?studentID=<%= rs.getInt("StudentID") %>">Delete</a></td>
                        </tr>
    <%
                    }
    %>
                </table>
                <p><a href="add.jsp">Add New Student</a></p>
    <%
            } else if (action.equals("add")) {
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
            } else if (action.equals("search")) {
                String keyword = request.getParameter("keyword");
                String sql = "SELECT * FROM Students WHERE Name LIKE ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, "%" + keyword + "%");
                rs = ps.executeQuery();
    %>
                <h3>Search Results</h3>
                <table border="1">
                    <tr>
                        <th>StudentID</th>
                        <th>Name</th>
                        <th>Gender</th>
                        <th>Major</th>
                        <th>Score</th>
                        <th>Edit</th>
                        <th>Delete</th>
                    </tr>
    <%
                    while (rs.next()) {
    %>
                        <tr>
                            <td><%= rs.getInt("StudentID") %></td>
                            <td><%= rs.getString("Name") %></td>
                            <td><%= rs.getString("Gender") %></td>
                            <td><%= rs.getString("Major") %></td>
                            <td><%= rs.getDouble("Score") %></td>
                            <td><a href="edit.jsp?studentID=<%= rs.getInt("StudentID") %>">Edit</a></td>
                            <td><a href="delete.jsp?studentID=<%= rs.getInt("StudentID") %>">Delete</a></td>
                        </tr>
    <%
                    }
    %>
                </table>
                <p><a href="student.jsp">Back to Student List</a></p>
    <%
            }
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        }
    %>
    <hr>
    <h3>Search Student</h3>
    <form action="student.jsp?action=search" method="get">
        Keyword: <input type="text" name="keyword">
        <input type="submit" value="Search">
    </form>
</body>
</html>
