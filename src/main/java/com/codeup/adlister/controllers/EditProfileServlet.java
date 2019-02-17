package com.codeup.adlister.controllers;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

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
        String userId = userData.getId() + "";

        String first_name = request.getParameter("first_name_edit");
        String last_name = request.getParameter("last_name_edit");
        String email = request.getParameter("email_edit");
        String phone_number = request.getParameter("phone_number_edit");
//        String username = request.getParameter("username_edit");
        String password = request.getParameter("password_edit");
        String passwordConfirmation = request.getParameter("confirm_password_edit");





    }// doPost
}// class