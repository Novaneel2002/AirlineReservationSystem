package com.airline;
import java.io.IOException;

import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewBookings")
public class viewBookings extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	DatabaseUtil.testConnection();
        List<Booking> bookings = DatabaseUtil.getAllBookings();
        
        
        System.out.println("Hello Here's the data");
        System.out.println("Bookings size: " + bookings.size());
        for (Booking booking : bookings) {
            System.out.println("Booking ID: " + booking.getBookingId());
        }
        
        
        
        request.setAttribute("bookings", bookings);
//        request.getRequestDispatcher("viewBookings.jsp").forward(request, response);
        RequestDispatcher dispatcher = request.getRequestDispatcher("viewBookings.jsp");
        dispatcher.forward(request, response);
    }
}
