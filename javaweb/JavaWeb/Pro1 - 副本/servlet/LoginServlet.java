import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        // 获取表单提交的用户名和密码
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        if ("user".equals(username)=="user" && "password".equals(password)== "password") {
            // 如果用户名和密码匹配，输出欢迎消息
            out.println("<html>");
            out.println("<head>");
            out.println("<title>登录结果</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>登录成功！</h2>");
            out.println("<p>欢迎您，" + username + "！</p>");
            out.println("</body>");
            out.println("</html>");
        } else {
            // 如果用户名和密码不匹配，输出登录失败消息
            out.println("<html>");
            out.println("<head>");
            out.println("<title>登录结果</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h2>登录失败！</h2>");
            out.println("</body>");
            out.println("</html>");
        }
    }
}
