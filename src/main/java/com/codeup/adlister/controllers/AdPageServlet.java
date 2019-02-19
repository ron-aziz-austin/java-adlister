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
import java.util.List;


@WebServlet (name = "AdPageServlet", urlPatterns = "/adIndex")
public class AdPageServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Ad> ads = DaoFactory.getAdsDao().all();

        int adId = Integer.parseInt(request.getParameter("adId"));
        Ad ad = ads.get(adId-1);
        request.setAttribute("ad", adId);


        request.getRequestDispatcher("/WEB-INF/ads/ad_page.jsp").forward(request,response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {








    }

    public static String getUserId(User user){
        return user.getId() + "";
    }
}
