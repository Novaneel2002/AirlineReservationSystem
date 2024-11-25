package com.airline;

import java.io.IOException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

// Annotation to define the URL pattern for this servlet
@WebServlet("/viewBookings")
public class viewBookings extends HttpServlet {

    // The doGet method is used to handle GET requests from the client
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        // Test the database connection. It prints a message if successful.
        DatabaseUtil.testConnection();

        // Fetch all confirmed bookings from the database using the DatabaseUtil
        List<Booking> bookings = DatabaseUtil.getAllBookings();
        
        // Log the size of the bookings list to the console for debugging purposes
        System.out.println("Hello Here's the data");
        System.out.println("Bookings size: " + bookings.size());

        // Loop through the bookings list and log the booking ID for each booking
        for (Booking booking : bookings) {
            System.out.println("Booking ID: " + booking.getBookingId());
        }

        // Set the bookings list as a request attribute to make it available to the JSP page
        request.setAttribute("bookings", bookings);

        // Forward the request to the "viewBookings.jsp" page to display the bookings
        // The JSP will access the 'bookings' attribute and render the details
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewBookings.jsp");
        dispatcher.forward(request, response);
    }
}
