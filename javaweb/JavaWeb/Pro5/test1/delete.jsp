<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" />
</head>
<body>
<%
String jdbc_driver = "com.mysql.jdbc.Driver";
String db_url = "jdbc:mysql://localhost:3306/web_test?useUnicode=true&characterEncoding=UTF-8";
String user = "root";
String password = "123456";

Class.forName(jdbc_driver);
Connection conn = null;
PreparedStatement pstmt = null;

try {
    conn = DriverManager.getConnection(db_url, user, password);

    String sql = "DELETE FROM goods WHERE gName = ?";
    pstmt = conn.prepareStatement(sql);

    pstmt.setString(1, "红米 K30Pro");

    int rowsAffected = pstmt.executeUpdate();

    out.println("成功删除" + rowsAffected + "行数据");
} catch (SQLException e) {
    out.println("数据库连接或删除时发生错误：" + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            conn.close();
        }
    } catch (SQLException ex) {
        out.println("关闭连接时发生错误：" + ex.getMessage());
        ex.printStackTrace();
    }
}
%>
</body>
</html>
