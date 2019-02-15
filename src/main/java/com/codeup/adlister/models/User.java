package com.codeup.adlister.models;

public class User {
    private long id;
    private String first_name;
    private String last_name;
    private String username;
    private String email;
    private String password;
    private String phone_number;
//    private String website;
//    private String join_date;
//    private String posts;
//    private String user_bio;
//    private String user_fb;
//    private String user_twitter;
//    private String user_linkedin;

    public User(long id, String first_name, String last_name, String username, String email, String password, String phone_number) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone_number = phone_number;
    }

    public User(String first_name, String last_name, String username, String email, String password, String phone_number) {
        this.first_name = first_name;
        this.last_name = last_name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone_number = phone_number;
    }

    public User(long id, String first_name, String last_name) {
        this.id = id;
        this.first_name = first_name;
        this.last_name = last_name;
    }

    //---
//    public User(String username, String email, String first_name, String last_name, String phone_number, String password, String website, String join_date, String posts, String user_bio, String user_fb, String user_twitter, String user_linkedin) {
//        this.first_name = first_name;
//        this.last_name = last_name;
//        this.email = email;
//        this.phone_number = phone_number;
//        this.username = username;
//        this.password = password;
//        this.website = website;
//        this.join_date = join_date;
//        this.posts = posts;
//        this.user_bio = user_bio;
//        this.user_fb = user_fb;
//        this.user_twitter = user_twitter;
//        this.user_linkedin = user_linkedin;
//
//    }
    //---

//    public User(String username1, String s, String hash, String username, String email, String password) {
//        this.username = username;
//        this.email = email;
//        this.password = password;
//    }

    public User(long id, String username, String email, String password) {
        this.id = id;
        this.username = username;
        this.email = email;
        this.password = password;
    }

    public long getId() {
        return id;
    }

    public void setId(long id) {
        this.id = id;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getFirst_name() { return first_name; }

    public void setFirst_name(String first_name) { this.first_name = first_name; }

    public String getLast_name() { return last_name; }

    public void setLast_name(String last_name) { this.last_name = last_name; }

    public String getPhone_number() { return phone_number; }

    public void setPhone_number(String phone_number) { this.phone_number = phone_number; }

}//class