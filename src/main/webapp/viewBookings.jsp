<%@ page import="com.airline.Booking" %>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Confirmed Bookings</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/searchstyle.css">
    <style>
        body {
            background-color: #f8f9fa; /* Light background color */
            font-family: Arial, sans-serif; /* Font style */
        }
        .table-container {
            margin-top: 50px; /* Spacing for the table */
        }
        .logo {
            width: 150px;
            height: auto; /* Logo size */
        }
    </style>
</head>
<body>
<!-- Header section -->
<div style="background-color:#294067 !important;" class="container-fluid bg-primary text-white text-center py-3 d-flex justify-content-between align-items-center">
    <img src="Images/logo.png" alt="Colonial Flights Logo" class="img-fluid" style="max-height: 50px;"> <!-- Logo image -->
    <h1 style="font-weight: 500;" class="m-0">Welcome to Colonial Airlines</h1> <!-- Heading -->
    
    <!-- Button to view all bookings -->
    <div style="width:4rem">
    </div>
</div>

<!-- Main content for displaying confirmed bookings -->
<div style="min-height: 83vh;" class="container text-center table-container">
    <h2 class="mb-4">Confirmed Bookings <i class="bi bi-journal-check"></i></h2>
    
    <!-- Button to go back to the homepage -->
    <div style="text-align: left; margin-bottom: 10px;">
        <a style="border:none; background-color:#a0c3ffbc; border-radius:2rem; color:black !important;" href="index.html" class="btn btn-dark">
            <i class="bi bi-arrow-bar-left"></i>  Back to home
        </a>
    </div>
    
    <!-- Table for displaying booking details -->
    <div class="table-responsive">
        <table border="1" class="table table-bordered table-hover table-striped">
            <thead class="table-dark">
                <tr class="tablehead">
                    <th>Booking ID</th>
                    <th>Passenger Name</th>
                    <th>Email</th>
                    <th>Flight ID</th>
                    <th>Departure <i class="bi bi-arrow-up-circle"></i></th>
                    <th>Destination <i class="bi bi-arrow-down-circle"></i></th>
                    <th>Date</th>
                    <th>Seats Booked</th>
                    <th>Total Price <i class="bi bi-currency-rupee"></i></th>
                    <th>Cancellation</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Retrieving the list of bookings from the request attribute
                    List<Booking> bookings = (List<Booking>) request.getAttribute("bookings");
                    if (bookings != null && !bookings.isEmpty()) {
                        // Loop through each booking and display the details in a table row
                        for (Booking booking : bookings) {
                %>
                <tr  class="table-content">
                    <!-- Display booking details for each booking -->
                    <td><%= booking.getBookingId() %></td>
                    <td><%= booking.getPassengerName() %></td>
                    <td><%= booking.getPassengerEmail() %></td>
                    <td><%= booking.getFlightId() %></td>
                    <td><%= booking.getDeparture() %></td> <!-- Departure location -->
                    <td><%= booking.getDestination() %></td> <!-- Destination location -->
                    <td><%= booking.getBookingDate() %></td>
                    <td><%= booking.getSeatsBooked() %></td> <!-- Number of seats booked -->
                    <td style="color:green !important; font-weight: 600 !important;">
                        <%= booking.getPrice() * booking.getSeatsBooked() %>
                    </td> <!-- Total price -->
                    <td>
                        <!-- Form for cancelling a booking -->
                        <form action="cancelBooking" method="POST"  onsubmit="return confirmCancellation()">
                            <input type="hidden" name="bookingId" value="<%= booking.getBookingId() %>">
                            <button type="submit" class="btn btn-danger btn-sm">Cancel Ticket</button>
                        </form>
                    </td>
                </tr>
                <% 
                        }
                    } else {
                %>
                <!-- If no bookings are found, display a message -->
                <tr>
                    <td colspan="10" class="text-center">No bookings found.</td>
                </tr>
                <% 
                    }
                %>
                <!-- End of table -->
                <tr>
                    <td colspan="10" class="text-center">Looks like you have reached the end.</td>
                </tr>
            </tbody>
        </table>
    </div>
</div>

<!-- JavaScript function for confirming cancellation -->
<script type="text/javascript">
    function confirmCancellation() {
        // Display the confirmation dialog
        var confirmAction = confirm("Are you sure you want to cancel this booking?");
        
        // If the user clicks "OK", return true to submit the form, otherwise return false
        return confirmAction;
    }
</script>

<!-- Footer section with about, quick links, and contact information -->
<footer class="bg-dark text-white py-4">
    <div class="container">
        <div class="row text-center text-md-start">
            <!-- About Section -->
            <div class="col-md-4 mb-3">
                <h5>About Us</h5>
                <p>
                    Colonial Airlines has been connecting destinations worldwide with reliable service and customer satisfaction for over 50 years.
                </p>
            </div>

            <!-- Quick Links Section -->
            <div class="col-md-4 mb-3">
                <h5>Quick Links</h5>
                <ul class="list-unstyled">
                    <li><a href="#" class="text-white text-decoration-none">Search Flights</a></li>
                    <li><a href="#" class="text-white text-decoration-none">View Bookings</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Book Hotels</a></li>
                    <li><a href="#" class="text-white text-decoration-none">Hire a Car</a></li>
                </ul>
            </div>

            <!-- Contact Section -->
            <div class="col-md-4 mb-3">
                <h5>Contact Us</h5>
                <p><i class="bi bi-geo-alt-fill"></i> 123 Flight Lane, Sky City, Cloud Country</p>
                <p><i class="bi bi-envelope-fill"></i> support@colonialflights.com</p>
                <p><i class="bi bi-telephone-fill"></i> +1-800-555-1234</p>
                <div>
                    <a href="#" class="text-white me-2"><i class="bi bi-facebook"></i></a>
                    <a href="#" class="text-white me-2"><i class="bi bi-twitter"></i></a>
                    <a href="#" class="text-white me-2"><i class="bi bi-instagram"></i></a>
                    <a href="#" class="text-white"><i class="bi bi-linkedin"></i></a>
                </div>
            </div>
        </div>

        <hr class="text-secondary">
        <div class="text-center">
            <p class="mb-0">© 2024 Colonial Airlines. All rights reserved.</p>
        </div>
    </div>
</footer>

</body>
</html>
