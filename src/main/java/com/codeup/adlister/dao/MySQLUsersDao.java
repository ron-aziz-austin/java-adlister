package com.codeup.adlister.dao;
import com.codeup.adlister.models.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;

public class MySQLUsersDao implements Users {
    private Connection connection;

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
    }


    @Override
    public User findByUsername(String username) {
        String query = "SELECT * FROM users WHERE username = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, username);
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by username", e);
        }
    }

    @Override  // find a user in the users table by the email
    public User findByEmail(String email) {
        try {
            // preparedStatement object that represents an individual SQL statement
            PreparedStatement stmt = connection.prepareStatement(
                    "SELECT * FROM users WHERE email = ? LIMIT 1"
            );
            // safely set values into the SQL query placeholder ? with the email
            stmt.setString(1, email);
            // execute select statement and returns instantiated User object
            return extractUser(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding by email.", e);
        }
    }// findByEmail

    @Override
    public Long insert(User user) {
        String query = "INSERT INTO users(first_name, last_name, email, username, password, join_date, posts, website, phone_number, user_bio, user_fb,user_twitter, user_linkedin ) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getFirst_name());
            stmt.setString(2, user.getLast_name());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getUsername());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getJoin_date());
            stmt.setString(7, user.getPosts());
            stmt.setString(8, user.getWebsite());
            stmt.setString(9, user.getPhone_number());
            stmt.setString(10, user.getUser_bio());
            stmt.setString(11, user.getUser_fb());
            stmt.setString(12, user.getUser_twitter());
            stmt.setString(13, user.getUser_linkedin());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private User extractUser(ResultSet rs) throws SQLException {
        if (! rs.next()) {
            return null;
        }
        return new User(
            rs.getLong("id"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password")
        );
    }

}