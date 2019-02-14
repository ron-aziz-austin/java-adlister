package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

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
        //---new values---
        String first_name = request.getParameter("first_name");
        String last_name = request.getParameter("last_name");
        String phone_number = request.getParameter("phone_number");
        String join_date = request.getParameter("join_date");
        String posts = request.getParameter("posts");
        String website = request.getParameter("website");
        String user_bio = request.getParameter("user_bio");
        String user_fb = request.getParameter("user_fb");
        String user_twitter = request.getParameter("user_twitter");
        String user_linkedin = request.getParameter("user_linkedin");

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

        // check if user already exist in the users table
        User checkUsername = DaoFactory.getUsersDao().findByUsername(username);
        if (checkUsername != null) {
            request.setAttribute("inputErrors", "Username already exist!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }

        // check if email already exist in the users table
        User checkEmail = DaoFactory.getUsersDao().findByEmail(email);
        if (checkEmail != null) {
            request.setAttribute("inputErrors", "Email already exist!");
            request.getRequestDispatcher("WEB-INF/register.jsp").forward(request, response);
            return;
        }



        // hash password
        // create a new User object
        User newUser = new User(first_name, last_name, email, username, Password.hash(password), join_date, posts, website, phone_number, user_bio, user_fb,user_twitter, user_linkedin);
        // insert the new user into the users table
        DaoFactory.getUsersDao().insert(newUser);

        // create session with User object from the database
        User user = DaoFactory.getUsersDao().findByUsername(username);
        request.getSession().setAttribute("user", user);
        // login to profile
        response.sendRedirect("/profile");



    }// doPost

}// class