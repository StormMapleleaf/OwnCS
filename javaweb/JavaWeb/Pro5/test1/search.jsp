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
ResultSet rs = null;

try {
    conn = DriverManager.getConnection(db_url, user, password);

    String sql = "SELECT gId, gName, gPrice FROM goods WHERE gName LIKE ?";
    pstmt = conn.prepareStatement(sql);
    pstmt.setString(1, "华为%");

    rs = pstmt.executeQuery();

    while(rs.next()){
        String gId = rs.getString("gId");
        String gName = rs.getString("gName");
        String gPrice = rs.getString("gPrice");
        out.println(gId + "&nbsp;" + gName + "&nbsp;" + gPrice + "<br>");
    }
} catch (SQLException e) {
    out.println("数据库连接或查询时发生错误：" + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (rs != null) {
            rs.close();
        }
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
