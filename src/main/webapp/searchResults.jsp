<%@ page import="java.util.List" %>
<%@ page import="com.airline.Flight" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Results</title>
    <!-- Bootstrap CSS for styling -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link rel="stylesheet" href="css/searchstyle.css">
    <style>
        /* Custom CSS for styling the page */
        body {
            background-color: #f8f9fa;
            font-family: Arial, sans-serif;
        }
        .table-container {
            margin-top: 50px;
        }
        .logo {
            width: 150px;
            height: auto;
        }
    </style>
</head>
<body>
    <!-- Header section with the airline logo and title -->
    <div style="background-color:#294067 !important;" class="container-fluid bg-primary text-white text-center py-3 d-flex justify-content-between align-items-center">
        <img src="Images/logo.png" alt="Colonial Flights Logo" class="img-fluid" style="max-height: 50px;">
        <h1 style="font-weight: 500;" class="m-0">Welcome to Colonial Airlines</h1>
        
        <!-- Link to view all bookings -->
        <form action="viewBookings" method="get" class="mb-0">
            <button type="submit" style="background-color: #402ffe !important;" class="btn btn-secondary">All Bookings</button>
        </form>
    </div>

    <!-- Main content section for displaying flight results -->
    <div style="min-height: 83vh;" class="container text-center table-container">
        <h2 class="mb-4">Here are your Flights for <%= request.getAttribute("selectedDate") %>! <i class="bi bi-airplane"></i></h2>

        <!-- Flight Results Table -->
        <div class="table-responsive">
            <!-- Back to home button -->
            <div style="text-align: left; margin-bottom: 10px;">
                <a style="border:none; background-color:#a0c3ffbc; border-radius:2rem; color:black !important;" href="index.html" class="btn btn-dark">
                    <i class="bi bi-arrow-bar-left"></i>  Back to home
                </a>
            </div>

            <table class="table table-bordered table-hover table-striped">
                <thead class="table-dark">
                    <tr class="tablehead">
                        <!-- Table headers for flight details -->
                        <th>Flight ID</th>
                        <th>Departure <i class="bi bi-arrow-up-circle"></i></th>
                        <th>Destination <i class="bi bi-arrow-down-circle"></i></th>
                        <th>Available Seats <i class="bi bi-grid-3x2-gap"></i></th>
                        <th>Flight Time <i class="bi bi-clock-history"></i></th>
                        <th>Flight Class</th>
                        <th>Price <i class="bi bi-currency-rupee"></i></th>
                        <th>Flight Type</th>
                        <th>Book Flight</th>
                    </tr>
                </thead>
                <tbody>
                    <% 
                        // Retrieving the list of flights and selected date from the request
                        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
                        String selectedDate = (String) request.getAttribute("selectedDate");

                        // Check if there are flights available
                        if (flights != null && !flights.isEmpty()) {
                            for (Flight flight : flights) {
                    %>
                    <!-- Displaying flight details in each row -->
                    <tr class="table-content">
                        <td><%= flight.getFlightId() %></td>
                        <td><%= flight.getDeparture() %></td>
                        <td><%= flight.getDestination() %></td>
                        <td><%= flight.getAvailableSeats() %></td>
                        <td><%= flight.getFlightTime() %></td>
                        <td><%= flight.getFlightClass() %></td>
                        <td style="color:green !important; font-weight: 600 !important;">Rs. <%= flight.getPrice() %></td>
                        <td><%= flight.getFlightType() %></td>
                        <td>
                            <!-- Book flight button -->
                            <a style="background-color:#294067 !important;" href="bookingForm.jsp?flightId=<%= flight.getFlightId() %>&date=<%= selectedDate %>" class="btn btn-primary btn-sm">
                                Book Seat
                            </a>
                        </td>
                    </tr>
                    
                    <% 
                            }
                        } else {
                    %>
                    <!-- If no flights found, show this message -->
                    <tr>
                        <td colspan="10" class="text-center">No flights found for the selected route.</td>
                    </tr>
                    <% 
                        }
                    %>
                    <!-- End of flight results -->
                    <tr>
                        <td colspan="10" class="text-center">Looks like you have reached the end.</td>
                    </tr>
                    
                </tbody>
            </table>
        </div>

    </div>

    <!-- Footer section with about us, quick links, and contact info -->
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

                <!-- Quick Links -->
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

    <!-- Bootstrap JS for interactive components -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
