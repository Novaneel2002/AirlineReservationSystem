<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Booking</title> <!-- Title of the page -->
</head>
<body>
    <!-- Heading for the cancel booking page -->
    <h2>Cancel Booking</h2>

    <!-- Form to cancel booking -->
    <form action="cancelBooking" method="post">
        <!-- Label and input field for entering Booking ID -->
        <label for="bookingId">Booking ID:</label>
        <input type="number" id="bookingId" name="bookingId" required> <!-- User must enter the Booking ID -->
        
        <!-- Line break for better layout -->
        <br><br>

        <!-- Submit button to cancel the booking -->
        <button type="submit">Cancel Booking</button>
    </form>
</body>
</html>
