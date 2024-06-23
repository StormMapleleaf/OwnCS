import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/test4/RegisterServlet")
public class RegisterServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8"); 
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String gender = request.getParameter("gender");
        String[] hobbies = request.getParameterValues("hobby");
        String personalInfo = request.getParameter("personal_info");

        out.println("<html>");
        out.println("<head>");
        out.println("<title>注册信息</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>注册信息</h2>");
        out.println("<p>用户名: " + username + "</p>");
        out.println("<p>密码: " + password + "</p>");
        out.println("<p>性别: " + gender + "</p>");
        out.println("<p>爱好:");
        if (hobbies != null) {
            for (String hobby : hobbies) {
                out.println(" " + hobby);
            }
        } else {
            out.println(" 无");
        }
        out.println("</p>");
        out.println("<p>个人信息: " + personalInfo + "</p>");
        out.println("</body>");
        out.println("</html>");
    }
}