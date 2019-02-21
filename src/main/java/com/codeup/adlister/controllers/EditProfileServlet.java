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

import static java.lang.System.*;

@WebServlet(name = "controllers.EditProfileServlet", urlPatterns = "/profile/edit")
public class EditProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/edit_profile.jsp").forward(request, response);
    }// doGet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get user from session
        User userData = (User) request.getSession().getAttribute("user");
        // save user id
        Long userId = userData.getId();
        System.out.println(userId);

        // get user inputs from html form
        String first_name = request.getParameter("first_name_edit");
        String last_name = request.getParameter("last_name_edit");
        String email = request.getParameter("email_edit");
//        String phone_number = request.getParameter("phone_number_edit");
        String password = request.getParameter("password_edit");
        String passwordConfirmation = request.getParameter("confirm_password_edit");
//        String username = request.getParameter("username_edit");
//        boolean submit = request.getParameter("submit") != null;


        // check if email already exist in the users table
        // checks for blank email field
        // ignores unique if email is not adjusted
        if (email.equals("")) {
            request.setAttribute("inputErrors", "No email inputed!");
            request.getRequestDispatcher("/WEB-INF/edit_profile.jsp").forward(request, response);
            return;
        } else if (email.equals(userData.getEmail())){

            System.out.println(first_name);

            User updateUserWithEmail = new User(userId, first_name, last_name, password);
            DaoFactory.getUsersDao().updateWithSameEmail(updateUserWithEmail);
        }
        else {
            User checkEmail = DaoFactory.getUsersDao().findByEmail(email);
            if (checkEmail != null) {
                request.setAttribute("inputErrors", "Email already exist!");
                request.getRequestDispatcher("/WEB-INF/edit_profile.jsp").forward(request, response);
                return;
            }

        }


        User updateUser = new User(userId, first_name, last_name, email, Password.hash(password));
        // insert the new user into the users table
        DaoFactory.getUsersDao().update(updateUser);




//        boolean inputHasErrors = email.isEmpty()
//                || password.isEmpty();

        // validate user input
//        if (inputHasErrors) {
//            request.setAttribute("inputErrors", "Invalid inputs!");
//            request.getRequestDispatcher("WEB-INF/edit_profile.jsp").forward(request, response);
//        } else if (!password.equals(passwordConfirmation)) {
//            request.setAttribute("inputErrors", "Password did not match!");
//            request.getRequestDispatcher("WEB-INF/edit_profile.jsp").forward(request, response);
//            return;
//        }

//         check if user already exist in the users table
//        User checkUsername = DaoFactory.getUsersDao().findByUsername(userData);
//        if (checkUsername != null) {
//            request.setAttribute("inputErrors", "Username already exist!");
//            request.getRequestDispatcher("WEB-INF/edit_profile.jsp").forward(request, response);
//            return;
//        }




        // create session with User object from the database
        User editUser = DaoFactory.getUsersDao().findByUsername(userData.getUsername());
        request.getSession().setAttribute("user", editUser);
        // login to profile
        response.sendRedirect("/profile");

    }// doPost

}// class