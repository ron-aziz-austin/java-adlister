import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // redirect if the user is not a user
        if (request.getSession().getAttribute("isUser") != null) {
            if ((Boolean) request.getSession().getAttribute("isUser")) {
                request.getRequestDispatcher("WEB-INF/profile.jsp").forward(request, response);
            }
        }
        response.sendRedirect("/login");
    }// doGet

}// class