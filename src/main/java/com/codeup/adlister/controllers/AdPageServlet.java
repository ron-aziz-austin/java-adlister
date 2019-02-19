package com.codeup.adlister.controllers;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet (name = "AdPageServlet", urlPatterns = "/adIndex")
public class AdPageServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        // get ad id from URL query
        int adId = Integer.parseInt(request.getParameter("adId"));
        // find ad by id and create an ad object
        Ad ad = DaoFactory.getAdsDao().findById(adId);
        // send ad object to html
        request.setAttribute("ad", ad);
        // send list of categories to html
        request.setAttribute("categories", DaoFactory.getCategoriesDao().all());

        // TODO create a classified_status interface, class, dao, etc ... possibly get rid of this column in the ads table
        //request.setAttribute("status", staus);

        // send user to the individual ad page
        request.getRequestDispatcher("/WEB-INF/ads/ad_page.jsp").forward(request,response);

    }//doGet

}// class
