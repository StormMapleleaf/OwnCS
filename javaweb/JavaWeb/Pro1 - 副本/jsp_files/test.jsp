<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>打印1到10的数字</title>
</head>
<body>

<h2>输出1到10的数字：</h2>
<ul>
<%
    // 使用for循环遍历1到10
    for(int i = 1; i <= 10; i++) {
        // 在JSP中直接输出数字
        out.println("<li>" + i + "</li>");
    }
%>
</ul>

</body>
</html>