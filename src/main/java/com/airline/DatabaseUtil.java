package com.airline;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DatabaseUtil {
    // Database connection details
    private static final String URL = "jdbc:mysql://localhost:3306/airline_reservation_db"; // Adjust this to your database
    private static final String USER = "root"; // Your MySQL username
    private static final String PASSWORD = "Jhalak%2002"; // Your MySQL password

    // Method to establish and return a database connection
    private static Connection getConnection() throws SQLException {
        try {
            // Load the MySQL JDBC driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            throw new SQLException("Database connection error", e);
        }
    }
    public static void testConnection() {
        try (Connection connection = getConnection()) {
            if (connection != null) {
                System.out.println("Database connection successful Novaneel!");
            } else {
                System.out.println("Failed to connect to the database.");
            }
        } catch (SQLException e) {
            System.out.println("Error while connecting to the database: " + e.getMessage());
            e.printStackTrace();
        }
    }
    // Method to search flights based on departure and destination
    public static List<Flight> searchFlights(String departure, String destination) {
        List<Flight> flights = new ArrayList<>();
        String query = "SELECT * FROM flights WHERE departure = ? AND destination = ?";

        try (Connection connection = getConnection();
             PreparedStatement preparedStatement = connection.prepareStatement(query)) {

            // Set the parameters for the query
            preparedStatement.setString(1, departure);
            preparedStatement.setString(2, destination);

            // Execute the query and get the results
            ResultSet resultSet = preparedStatement.executeQuery();

            // Extract data from the ResultSet and add to the flights list
            while (resultSet.next()) {
            	System.out.println(resultSet.getInt("flightId"));
                int flightId = resultSet.getInt("flightId");
                String dep = resultSet.getString("departure");
                String dest = resultSet.getString("destination");
                int availableSeats = resultSet.getInt("availableSeats");
                String flightTime = resultSet.getString("flightTime");
                String flightClass = resultSet.getString("flightClass");

                // Add the flight to the list
                flights.add(new Flight(flightId, dep, dest, availableSeats, flightTime, flightClass));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }
    
//    Booking Flight
    public static boolean bookFlight(int flightId, String passengerName, String passengerEmail, int seatsBooked) {
        String insertQuery = "INSERT INTO bookings (flightId, passengerName, passengerEmail, seatsBooked) VALUES (?, ?, ?, ?)";
        String updateSeatsQuery = "UPDATE flights SET availableSeats = availableSeats - ? WHERE flightId = ?";

        try (Connection connection = getConnection()) {
            // Start a transaction
            connection.setAutoCommit(false);

            // Insert booking
            try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                insertStmt.setInt(1, flightId);
                insertStmt.setString(2, passengerName);
                insertStmt.setString(3, passengerEmail);
                insertStmt.setInt(4, seatsBooked);
                insertStmt.executeUpdate();
            }

            // Update available seats
            try (PreparedStatement updateStmt = connection.prepareStatement(updateSeatsQuery)) {
                updateStmt.setInt(1, seatsBooked);
                updateStmt.setInt(2, flightId);
                updateStmt.executeUpdate();
            }

            // Commit the transaction
            connection.commit();
            return true;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

}