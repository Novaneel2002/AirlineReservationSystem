package com.airline;

import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.IOException;

@WebServlet("/cancelBooking")  // This annotation maps the servlet to the URL pattern "/cancelBooking"
public class CancelBookingServlet extends HttpServlet {
    
    // The doPost method handles HTTP POST requests sent to this servlet
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        // Retrieve the booking ID from the HTTP request. The booking ID is passed as a request parameter from the form.
        String bookingIdParam = request.getParameter("bookingId");  // Fetching the booking ID from the form
        int bookingId = Integer.parseInt(bookingIdParam);  // Convert the booking ID from String to integer
        
        // Call the DatabaseUtil class to cancel the booking with the provided booking ID
        // The cancelBooking method returns a boolean indicating whether the cancellation was successful
        boolean canceled = DatabaseUtil.cancelBooking(bookingId);
        
        // Set a message attribute to be forwarded to the confirmation page based on the cancellation result
        if (canceled) {
            // If booking is successfully canceled, set a success message
            request.setAttribute("message", "Booking canceled successfully!");
        } else {
            // If cancellation fails, set a failure message
            request.setAttribute("message", "Failed to cancel booking. Please check the booking ID or try again.");
        }
        
        // Forward the request to the cancellation confirmation page (cancelConfirmation.jsp)
        // This allows the user to see the status of their cancellation request
        RequestDispatcher dispatcher = request.getRequestDispatcher("cancelConfirmation.jsp");
        dispatcher.forward(request, response);  // Forward the request and response to the JSP page
    }
}
