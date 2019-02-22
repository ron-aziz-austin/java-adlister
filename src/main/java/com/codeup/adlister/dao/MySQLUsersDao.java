package com.codeup.adlister.dao;
import com.codeup.adlister.models.Config;
import com.codeup.adlister.models.User;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
    public List<User> usersPublicInfo() {
        String sql = "SELECT username, id, phone_number, email FROM users";
        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            return createUsersFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding users public info.", e);
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
        String query = "INSERT INTO users(first_name, last_name, username, email, password, phone_number) VALUES (?, ?, ?, ?, ?, ?)";
        try {
            PreparedStatement stmt = connection.prepareStatement(query, Statement.RETURN_GENERATED_KEYS);
            stmt.setString(1, user.getFirst_name());
            stmt.setString(2, user.getLast_name());
            stmt.setString(3, user.getUsername());
            stmt.setString(4, user.getEmail());
            stmt.setString(5, user.getPassword());
            stmt.setString(6, user.getPhone_number());
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
            rs.getString("first_name"),
            rs.getString("last_name"),
            rs.getString("username"),
            rs.getString("email"),
            rs.getString("password"),
            rs.getString("phone_number")
        );
    }

    private User extractUsersPublicInfo(ResultSet rs) throws SQLException {
        return new User(
                rs.getString("username"),
                rs.getLong("id"),
                rs.getString("phone_number"),
                rs.getString("email")
        );
    }

    @Override
    public void update(User user) {
        String query = "UPDATE users SET first_name=?, last_name=?, email=?, password=? WHERE id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getFirst_name());
            stmt.setString(2, user.getLast_name());
//            stmt.setString(3, user.getUsername());
            stmt.setString(3, user.getEmail());
            stmt.setString(4, user.getPassword());
            stmt.setLong(5, user.getId());
//            stmt.setString(6, user.getPhone_number());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    @Override
    public void updateWithSameEmail(User user) {
        String query = "UPDATE users SET first_name=?, last_name=?, password=? WHERE id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, user.getFirst_name());
            stmt.setString(2, user.getLast_name());
            stmt.setString(3, user.getPassword());
            stmt.setLong(4, user.getId());
//            stmt.setString(6, user.getPhone_number());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error creating new user", e);
        }
    }

    private List<User> createUsersFromResults(ResultSet rs) throws SQLException {
        List<User> users = new ArrayList<>();
        while (rs.next()) {
            users.add(extractUsersPublicInfo(rs));
        }
        return users;
    }

}// class