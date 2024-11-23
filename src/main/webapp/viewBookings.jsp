<%@ page import="com.airline.Booking" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmed Bookings</title>
</head>
<body>
    <h2>Confirmed Bookings</h2>
    
    <table border="1">
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Passenger Name</th>
                <th>Email</th>
                <th>Flight ID</th>
                <th>Departure</th> <!-- Added departure -->
                <th>Destination</th> <!-- Added destination -->
                <th>Seats Booked</th>
                <th>Total Price</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                if (bookings != null && !bookings.isEmpty()) {
                    for (Booking booking : bookings) {
            %>
            <tr>
                <td><%= booking.getBookingId() %></td>
                <td><%= booking.getPassengerName() %></td>
                <td><%= booking.getPassengerEmail() %></td>
                <td><%= booking.getFlightId() %></td>
                <td><%= booking.getDeparture() %></td> <!-- Displaying departure -->
                <td><%= booking.getDestination() %></td> <!-- Displaying destination -->
                <td><%= booking.getSeatsBooked() %></td>
                <td><%= booking.getPrice()*booking.getSeatsBooked() %></td>
                <td>
                    <form action="cancelBooking" method="POST"  onsubmit="return confirmCancellation()">
                        <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                        <input type="submit" value="Cancel">
                    </form>
                </td>
            </tr>
            <% 
                    }
                } else {
            %>
            <tr>
                <td colspan="8">No bookings found.</td>
            </tr>
            <% 
                }
            %>
        </tbody>
    </table>

    <script type="text/javascript">
        function confirmCancellation() {
            // Display the confirmation dialog
            var confirmAction = confirm("Are you sure you want to cancel this booking?");
            
            // If the user clicks "OK", return true to submit the form, otherwise return false
            return confirmAction;
        }
    </script>
</body>
</html>
