package com.codeup.adlister.dao;

import com.codeup.adlister.models.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;

public class MySQLUsersDao implements Users {

    private Connection connection = null;

    public MySQLUsersDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }// MySQLUsersDao

    @Override
    public User findByUsername(String username) {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                    "SELECT * FROM users WHERE username LIKE ?"
            );
            // TODO: 2019-02-08 Fix This!
//            stmt.setString();
            return null;
        } catch (SQLException e) {
            throw new RuntimeException("Error finding by username.");
        }
    }// findByUsername

    @Override
    public Long insert(User user) {
        try {
            PreparedStatement stmt = connection.prepareStatement(
                    "INSERT INTO users(username, email, password) VALUES(?,?,?)",
                    Statement.RETURN_GENERATED_KEYS
            );
            // TODO: 2019-02-08 Check if username already exist
            stmt.setString(1, user.getUsername());
            stmt.setString(2, user.getEmail());
            stmt.setString(3, user.getPassword());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }// insert


}// class