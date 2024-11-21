package com.airline;

import java.io.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.sql.*;

@WebServlet("/bookFlight")
public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get booking details from the form
        int flightId = Integer.parseInt(request.getParameter("flightId"));
        String passengerName = request.getParameter("passengerName");
        String passengerEmail = request.getParameter("passengerEmail");
        int seatsBooked = Integer.parseInt(request.getParameter("seatsBooked"));

        // Save the booking to the database
        boolean bookingSuccess = DatabaseUtil.bookFlight(flightId, passengerName, passengerEmail, seatsBooked);

        // Check booking status and redirect to the appropriate page
        if (bookingSuccess) {
            response.sendRedirect("bookingSuccess.jsp");
        } else {
            response.sendRedirect("bookingFailure.jsp");
        }
    }
}
