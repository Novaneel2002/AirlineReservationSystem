package com.airline;

import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int flightId;
    private String passengerName;
    private String passengerEmail;
    private int seatsBooked;
    private Timestamp bookingDate;
    private String departure;  // New field for departure
    private String destination;
    private int price;// New field for destination

    // Constructor
    public Booking(int bookingId, int flightId, String passengerName, String passengerEmail, int seatsBooked, Timestamp bookingDate, String departure, String destination, int price) {
        this.bookingId = bookingId;
        this.flightId = flightId;
        this.passengerName = passengerName;
        this.passengerEmail = passengerEmail;
        this.seatsBooked = seatsBooked;
        this.bookingDate = bookingDate;
        this.departure = departure;  // Initialize departure
        this.destination = destination;
        this.price = price;// Initialize destination
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public int getFlightId() { return flightId; }
    public String getPassengerName() { return passengerName; }
    public String getPassengerEmail() { return passengerEmail; }
    public int getSeatsBooked() { return seatsBooked; }
    public Timestamp getBookingDate() { return bookingDate; }
    public String getDeparture() { return departure; }  // Getter for departure
    public String getDestination() { return destination; } 
    public int getPrice() { return price; }// Getter for destination

    public void setDeparture(String departure) { this.departure = departure; }  // Setter for departure
    public void setDestination(String destination) { this.destination = destination; }  // Setter for destination
}
