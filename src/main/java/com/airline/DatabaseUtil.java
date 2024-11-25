package com.airline;
import com.airline.Booking;
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

    // Test the database connection
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
                int flightId = resultSet.getInt("flightId");
                String dep = resultSet.getString("departure");
                String dest = resultSet.getString("destination");
                int availableSeats = resultSet.getInt("availableSeats");
                String flightTime = resultSet.getString("flightTime");
                String flightClass = resultSet.getString("flightClass");
                int price = resultSet.getInt("price");  // Fetch the price column
                String flightType = resultSet.getString("flightType"); // Fetch the flightType column

                // Add the flight to the list with the price and flightType
                flights.add(new Flight(flightId, dep, dest, availableSeats, flightTime, flightClass, price, flightType));
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flights;
    }

    // Method to book a flight
    public static boolean bookFlight(int flightId, String passengerName, String passengerEmail, int seatsBooked, String date) {
        // Query to get the departure and destination of the flight
        String getFlightDetailsQuery = "SELECT departure, destination FROM flights WHERE flightId = ?";
        
        // Query to insert the booking with departure and destination
        String insertQuery = "INSERT INTO bookings (flightId, passengerName, passengerEmail, seatsBooked, departure, destination, bookingDate) VALUES (?, ?, ?, ?, ?, ?, ?)";
        
        // Query to update available seats in the flights table
        String updateSeatsQuery = "UPDATE flights SET availableSeats = availableSeats - ? WHERE flightId = ?";
        
        try (Connection connection = getConnection()) {
            // Start a transaction
            connection.setAutoCommit(false);
            
            // Fetch the departure and destination for the flightId
            String departure = null;
            String destination = null;
            
            try (PreparedStatement flightDetailsStmt = connection.prepareStatement(getFlightDetailsQuery)) {
                flightDetailsStmt.setInt(1, flightId);
                try (ResultSet rs = flightDetailsStmt.executeQuery()) {
                    if (rs.next()) {
                        departure = rs.getString("departure");
                        destination = rs.getString("destination");
                    } else {
                        // If the flight is not found, return false
                        return false;
                    }
                }
            }

            // Insert booking
            try (PreparedStatement insertStmt = connection.prepareStatement(insertQuery)) {
                insertStmt.setInt(1, flightId);
                insertStmt.setString(2, passengerName);
                insertStmt.setString(3, passengerEmail);
                insertStmt.setInt(4, seatsBooked);
                insertStmt.setString(5, departure);  // Add departure
                insertStmt.setString(6, destination);
                insertStmt.setString(7, date);// Add destination
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

    // Method to fetch flight details by flightId
    public static Flight getFlightDetailsById(int flightId) {
        Flight flight = null;
        String query = "SELECT * FROM flights WHERE flightId = ?";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setInt(1, flightId); // Set the flightId as an integer
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                flight = new Flight(
                    rs.getInt("flightId"),
                    rs.getString("departure"),
                    rs.getString("destination"),
                    rs.getInt("availableSeats"),
                    rs.getString("flightTime"),
                    rs.getString("flightClass"),
                    rs.getInt("price"),        // Add the price field
                    rs.getString("flightType") // Add the flightType field
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return flight;
    }

    // Method to cancel a booking
    public static boolean cancelBooking(int bookingId) {
        String updateBookingQuery = "UPDATE bookings SET status = 'Canceled' WHERE bookingId = ?";
        String updateSeatsQuery = "UPDATE flights SET availableSeats = availableSeats + ? WHERE flightId = ?";
        String fetchBookingQuery = "SELECT flightId, seatsBooked FROM bookings WHERE bookingId = ? AND status = 'Confirmed'";

        try (Connection connection = getConnection()) {
            // Start a transaction
            connection.setAutoCommit(false);

            int flightId = 0;
            int seatsBooked = 0;

            // Fetch flightId and seatsBooked for the booking
            try (PreparedStatement fetchStmt = connection.prepareStatement(fetchBookingQuery)) {
                fetchStmt.setInt(1, bookingId);
                ResultSet rs = fetchStmt.executeQuery();

                if (rs.next()) {
                    flightId = rs.getInt("flightId");
                    seatsBooked = rs.getInt("seatsBooked");
                } else {
                    // No matching booking found or already canceled
                    return false;
                }
            }

            // Update the booking status to "Canceled"
            try (PreparedStatement updateBookingStmt = connection.prepareStatement(updateBookingQuery)) {
                updateBookingStmt.setInt(1, bookingId);
                updateBookingStmt.executeUpdate();
            }

            // Restore the seat count in the flights table
            try (PreparedStatement updateSeatsStmt = connection.prepareStatement(updateSeatsQuery)) {
                updateSeatsStmt.setInt(1, seatsBooked);
                updateSeatsStmt.setInt(2, flightId);
                updateSeatsStmt.executeUpdate();
            }

            // Commit the transaction
            connection.commit();
            return true;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Method to get all confirmed bookings
    public static List<Booking> getAllBookings() {
        List<Booking> bookings = new ArrayList<>();
        String query = "SELECT b.bookingId, b.flightId, b.passengerName, b.passengerEmail, b.seatsBooked, b.bookingDate, b.departure, b.destination, f.price " +
                "FROM bookings b " +
                "JOIN flights f ON b.flightId = f.flightId " +
                "WHERE b.status = 'Confirmed'";

        try (Connection connection = getConnection();
             PreparedStatement stmt = connection.prepareStatement(query);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                bookings.add(new Booking(
                    rs.getInt("bookingId"),
                    rs.getInt("flightId"),
                    rs.getString("passengerName"),
                    rs.getString("passengerEmail"),
                    rs.getInt("seatsBooked"),
                    rs.getString("bookingDate"),
                    rs.getString("departure"),  // Fetching departure
                    rs.getString("destination"),
                    rs.getInt("price")// Fetching price
                ));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        
        System.out.println("Bookings fetched: " + bookings.size());
        return bookings;
    }
}
