<%@ page import="java.util.*" %>
<%@ page import="java.lang.*" %>
<%@ page import="com.airline.DatabaseUtil" %>
<%@ page import="com.airline.Flight" %>
<%
    // Retrieve the flightId from the URL parameter
    String flightIdParam = request.getParameter("flightId");
    int flightId = 0;

    // Convert the flightId to an integer if it's not null and valid
    if (flightIdParam != null) {
        try {
            flightId = Integer.parseInt(flightIdParam); // Try to convert to integer
        } catch (NumberFormatException e) {
            flightId = 0; // Default to 0 if the conversion fails
        }
    }

    // Fetch flight details from the database using the flightId
    Flight flight = null;
    if (flightId != 0) {
        flight = DatabaseUtil.getFlightDetailsById(flightId); // Ensure this method exists in DatabaseUtil
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <!-- Metadata for character set and viewport settings -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Title of the page -->
    <title>Book Flight</title>
    
    <!-- Link to Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    
    <style>
        /* Custom background color and text color for specific sections */
        .primary-bg {
            background-color: #294067;
        }
        .primary-text {
            color: #294067;
        }
        .secondary-bg {
            background-color: white;
        }
        .button-bg {
            background-color: #294067;
            color: white;
        }
        .card-custom {
            background-color: white;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .form-control-custom {
            border: 1px solid #294067;
        }
        .link-custom {
            color: #294067;
        }
        /* Larger font size for better readability */
        .primary-text {
            font-size: 1.2rem; /* Larger font size */
            margin-bottom: 10px; /* Spacing below the text */
        }
        .form-label {
            font-size: 1.1rem;
        }
        .btn {
            font-size: 1.1rem;
        }
    </style>
</head>
<body class="bg-light">

    <!-- Main container for the flight booking form -->
    <div class="container d-flex justify-content-center align-items-center min-vh-100">
        <div class="card card-custom p-4 shadow-sm" style="width: 100%; max-width: 500px;">
            <!-- Title for the flight booking page -->
            <h2 class="text-center text-primary mb-4">Book your Flight!</h2>

            <% if (flight != null) { %>
                <!-- Display flight details if the flight was found -->
                <div class="row mb-4">
                    <div class="col-6">
                        <!-- Flight details: ID, departure, available seats, and class -->
                        <p class="primary-text"><strong>Flight ID:</strong> <%= flightId %></p>
                        <p class="primary-text"><strong>Departure:</strong> <%= flight.getDeparture() %></p>
                        <p class="primary-text"><strong>Available Seats:</strong> <%= flight.getAvailableSeats() %></p>
                        <p class="primary-text"><strong>Class:</strong> <%= flight.getFlightClass() %></p>
                    </div>
                    <div class="col-6">
                        <!-- Flight details: destination, time, type, and date -->
                        <p class="primary-text"><strong>Destination:</strong> <%= flight.getDestination() %></p>
                        <p class="primary-text"><strong>Time:</strong> <%= flight.getFlightTime() %></p>
                        <p class="primary-text"><strong>Type:</strong> <%= flight.getFlightType() %></p>
                        <p class="primary-text"><strong>Date:</strong> <%= request.getParameter("date") %></p>
                    </div>
                </div>

                <!-- Booking form -->
                <form action="bookFlight" method="post">
                    <!-- Hidden inputs to send flightId and selected date with the form -->
                    <input type="hidden" name="flightId" value="<%= flightId %>">
                    <input type="hidden" name="date" value="<%= request.getParameter("date") %>">
                    
                    <!-- Passenger name input field -->
                    <div class="mb-3">
                        <label for="passengerName" class="form-label text-primary">Name:</label>
                        <input type="text" class="form-control form-control-custom" placeholder="Enter your name" id="passengerName" name="passengerName" required>
                    </div>

                    <!-- Passenger email input field -->
                    <div class="mb-3">
                        <label for="passengerEmail" class="form-label text-primary">Email:</label>
                        <input type="email" class="form-control form-control-custom" placeholder="Enter your Email" id="passengerEmail" name="passengerEmail" required>
                    </div>

                    <!-- Number of seats to be booked input field -->
                    <div class="mb-3">
                        <label for="seatsBooked" class="form-label text-primary">No. of Seats:</label>
                        <input type="number" class="form-control form-control-custom" placeholder="Select no. of seats" id="seatsBooked" name="seatsBooked" min="1" max="<%= flight.getAvailableSeats() %>" required>
                    </div>

                    <!-- Submit button for booking the flight -->
                    <button type="submit" class="btn button-bg w-100">Book Flight</button>
                </form>
                
                <!-- Link to return to the home page -->
                <a href="index.html" class="d-block text-center mt-3 text-decoration-none link-custom">Back to Home</a>
            <% } else { %>
                <!-- If no flight details were found, display a message -->
                <p>No flight details found for the provided Flight ID. <%= flightId %></p>
                <a href="index.html" class="link-custom">Back to Home</a>
            <% } %>
        </div>
    </div>

    <!-- Optional Bootstrap JS for components that require JavaScript -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
