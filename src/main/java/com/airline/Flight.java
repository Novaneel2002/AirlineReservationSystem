package com.airline;

import java.io.*;

public class Flight {
    private int flightId;
    private String departure;
    private String destination;
    private int availableSeats;
    private String flightTime;
    private String flightClass;
    private int price; // New price field
    private String flightType; // New flightType field

    // Constructor
    public Flight(int flightId, String departure, String destination, int availableSeats, String flightTime, String flightClass, int price, String flightType) {
        this.flightId = flightId;
        this.departure = departure;
        this.destination = destination;
        this.availableSeats = availableSeats;
        this.flightTime = flightTime;
        this.flightClass = flightClass;
        this.price = price; // Initialize price
        this.flightType = flightType; // Initialize flightType
    }

    // Getters and Setters
    public int getFlightId() { return flightId; }
    public String getDeparture() { return departure; }
    public String getDestination() { return destination; }
    public int getAvailableSeats() { return availableSeats; }
    public String getFlightTime() { return flightTime; }
    public String getFlightClass() { return flightClass; }
    public int getPrice() { return price; } // Getter for price
    public String getFlightType() { return flightType; } // Getter for flightType

    public void setFlightId(int flightId) { this.flightId = flightId; }
    public void setDeparture(String departure) { this.departure = departure; }
    public void setDestination(String destination) { this.destination = destination; }
    public void setAvailableSeats(int availableSeats) { this.availableSeats = availableSeats; }
    public void setFlightTime(String flightTime) { this.flightTime = flightTime; }
    public void setFlightClass(String flightClass) { this.flightClass = flightClass; }
    public void setPrice(int price) { this.price = price; } // Setter for price
    public void setFlightType(String flightType) { this.flightType = flightType; } // Setter for flightType
}
