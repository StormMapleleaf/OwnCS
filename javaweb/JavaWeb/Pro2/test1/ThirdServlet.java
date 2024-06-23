import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.*;

@WebServlet(name = "thirdServlet", value = "/third-servlet")
public class ThirdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = (String) request.getAttribute("username");
        String password = (String) request.getAttribute("password");
        String country = (String) request.getAttribute("country");

        response.setContentType("text/html");
        response.getWriter().print("用户名: " + username + "<br>");
        response.getWriter().print("密码: " + password + "<br>");
        response.getWriter().print("所在区域: " + country + "<br>");
    }
}