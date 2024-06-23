import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.*;

@WebServlet(name = "welcomeServlet", value = "/welcome-servlet")
public class WelcomeServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("username")) {
                    response.getWriter().print("欢迎 " + cookie.getValue());
                    return;
                }
            }
        }

        response.sendRedirect("/login.html");
    }
}