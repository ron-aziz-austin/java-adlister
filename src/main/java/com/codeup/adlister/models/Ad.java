package com.codeup.adlister.models;

public class Ad {
    private long id;
    private long userId;
    private long categoryId;
    private String title;
    private String description;
    private String listedOn;
    private String country;
    private String location;
    private String city;
    private int zipCode;
    private int classifiedStatusId;
    private int priceTypeId;
    private double price;

    public Ad(long id, long userId, long categoryId, String title, String description, String listedOn, String country, String location, String city, int zipCode, int classifiedStatusId, int priceTypeId, double price) {
        this.id = id;
        this.userId = userId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.listedOn = listedOn;
        this.country = country;
        this.location = location;
        this.city = city;
        this.zipCode = zipCode;
        this.classifiedStatusId = classifiedStatusId;
        this.priceTypeId = priceTypeId;
        this.price = price;
    }

    public Ad(long userId, long categoryId, String title, String description, String location, String city, int zipCode, int priceTypeId, double price) {
        this.userId = userId;
        this.categoryId = categoryId;
        this.title = title;
        this.description = description;
        this.location = location;
        this.city = city;
        this.zipCode = zipCode;
        this.priceTypeId = priceTypeId;
        this.price = price;
    }

//    public Ad(long id, long userId, String title, String description) {
//        this.id = id;
//        this.userId = userId;
//        this.title = title;
//        this.description = description;
//    }

//    public Ad(long userId, String title, String description) {
//        this.userId = userId;
//        this.title = title;
//        this.description = description;
//    }

    public long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(long categoryId) {
        this.categoryId = categoryId;
    }

    public String getListedOn() {
        return listedOn;
    }

    public void setListedOn(String listedOn) {
        this.listedOn = listedOn;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public int getZipCode() {
        return zipCode;
    }

    public void setZipCode(int zipCode) {
        this.zipCode = zipCode;
    }

    public int getClassifiedStatusId() {
        return classifiedStatusId;
    }

    public void setClassifiedStatusId(int classifiedStatusId) {
        this.classifiedStatusId = classifiedStatusId;
    }

    public int getPriceTypeId() {
        return priceTypeId;
    }

    public void setPriceTypeId(int priceTypeId) {
        this.priceTypeId = priceTypeId;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public long getUserId() {
        return userId;
    }

    public void setUserId(long userId) {
        this.userId = userId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }
}