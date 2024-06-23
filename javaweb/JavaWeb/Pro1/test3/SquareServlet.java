import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.annotation.WebServlet;
import java.io.*;

@WebServlet(name = "SquareServlet", urlPatterns = {"/test3/SquareServlet"})
public class SquareServlet extends HttpServlet {
    public void doGet(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        String numberStr = request.getParameter("number");
        int number = Integer.parseInt(numberStr);
        int square = number * number;

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html><body>");
        out.println("<h2>The square of " + number + " is " + square + "</h2>");
        out.println("</body></html>");
    }
}