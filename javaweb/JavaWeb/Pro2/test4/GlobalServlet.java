import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class GlobalServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = getServletContext().getInitParameter("name");
        response.setContentType("text/html;charset=UTF-8");
        response.getWriter().println("全局参数 name 的值为：" + name);
    }
}
