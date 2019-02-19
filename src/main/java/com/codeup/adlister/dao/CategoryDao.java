package com.codeup.adlister.dao;
import com.mysql.cj.jdbc.Driver;
import com.codeup.adlister.models.Category;
import com.codeup.adlister.models.Config;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao implements Categories {
    private Connection connection = null;

    public CategoryDao(Config config) {
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
    public List<Category> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM category");
            ResultSet rs = stmt.executeQuery();
            return createCategoriesFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all categories.", e);
        }
    }

//    @Override
//    public Category findAdCategory(Long categoryId) {
//        String sql = "SELECT * FROM category WHERE ? = category.category_id";
//
//        try {
//            // preparedStatement object that represents an individual SQL statement
//            PreparedStatement stmt = connection.prepareStatement(sql);
//            // safely set values into the SQL query placeholder ? with the email
//            stmt.setLong(1, categoryId);
//            // execute select statement and returns instantiated User object
//            ResultSet rs = stmt.executeQuery();
//            rs.next();
//            return extractCategory(rs);
//        } catch (SQLException e) {
//            throw new RuntimeException("Error finding ad category.", e);
//        }
//    }

    private Category extractCategory(ResultSet rs) throws SQLException {
        return new Category(
                rs.getLong("parent_id"),
                rs.getLong("category_id"),
                rs.getString("title")
        );
    }// extractCategory

    private List<Category> createCategoriesFromResults (ResultSet rs) throws SQLException {
        List<Category> categories = new ArrayList<>();
        while (rs.next()) {
            categories.add(extractCategory(rs));
        }
        return categories;
    }

}// class