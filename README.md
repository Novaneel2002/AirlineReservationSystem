Airline Reservation System - Setup Guide


>Version used:

java version "1.8.0_202"
Java(TM) SE Runtime Environment (build 1.8.0_202-b08)
Java HotSpot(TM) 64-Bit Server VM (build 25.202-b08, mixed mode)
Apache Tomcat 9


Note - Refer Chatgpt or Youtube for detailed explanation and guidance on each point.

Prerequisites:
- Eclipse IDE for Java EE Developers: https://www.eclipse.org/downloads/
- JDK 8 or higher: https://www.oracle.com/java/technologies/javase-jdk8-downloads.html
- MySQL Database: https://dev.mysql.com/downloads/installer/
- MySQL JDBC Driver: https://dev.mysql.com/downloads/connector/j/

Step-by-Step Setup:

1. Install Eclipse:
   - Download and install Eclipse IDE for Java EE Developers.

2. Create a Dynamic Web Project:
   - Open Eclipse > File > New > Dynamic Web Project.
   - Name the project (e.g., AirlineReservationSystem), select Apache Tomcat as the runtime, and finish.

3. Install MySQL:
   - Download and install MySQL.
   - Create a new database: `CREATE DATABASE AirlineDB;`.

4. Download JDBC Driver:
   - Download the MySQL JDBC Driver: https://dev.mysql.com/downloads/connector/j/.
   - Add the .jar file to the lib folder in your project.

5. Database Connection (Java):
   - Create a class (DatabaseUtil.java) to manage the DB connection.
   Example code:
   ```java
   public static Connection getConnection() throws SQLException {
       String url = "jdbc:mysql://localhost:3306/AirlineDB";
       String username = "root";  // DB username
       String password = "password";  // DB password
       return DriverManager.getConnection(url, username, password);
   }

6. Create Servlets:
   - Right-click on `src` > `New` > `Servlet` > Implement logic (e.g., booking, flight details).

7. Configure Tomcat Server:
   - Install Apache Tomcat: https://tomcat.apache.org/download-90.cgi.
   - In Eclipse: Window > Preferences > Server > Runtime Environments > Add Server > Choose Tomcat.
   - Right-click your project > Run As > Run on Server.

8. Test the Project:
   - Open your browser and visit `http://localhost:8080/YourProjectName/` to test functionality.




DATABASE DETAIL:

Airline Reservation System - Database and Tables Overview

Database: airline_reservation_db

Tables:

1. flights
   - Stores flight information.
   - Columns:
     - flightId (INT, Primary Key, Auto Increment) - Unique identifier for each flight.
     - departure (VARCHAR(100)) - Departure city.
     - destination (VARCHAR(100)) - Destination city.
     - availableSeats (INT) - Number of available seats for the flight.
     - flightTime (VARCHAR(100)) - Time of the flight.
     - flightClass (VARCHAR(50)) - Class of the flight (e.g., Economy, Business).
     - price (INT) - Price of the flight.
     - flightType (ENUM) - Type of flight (Domestic or International).

2. bookings
   - Stores information about bookings made by passengers.
   - Columns:
     - bookingId (INT, Primary Key, Auto Increment) - Unique identifier for each booking.
     - flightId (INT, Foreign Key) - Links to the `flights` table (flightId).
     - passengerName (VARCHAR(100)) - Name of the passenger.
     - passengerEmail (VARCHAR(100)) - Email of the passenger.
     - seatsBooked (INT) - Number of seats booked.
     - bookingDate (TIMESTAMP) - Timestamp of when the booking was made (default to current timestamp).
     - status (VARCHAR(10)) - Status of the booking (default 'Confirmed').
     - departure (VARCHAR(100)) - Departure city (added after table creation).
     - destination (VARCHAR(100)) - Destination city (added after table creation).


These tables help manage flight schedules and booking records for passengers in the system.

HAPPY CODING !! :-) 


