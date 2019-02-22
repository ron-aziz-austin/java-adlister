package com.codeup.adlister.dao;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.Config;
import com.mysql.cj.jdbc.Driver;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;

    public MySQLAdsDao(Config config) {
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
    public List<Ad> all() {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> listByParentCategory(Long input) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ads JOIN category ON ads.category_id = category.category_id WHERE category.parent_id = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, input);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


    public List<Ad> listAdsByUserId(Long input) {
        PreparedStatement stmt = null;
        String sql = "SELECT * FROM ads WHERE user_id = ?";
        try {
            stmt = connection.prepareStatement(sql);
            stmt.setLong(1, input);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> listByCategory(Long input) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE category_id = ?");
            stmt.setLong(1, input);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public List<Ad> listByTitle(String input) {
        PreparedStatement stmt = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE title LIKE ?");
            stmt.setString(1, "%" + input + "%");
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }

    @Override
    public Ad findById(int id) {
        String query = "SELECT * FROM ads WHERE id = ? LIMIT 1";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error finding an ad by id", e);
        }
    }

    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads(user_id, category_id, title, description, listed_on, location, city, zip_code, classified_status_id, price_type_id, price, image) VALUES (?,?,?,?,CURRENT_TIMESTAMP,?,?,?,1,?,?,'http://loremflickr.com/320/240/dog')";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setLong(2, ad.getCategoryId());
            stmt.setString(3, ad.getTitle());
            stmt.setString(4, ad.getDescription());
            stmt.setString(5, ad.getLocation());
            stmt.setString(6, ad.getCity());
            stmt.setInt(7, ad.getZipCode());
            stmt.setInt(8, ad.getPriceTypeId());
            stmt.setDouble(9, ad.getPrice());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            return rs.getLong(1);
        } catch (SQLException e) {
            throw new RuntimeException("Error creating a new ad.", e);
        }
    }

    @Override
    public void edit(Ad ad) {
        String query = "UPDATE ads SET user_id=?, category_id=?, title=?, description=?, listed_on=CURRENT_TIMESTAMP, location=?, city=?, zip_code=?, classified_status_id=1, price_type_id=?, price=?, image='http://loremflickr.com/320/240/dog' WHERE id=?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, ad.getUserId());
            stmt.setLong(2, ad.getCategoryId());
            stmt.setString(3, ad.getTitle());
            stmt.setString(4, ad.getDescription());
            stmt.setString(5, ad.getLocation());
            stmt.setString(6, ad.getCity());
            stmt.setInt(7, ad.getZipCode());
            stmt.setInt(8, ad.getPriceTypeId());
            stmt.setDouble(9, ad.getPrice());
            stmt.setLong(10, ad.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error editing an ad", e);
        }
    }

    @Override
    public void delete(Long adId) {
        String sql = "DELETE FROM ads WHERE ads.id = ?";
            try {
                PreparedStatement stmt = connection.prepareStatement(sql);
                stmt.setLong(1, adId);
                stmt.executeUpdate();
            } catch (SQLException e) {
                throw new RuntimeException("Error deleting an ad.");
            }
        }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
            rs.getLong("id"),
            rs.getLong("user_id"),
            rs.getLong("category_id"),
            rs.getString("title"),
            rs.getString("description"),
            rs.getString("listed_on"),
            rs.getString("location"),
            rs.getString("city"),
            rs.getInt("zip_code"),
            rs.getInt("classified_status_id"),
            rs.getInt("price_type_id"),
            rs.getDouble("price"),
            rs.getString("image")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
}