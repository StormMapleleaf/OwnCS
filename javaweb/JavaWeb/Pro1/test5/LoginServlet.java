import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test5/LoginServlet")
public class LoginServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        if ("user".equals(username) && "password".equals(password)) {
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
