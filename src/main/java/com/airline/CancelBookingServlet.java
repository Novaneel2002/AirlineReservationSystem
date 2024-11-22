package com.airline;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cancelBooking")
public class CancelBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String bookingIdParam = request.getParameter("bookingId");
        int bookingId = Integer.parseInt(bookingIdParam);

        boolean canceled = DatabaseUtil.cancelBooking(bookingId);

        if (canceled) {
            request.setAttribute("message", "Booking canceled successfully!");
        } else {
            request.setAttribute("message", "Failed to cancel booking. Please check the booking ID or try again.");
        }

        // Forward to confirmation JSP
        RequestDispatcher dispatcher = request.getRequestDispatcher("cancelConfirmation.jsp");
        dispatcher.forward(request, response);
    }
}
