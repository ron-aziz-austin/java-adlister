import javax.servlet.annotation.WebServlet;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;

@WebServlet(name = "HelloWorldServlet", urlPatterns = "/hello")
public class HelloWorldServlet extends HttpServlet {

    private int pageCounter;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.printf("<p>Page Counter: %s</p>", pageCounter++);

        String helloWorld = "<h1>Hello, World!</h1>";
        String nameForm = "<form method=\"POST\" action=\"/hello\">"
            + "<label for=\"name\">Name:</label>"
            + "<input id=\"name\" name=\"name\" placeholder=\"Enter your name\" />"
            + "<button type='submit'>Login</button></form>";

        out.println(helloWorld);
        out.println(nameForm);
    }// doGet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String name = request.getParameter("name");

        if (name == null || name == "") {
            response.sendRedirect("/hello");
            out.println("null");
        } else {
            out.printf("<h1>Hello, %s!</h1>", name);
        }
    }// doPost

}// class