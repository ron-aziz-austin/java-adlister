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

@WebServlet(name = "controllers.EditAdServlet", urlPatterns = "/ads/edit")
public class EditAdServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        if (request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            return;
        }
        Long adId = 0l;
        if (request.getParameter("adId") != null) {
            // get ad id from URL query
            adId = Long.parseLong(request.getParameter("adId"));
        }
        request.setAttribute("adId", adId);
        request.getRequestDispatcher("/WEB-INF/ads/edit.jsp").forward(request, response);

    }// doGet

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        User loggedInUser = (User) request.getSession().getAttribute("user");
        Long adId = 0l;
        if (request.getParameter("adId") != null) {
            // get ad id from URL query
            adId = Long.parseLong(request.getParameter("adId"));
        }
        Ad editAd = new Ad(
                adId,
                loggedInUser.getId(),
                Long.parseLong(request.getParameter("category")),
                request.getParameter("title"),
                request.getParameter("description"),
                request.getParameter("location"),
                request.getParameter("city"),
                Integer.parseInt(request.getParameter("zip_code")),
                Integer.parseInt(request.getParameter("price_type")),
                Double.parseDouble(request.getParameter("price"))
        );
        DaoFactory.getAdsDao().edit(editAd);
        request.setAttribute("ads", DaoFactory.getAdsDao().listAdsByUserId(loggedInUser.getId()));
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/profile.jsp").forward(request, response);

    }// doPost

}// class