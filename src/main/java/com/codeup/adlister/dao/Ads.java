package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);
    Ad findById(int id);
    List<Ad> listByParentCategory(Long input);
    List<Ad> listByCategory(Long input);
    List<Ad> listByTitle(String input);
}