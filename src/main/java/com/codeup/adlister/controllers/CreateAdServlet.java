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

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Don't allow ad creation unless a user is logged in.
        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);
    }// doGet

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        // When a new ad is created, assign the user id of the logged in user to the ad.
        User userData = (User) request.getSession().getAttribute("user");

        System.out.println(Integer.parseInt(request.getParameter("zip_code")));
        Ad ad = new Ad(
            userData.getId(),
            Long.parseLong(request.getParameter("category")),
            request.getParameter("title"),
            request.getParameter("description"),
            request.getParameter("location"),
            request.getParameter("city"),
            Integer.parseInt(request.getParameter("zip_code")),
            Integer.parseInt(request.getParameter("price_type")),
            Double.parseDouble(request.getParameter("price"))
        );
        DaoFactory.getAdsDao().insert(ad);
        response.sendRedirect("/profile");
    }// doPost

}// class