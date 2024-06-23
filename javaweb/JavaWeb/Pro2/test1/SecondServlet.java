import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import javax.servlet.annotation.*;

@WebServlet(name = "secondServlet", value = "/second-servlet")
public class SecondServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String country = request.getParameter("country");

        request.setAttribute("username", username);
        request.setAttribute("password", password);
        request.setAttribute("country", country);

        RequestDispatcher dispatcher = request.getRequestDispatcher("/third-servlet");
        dispatcher.forward(request, response);
    }
}