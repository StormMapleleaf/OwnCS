<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.HttpSession" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Product List</title>
    <style>
        .banner{
            width: 120rem;
            height: 25rem;
            position: relative;
        }
        #img{
            position: absolute;

        }
        .b{
            width: 7.75rem;
            height: 0.88rem;

            position: absolute;
            left: 91.5rem;
            top: 22.25rem;
            display: flex;
            justify-content: space-around;
            gap: 1.25rem;
            .b1{
                width: 1.75rem;
                height: 0.88rem;
            }
            .b2{
                width: 1.75rem;
                height: 0.88rem;

            }
            .b3{
                width: 1.75rem;
                height: 0.88rem;
            }
        }
    </style>

</head>
<body>
    
<jsp:include page="menu.jsp" />
<div class="banner">
    <img src="assets/banner1.png" alt="" id="img">
    <div class="b">
        <div class="b1" id="b1"><img src="assets/dot.svg" alt="" id="b11"></div>
        <div class="b2" id="b2"><img src="assets/dotno.svg" alt=""  id="b12"></div>
        <div class="b3" id="b3"><img src="assets/dotno.svg" alt=""  id="b13"></div>
    </div>
</div>

<table border="1">
    <tr>
        <th>序号</th>
        <th>目的地</th>
        <th>景点</th>
        <th>介绍</th>
        <th>价格</th>
        <th>加入我的购物车</th>
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
                out.println("<td style=\"width: 90px;\">" + rs.getInt("id") + "</td>");
                out.println("<td style=\"width: 100px;\">" + rs.getString("destination") + "</td>");
                out.println("<td style=\"width: 240px;\">" + rs.getString("attraction") + "</td>");
                out.println("<td style=\"width: 1290px;\">" + rs.getString("description") + "</td>");
                out.println("<td>" + rs.getDouble("price") + "</td>");
                out.println("<td>");
                out.println("<form action=\"show.jsp\" method=\"post\">");
                out.println("<input type=\"hidden\" name=\"productId\" value=\"" + rs.getInt("id") + "\">");
                out.println("<input type=\"hidden\" name=\"destination\" value=\"" + rs.getString("destination") + "\">");
                out.println("<input type=\"hidden\" name=\"attraction\" value=\"" + rs.getString("attraction") + "\">");
                out.println("<input type=\"hidden\" name=\"description\" value=\"" + rs.getString("description") + "\">");
                out.println("<input type=\"hidden\" name=\"price\" value=\"" + rs.getDouble("price") + "\">");
                out.println("<input type=\"submit\" name=\"action\" value=\"立刻抢购吧！！\" style=\"background-color: aquamarine;\">");
                out.println("</form>");
                out.println("</td>");
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
<script>
    let img= document.getElementById('img');
    let b1=document.getElementById('b1');
    let b2=document.getElementById('b2');
    let b3=document.getElementById('b3');
    let b11=document.getElementById('b11');
    let b12=document.getElementById('b12');
    let b13=document.getElementById('b13');

    let arr=["assets/banner1.png","assets/banner2.png","assets/banner3.png"]
    let bi=["assets/dot.svg","assets/dotno.svg"]
    b1.onclick=function(){
        img.src=arr[0]

        b11.src=bi[0]
        b12.src=bi[1]
        b13.src=bi[1]
    }
    b2.onclick=function(){
        img.src=arr[1]
        b11.src=bi[1]
        b12.src=bi[0]
        b13.src=bi[1]
    }
    b3.onclick=function(){
        img.src=arr[2]
        b11.src=bi[1]
        b12.src=bi[1]
        b13.src=bi[0]
    }
    let n=0;
    setInterval(function(){
        img.src=arr[n];
        if(n==0){
            b11.src=bi[0]
            b12.src=bi[1]
            b13.src=bi[1]}
        if(n==1){
            b11.src=bi[1]
            b12.src=bi[0]
            b13.src=bi[1]
        }
        if(n==2){
            b11.src=bi[1]
            b12.src=bi[1]
            b13.src=bi[0]
        }
        n+=1;
        if(n==3)
            n=0;


    },4000)
</script>
