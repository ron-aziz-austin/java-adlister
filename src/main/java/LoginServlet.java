import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.lang3.StringUtils;
import java.io.IOException;

@WebServlet(name = "LoginServlet", urlPatterns = "/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
    }// doGet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uname = request.getParameter("uname");
        String psw = request.getParameter("psw");

        if (StringUtils.isNotBlank(uname) || StringUtils.isNotBlank(psw)) {
            if (uname.equals("admin") && psw.equals("password")) {
                response.sendRedirect("/profile");
            } else {
                request.setAttribute("invalidLogin", "Invalid username or password");
                request.getRequestDispatcher("WEB-INF/login.jsp").forward(request, response);
            }
        }
    }// doPost

}// class