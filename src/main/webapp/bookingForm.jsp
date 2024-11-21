<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book Flight</title>
</head>
<body>
    <h2>Flight Booking</h2>
    <form action="bookFlight" method="post">
        <label for="flightId">Flight ID:</label>
        <input type="text" id="flightId" name="flightId" required><br><br>

        <label for="passengerName">Name:</label>
        <input type="text" id="passengerName" name="passengerName" required><br><br>

        <label for="passengerEmail">Email:</label>
        <input type="email" id="passengerEmail" name="passengerEmail" required><br><br>

        <label for="seatsBooked">Seats:</label>
        <input type="number" id="seatsBooked" name="seatsBooked" min="1" required><br><br>

        <button type="submit">Book Flight</button>
    </form>
</body>
</html>
