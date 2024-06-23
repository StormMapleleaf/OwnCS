import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/MultiplicationTableServlet")
public class MultiplicationTableServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();

        out.println("<html>");
        out.println("<head>");
        out.println("<title>9x9 乘法表</title>");
        out.println("<style>");
        out.println("table { border-collapse: collapse; }");
        out.println("table, th, td { border: 1px solid black; padding: 8px; }");
        out.println("</style>");
        out.println("</head>");
        out.println("<body>");
        out.println("<h2>9x9 乘法表</h2>");
        out.println("<table>");

        // 输出表头
        out.println("<tr>");
        out.println("<th>&nbsp;</th>");
        for (int i = 1; i <= 9; i++) {
            out.println("<th>" + i + "</th>");
        }
        out.println("</tr>");

        // 输出表格内容
        for (int i = 1; i <= 9; i++) {
            out.println("<tr>");
            out.println("<th>" + i + "</th>");
            for (int j = 1; j <= 9; j++) {
                out.println("<td>" + (i * j) + "</td>");
            }
            out.println("</tr>");
        }

        out.println("</table>");
        out.println("</body>");
        out.println("</html>");
    }
}
