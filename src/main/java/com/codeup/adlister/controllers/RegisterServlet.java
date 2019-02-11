package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }// doGet

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        // get user input
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");

        boolean inputHasErrors = username.isEmpty()
                                || email.isEmpty()
                                || password.isEmpty();

        // validate user input
        if (inputHasErrors) {
            request.setAttribute("inputErrors", "Invalid inputs!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
        } else if (!password.equals(passwordConfirmation)) {
            request.setAttribute("inputErrors", "Password did not match!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        //check if user already exist in the users table
        User user = DaoFactory.getUsersDao().findByUsername(username);
        if (user != null) {
            request.setAttribute("inputErrors", "Username already exist!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        //check if email already exist in the users table
        user = DaoFactory.getUsersDao().findByEmail(email);
        if (user != null) {
            request.setAttribute("inputErrors", "Email already exist!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // create a new User object
        user = new User(username, email, password);
        // insert the new user into the users table
        DaoFactory.getUsersDao().insert(user);

        // create session with new User object
        request.getSession().setAttribute("user", user.getUsername());
        // login to profile
        response.sendRedirect("/profile");

    }// doPost

}// class