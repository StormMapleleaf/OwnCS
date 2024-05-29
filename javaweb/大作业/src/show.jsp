<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<html>
<head>
    <title>Show Product</title>
</head>
<body>
<table border="1">
    <tr>
        <th>序号</th>
        <th>目的地</th>
        <th>景点</th>
        <th>介绍</th>
        <th>价格</th>
  
    </tr>
    <%
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            String url = "jdbc:mysql://mysql:3306/mydb";
            String user = "root";
            String password = "pass";
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection(url, user, password);
            String sql = "SELECT id, destination,attraction, description, price FROM product";
            stmt = conn.prepareStatement(sql);
            rs = stmt.executeQuery();
            while (rs.next()) {
                out.println("<tr>");
                out.println("<td>" + rs.getInt("id") + "</td>");
                out.println("<td>" + rs.getString("destination") + "</td>");
                out.println("<td>" + rs.getString("attraction") + "</td>");
                out.println("<td>" + rs.getString("description") + "</td>");
                out.println("<td>" + rs.getDouble("price") + "</td>");
              
                out.println("</tr>");
            }
            
            
        } catch (ClassNotFoundException | SQLException e) {
            out.println("<p style='color:red;'>Error: " + e.getMessage() + "</p>");
        } finally {
            // 关闭数据库连接和资源
            if (rs != null) {
                try {
                    rs.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (stmt != null) {
                try {
                    stmt.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
            if (conn != null) {
                try {
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
</table>
</body>
</html>
