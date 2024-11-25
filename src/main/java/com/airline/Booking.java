package com.airline;

import java.sql.Timestamp;

public class Booking {
    
    // Instance variables representing a booking's details
    private int bookingId;             // Unique ID for the booking
    private int flightId;              // Unique ID for the flight associated with this booking
    private String passengerName;      // Name of the passenger
    private String passengerEmail;     // Email of the passenger
    private int seatsBooked;           // Number of seats booked by the passenger
    private String bookingDate;        // The date the booking was made
    private String departure;          // Departure location (New field added)
    private String destination;        // Destination location
    private int price;                 // Price for a single seat

    // Constructor to initialize all the fields of the booking object
    public Booking(int bookingId, int flightId, String passengerName, String passengerEmail, 
                   int seatsBooked, String bookingDate, String departure, 
                   String destination, int price) {
        this.bookingId = bookingId;           // Initialize the booking ID
        this.flightId = flightId;             // Initialize the flight ID
        this.passengerName = passengerName;   // Initialize the passenger's name
        this.passengerEmail = passengerEmail; // Initialize the passenger's email
        this.seatsBooked = seatsBooked;       // Initialize the number of seats booked
        this.bookingDate = bookingDate;       // Initialize the booking date
        this.departure = departure;           // Initialize the departure location
        this.destination = destination;       // Initialize the destination location
        this.price = price;                   // Initialize the price per seat
    }

    // Getters and Setters for all the fields to allow access and modification

    // Getter for booking ID
    public int getBookingId() { 
        return bookingId; 
    }

    // Getter for flight ID
    public int getFlightId() { 
        return flightId; 
    }

    // Getter for passenger name
    public String getPassengerName() { 
        return passengerName; 
    }

    // Getter for passenger email
    public String getPassengerEmail() { 
        return passengerEmail; 
    }

    // Getter for the number of seats booked
    public int getSeatsBooked() { 
        return seatsBooked; 
    }

    // Getter for booking date
    public String getBookingDate() { 
        return bookingDate; 
    }

    // Getter for departure location (New field)
    public String getDeparture() { 
        return departure; 
    }

    // Getter for destination location
    public String getDestination() { 
        return destination; 
    }

    // Getter for price per seat
    public int getPrice() { 
        return price; 
    }

    // Setter for departure location (New field)
    public void setDeparture(String departure) { 
        this.departure = departure; 
    }

    // Setter for destination location
    public void setDestination(String destination) { 
        this.destination = destination; 
    }
}
