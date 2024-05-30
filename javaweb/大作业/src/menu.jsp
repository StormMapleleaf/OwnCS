<!-- navigation.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Navigation</title>
  <style>
html{
  font-size: 16px;
}
a {

  text-decoration: none;
}
 .nav3 {
      width: 120rem;
      height: 2.75rem;
      background-image: url("assets/navbg.svg");
    }

 .nav3 .list {
      height: 2.75rem;
      width: 52rem;
      float: left;
      margin-left: 2.63rem;
      display: flex;
      justify-content: flex-start;
      gap: 100px;
    }
 .nav3 .list li {
   list-style: none;
      font-size: 1rem;
      color: #FFFFFF;
      letter-spacing: 0;
      line-height: 1.38rem;
      font-weight: 400;
      margin-top: 0.69rem;
    }
 </style>
    </head>
    <body>
    <div class="nav3">
      <div class="list">
        <li><a href="index.jsp">首页</a></li>
        <li><a href="show.jsp">产品详情</a></li>
        <li><a href="LogoutServlet">退出登录</a></li>
      </div>
    </div>
    <div class="nav-links">


    </div>
    </body>
    </html>
