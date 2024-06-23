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

    // 开启事务
    conn.setAutoCommit(false);
    
    // 创建用户金额表
    String createTableSQL = "CREATE TABLE IF NOT EXISTS user_amount (uid INT PRIMARY KEY, usrname VARCHAR(50), amount DECIMAL(10,2))";
    pstmt = conn.prepareStatement(createTableSQL);
    pstmt.executeUpdate();

    // 初始化两个用户的金额
    String insertUserSQL = "INSERT INTO user_amount (uid, usrname, amount) VALUES (?, ?, ?)";
    pstmt = conn.prepareStatement(insertUserSQL);
    
    // 用户1
    pstmt.setInt(1, 1);
    pstmt.setString(2, "User1");
    pstmt.setBigDecimal(3, new BigDecimal("1000.00"));
    pstmt.executeUpdate();

    // 用户2
    pstmt.setInt(1, 2);
    pstmt.setString(2, "User2");
    pstmt.setBigDecimal(3, new BigDecimal("2000.00"));
    pstmt.executeUpdate();

    // 执行转账操作
    int fromUserId = 1;
    int toUserId = 2;
    BigDecimal transferAmount = new BigDecimal("500.00");
    
    // 查询用户1的余额
    String selectUserAmountSQL = "SELECT amount FROM user_amount WHERE uid = ?";
    pstmt = conn.prepareStatement(selectUserAmountSQL);
    pstmt.setInt(1, fromUserId);
    ResultSet rs = pstmt.executeQuery();
    BigDecimal fromUserAmount = BigDecimal.ZERO;
    if (rs.next()) {
        fromUserAmount = rs.getBigDecimal("amount");
    }
    rs.close();
    
    // 检查用户1的余额是否足够
    if (fromUserAmount.compareTo(transferAmount) >= 0) {
        // 扣除用户1的金额
        String updateFromUserAmountSQL = "UPDATE user_amount SET amount = amount - ? WHERE uid = ?";
        pstmt = conn.prepareStatement(updateFromUserAmountSQL);
        pstmt.setBigDecimal(1, transferAmount);
        pstmt.setInt(2, fromUserId);
        pstmt.executeUpdate();
        
        // 增加用户2的金额
        String updateToUserAmountSQL = "UPDATE user_amount SET amount = amount + ? WHERE uid = ?";
        pstmt = conn.prepareStatement(updateToUserAmountSQL);
        pstmt.setBigDecimal(1, transferAmount);
        pstmt.setInt(2, toUserId);
        pstmt.executeUpdate();
        
        // 提交事务
        conn.commit();
        
        out.println("转账成功！");
    } else {
        // 余额不足，回滚事务
        conn.rollback();
        
        out.println("转账失败：用户1余额不足！");
    }
} catch (SQLException e) {
    // 出现异常，回滚事务
    if (conn != null) {
        try {
            conn.rollback();
        } catch (SQLException ex) {
            out.println("回滚事务时发生错误：" + ex.getMessage());
            ex.printStackTrace();
        }
    }
    
    out.println("数据库连接或操作时发生错误：" + e.getMessage());
    e.printStackTrace();
} finally {
    try {
        if (pstmt != null) {
            pstmt.close();
        }
        if (conn != null) {
            // 恢复自动提交模式
            conn.setAutoCommit(true);
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
