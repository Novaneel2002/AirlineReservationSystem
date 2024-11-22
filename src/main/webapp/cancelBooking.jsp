<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cancel Booking</title>
</head>
<body>
    <h2>Cancel Booking</h2>
    <form action="cancelBooking" method="post">
        <label for="bookingId">Booking ID:</label>
        <input type="number" id="bookingId" name="bookingId" required><br><br>
        <button type="submit">Cancel Booking</button>
    </form>
</body>
</html>
