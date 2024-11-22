<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.airline.DatabaseUtil" %>
<%@ page import="com.airline.Flight" %>
<%
    // Retrieve the flightId from the URL
    String flightIdParam = request.getParameter("flightId");
    int flightId = 0;

    // Convert the flightId to an integer if it's not null
    if (flightIdParam != null) {
        try {
            flightId = Integer.parseInt(flightIdParam);
        } catch (NumberFormatException e) {
            flightId = 0; // Default to 0 if the conversion fails
        }
    }
    System.out.println(flightId);
 // Fetch flight details using the flightId
    Flight flight = null;
    if (flightId != 0) {
        flight = DatabaseUtil.getFlightDetailsById(flightId); // Ensure this method exists in DatabaseUtil
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight</title>
</head>
<body>
    <h2>Flight Booking</h2>

    <% if (flight != null) { %>
        <p>Flight ID: <%= flightId %></p>
        <p>Departure: <%= flight.getDeparture() %></p>
        <p>Destination: <%= flight.getDestination() %></p>
        <p>Available Seats: <%= flight.getAvailableSeats() %></p>
        <p>Flight Time: <%= flight.getFlightTime() %></p>
        <p>Flight Class: <%= flight.getFlightClass() %></p>

        <form action="bookFlight" method="post">
            <input type="hidden" name="flightId" value="<%= flightId %>">

            <label for="passengerName">Name:</label>
            <input type="text" id="passengerName" name="passengerName" required><br><br>

            <label for="passengerEmail">Email:</label>
            <input type="email" id="passengerEmail" name="passengerEmail" required><br><br>

            <label for="seatsBooked">Seats:</label>
            <input type="number" id="seatsBooked" name="seatsBooked" min="1" max="<%= flight.getAvailableSeats() %>" required><br><br>

            <button type="submit">Book Flight</button>
        </form>
    <% } else { %>
        <p>No flight details found for the provided Flight ID. <%= flightId %></p>
        <a href="searchFlights">Back to Search Results</a>
    <% } %>
</body>
</html>
