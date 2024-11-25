package com.airline;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/bookFlight")  // This annotation maps the servlet to the URL pattern "/bookFlight"
public class BookingServlet extends HttpServlet {
    
    // The doPost method handles HTTP POST requests sent to this servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve the booking details from the HTTP request sent by the user
        // Using request.getParameter() to fetch values from form inputs
        int flightId = Integer.parseInt(request.getParameter("flightId"));  // Flight ID selected by the user
        String passengerName = request.getParameter("passengerName");       // Passenger's full name
        String passengerEmail = request.getParameter("passengerEmail");     // Passenger's email address
        int seatsBooked = Integer.parseInt(request.getParameter("seatsBooked"));  // Number of seats the user wants to book
        String date = request.getParameter("date");                        // Date of the booking

        // Call the DatabaseUtil class to save the booking details into the database
        // The bookFlight method will return a boolean indicating if the booking was successful
        boolean bookingSuccess = DatabaseUtil.bookFlight(flightId, passengerName, passengerEmail, seatsBooked, date);

        // Check if the booking was successful based on the boolean returned by the bookFlight method
        if (bookingSuccess) {
            // If booking is successful, redirect to the booking success page
            response.sendRedirect("bookingSuccess.jsp");  // Redirects the user to a page that confirms their booking
        } else {
            // If booking fails, redirect to the booking failure page
            response.sendRedirect("bookingFailure.jsp");  // Redirects the user to a page that indicates booking failure
        }
    }
}
