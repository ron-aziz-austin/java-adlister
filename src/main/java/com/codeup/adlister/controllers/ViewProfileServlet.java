package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.ViewProfileServlet", urlPatterns = "/profile")
public class ViewProfileServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        User loginUser = (User) request.getSession().getAttribute("user");
        if (request.getParameter("deleteAd") != null) {
            // get ad id from URL query
            Long deleteAd = Long.parseLong(request.getParameter("deleteAd"));
            // find ad by id and create an ad object
            DaoFactory.getAdsDao().delete(deleteAd);
        }
        request.setAttribute("ads", DaoFactory.getAdsDao().listAdsByUserId(loginUser.getId()));
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);
    }// doGet

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

    }// doPost

}// class