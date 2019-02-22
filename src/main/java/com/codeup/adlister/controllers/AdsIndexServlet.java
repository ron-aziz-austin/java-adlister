package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // link from homepage
        if (request.getParameter("homeCategory") != null) {
            Long homeCategory = Long.parseLong(request.getParameter("homeCategory"));
            request.removeAttribute("ads");
            request.setAttribute("ads", DaoFactory.getAdsDao().listByParentCategory(homeCategory));
        } else {
            request.removeAttribute("ads");
            request.setAttribute("ads", DaoFactory.getAdsDao().all());
        }// if else

        request.setAttribute("usersPublicInfo", DaoFactory.getUsersDao().usersPublicInfo());
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }// doGet

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {

        // select ads by parent category or sub category
        if (request.getParameter("category") != null) {
            Long category = Long.parseLong(request.getParameter("category"));
            if (Long.parseLong(request.getParameter("category")) >= 1 && Long.parseLong(request.getParameter("category")) <=6) {
                request.removeAttribute("ads");
                request.setAttribute("ads", DaoFactory.getAdsDao().listByParentCategory(category));
            } else {
                request.removeAttribute("ads");
                request.setAttribute("ads", DaoFactory.getAdsDao().listByCategory(category));
            }
        }// if

        // search by ad title
        if (request.getParameter("search") != null) {
            String title = request.getParameter("search");
            request.removeAttribute("ads");
            request.setAttribute("ads", DaoFactory.getAdsDao().listByTitle(title));
        }// if

        request.setAttribute("usersPublicInfo", DaoFactory.getUsersDao().usersPublicInfo());
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);

    }// do Post

}// class