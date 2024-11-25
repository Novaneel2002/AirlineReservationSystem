package com.airline;

import java.io.*;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.util.Date;
import java.util.List;

// Servlet mapping to handle search flights functionality at the URL "/searchFlights"
@WebServlet("/searchFlights")
public class SearchFlightServlet extends HttpServlet {

    // Handles GET requests to search for flights based on provided criteria
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Test the database connection to ensure it's working before searching for flights
        DatabaseUtil.testConnection();

        // Retrieve the search parameters from the request
        String departure = request.getParameter("departure");  // Departure city or airport
        String destination = request.getParameter("destination");  // Destination city or airport
        String date = request.getParameter("date");  // Date of the flight in YYYY-MM-DD format

        // Log the inputs for debugging purposes
        System.out.println("Departure: " + departure);
        System.out.println("Destination: " + destination);
        System.out.println("Date (YYYY-MM-DD): " + date);

        // Format the date from the input format (YYYY-MM-DD) to DD-MM-YYYY
        String formattedDate = formatDate(date);

        // Call DatabaseUtil to search for flights based on departure, destination, and other criteria
        List<Flight> flights = DatabaseUtil.searchFlights(departure, destination);

        // Log the retrieved flights for debugging
        if (flights == null || flights.isEmpty()) {
            System.out.println("No flights found for the given criteria.");
        } else {
            // Log the details of each flight found in the database
            for (Flight flight : flights) {
                System.out.println("Flight ID: " + flight.getFlightId());
                System.out.println("Price: " + flight.getPrice());
            }
        }

        // Set the list of flights and the selected date as attributes for the JSP page
        request.setAttribute("flights", flights);  // Pass the list of flights to the JSP
        request.setAttribute("selectedDate", formattedDate);  // Pass the formatted date to the JSP

        // Forward the request and response to the results page (searchResults.jsp) to display the results
        RequestDispatcher dispatcher = request.getRequestDispatcher("/searchResults.jsp");
        dispatcher.forward(request, response);
    }

    /**
     * Converts a date string from the format YYYY-MM-DD to DD-MM-YYYY format.
     * 
     * @param date the input date string in YYYY-MM-DD format
     * @return the formatted date string in DD-MM-YYYY format, or the original date if conversion fails
     */
    private String formatDate(String date) {
        if (date == null || date.isEmpty()) {
            return "";  // Return an empty string if the date is null or empty
        }
        try {
            // Parse the date using the input format (YYYY-MM-DD)
            SimpleDateFormat inputFormat = new SimpleDateFormat("yyyy-MM-dd");
            // Define the desired output format (DD-MM-YYYY)
            SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");
            // Parse the date string and format it into the desired output format
            Date parsedDate = inputFormat.parse(date);
            return outputFormat.format(parsedDate);  // Return the formatted date
        } catch (ParseException e) {
            // Log the error if parsing fails and return the original date string
            System.err.println("Error parsing date: " + e.getMessage());
            return date;  // Return the original date if parsing fails
        }
    }
}
