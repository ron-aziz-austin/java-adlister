import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import java.io.IOException;

@WebServlet(name = "ShowAdminDashboardServlet", urlPatterns = "/admin")
public class ShowAdminDashboardServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // redirect if the user is not an admin
        if (request.getSession().getAttribute("isAdmin") != null) {
            if ((Boolean) request.getSession().getAttribute("isAdmin")) {
                request.getRequestDispatcher("WEB-INF/secret-admin-page.jsp").forward(request, response);
            }
        }
        response.sendRedirect("/login");
    }// doGet

}// class