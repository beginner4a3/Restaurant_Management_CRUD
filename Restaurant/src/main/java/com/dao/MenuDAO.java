package com.dao;

import com.model.MenuItem;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MenuDAO {
    private String jdbcURL = "jdbc:mysql://localhost:3306/restaurantdb";
    private String jdbcUsername = "root";
    private String jdbcPassword = "30Mar03!";

    private static final String INSERT_ITEM_SQL = "INSERT INTO menu" +
            " (name, price, category, description, quantityType) VALUES " + " (?, ?, ?, ?, ?);";
    private static final String SELECT_ITEM_BY_ID = "SELECT id, name, price, category, description, quantityType FROM menu WHERE id = ?";
    private static final String SELECT_ALL_ITEMS = "SELECT * FROM menu";
    private static final String DELETE_ITEM_SQL = "DELETE FROM menu WHERE id = ?;";
    private static final String UPDATE_ITEM_SQL = "UPDATE menu SET name = ?, price = ?, category = ?, description = ?, quantityType = ? WHERE id = ?;";
    private static final String SEARCH_ITEMS = "SELECT * FROM menu WHERE name LIKE ? OR category LIKE ? OR description LIKE ?";
    private static final String GET_CATEGORIES = "SELECT DISTINCT category FROM menu";
    private static final String GET_ITEM_NAMES = "SELECT DISTINCT name FROM menu";

    public MenuDAO() {}

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return connection;
    }

    // Insert a new menu item
    public void insertMenuItem(MenuItem menuItem) throws SQLException {
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(INSERT_ITEM_SQL)) {
            preparedStatement.setString(1, menuItem.getName());
            preparedStatement.setDouble(2, menuItem.getPrice());
            preparedStatement.setString(3, menuItem.getCategory());
            preparedStatement.setString(4, menuItem.getDescription());
            preparedStatement.setString(5, menuItem.getQuantityType());
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Select menu item by ID
    public MenuItem selectMenuItemById(int id) throws SQLException {
        MenuItem menuItem = null;
        
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ITEM_BY_ID)) {
            preparedStatement.setInt(1, id);
            
            ResultSet resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                String name = resultSet.getString("name");
                double price = resultSet.getDouble("price");
                String category = resultSet.getString("category");
                String description = resultSet.getString("description");
                String quantityType = resultSet.getString("quantityType");
                
                menuItem = new MenuItem(id, name, price, category, description, quantityType);
            }
        }
        return menuItem;
    }


    // Select all menu items
    public List<MenuItem> selectAllMenuItems() {
        List<MenuItem> items = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_ITEMS);) {
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String quantityType = rs.getString("quantityType");
                items.add(new MenuItem(id, name, price, category, description, quantityType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // Update menu item
    public boolean updateMenuItem(MenuItem menuItem) throws SQLException {
        boolean rowUpdated;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(UPDATE_ITEM_SQL);) {
            statement.setString(1, menuItem.getName());
            statement.setDouble(2, menuItem.getPrice());
            statement.setString(3, menuItem.getCategory());
            statement.setString(4, menuItem.getDescription());
            statement.setString(5, menuItem.getQuantityType());
            statement.setInt(6, menuItem.getId());
            rowUpdated = statement.executeUpdate() > 0;
        }
        return rowUpdated;
    }

    // Delete menu item
    public boolean deleteMenuItem(int id) throws SQLException {
        boolean rowDeleted;
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement(DELETE_ITEM_SQL);) {
            statement.setInt(1, id);
            rowDeleted = statement.executeUpdate() > 0;
        }
        return rowDeleted;
    }

    // Search items based on name, category, or description
    public List<MenuItem> searchItems(String keyword) {
        List<MenuItem> items = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(SEARCH_ITEMS);) {
            String searchQuery = "%" + keyword + "%";
            preparedStatement.setString(1, searchQuery);
            preparedStatement.setString(2, searchQuery);
            preparedStatement.setString(3, searchQuery);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                int id = rs.getInt("id");
                String name = rs.getString("name");
                double price = rs.getDouble("price");
                String category = rs.getString("category");
                String description = rs.getString("description");
                String quantityType = rs.getString("quantityType");
                items.add(new MenuItem(id, name, price, category, description, quantityType));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return items;
    }

    // Get distinct categories
    public List<String> getCategories() {
        List<String> categories = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_CATEGORIES);
             ResultSet rs = preparedStatement.executeQuery();) {
            while (rs.next()) {
                categories.add(rs.getString("category"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return categories;
    }

    // Get distinct item names
    public List<String> getItemNames() {
        List<String> itemNames = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(GET_ITEM_NAMES);
             ResultSet rs = preparedStatement.executeQuery();) {
            while (rs.next()) {
                itemNames.add(rs.getString("name"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return itemNames;
    }
}
