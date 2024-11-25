package com.airline;

import java.io.*;

public class Flight {
    // Instance variables to store flight details
    private int flightId;         // Unique identifier for the flight
    private String departure;     // Departure city or airport
    private String destination;   // Destination city or airport
    private int availableSeats;   // Number of available seats for booking
    private String flightTime;    // Flight time in a string format
    private String flightClass;   // Class of the flight (e.g., Economy, Business, First)
    private int price;            // Price of the flight ticket
    private String flightType;    // Type of the flight (e.g., International, Domestic)

    // Constructor to initialize a Flight object with the provided values
    public Flight(int flightId, String departure, String destination, int availableSeats, String flightTime, String flightClass, int price, String flightType) {
        this.flightId = flightId;          // Initialize flightId
        this.departure = departure;       // Initialize departure city/airport
        this.destination = destination;   // Initialize destination city/airport
        this.availableSeats = availableSeats;  // Initialize available seats for booking
        this.flightTime = flightTime;     // Initialize flight time
        this.flightClass = flightClass;   // Initialize the class of the flight
        this.price = price;               // Initialize the price of the ticket
        this.flightType = flightType;     // Initialize the flight type (International/Domestic)
    }

    // Getter method for flightId (Returns the flight ID)
    public int getFlightId() {
        return flightId;
    }

    // Getter method for departure (Returns the departure city/airport)
    public String getDeparture() {
        return departure;
    }

    // Getter method for destination (Returns the destination city/airport)
    public String getDestination() {
        return destination;
    }

    // Getter method for availableSeats (Returns the number of available seats)
    public int getAvailableSeats() {
        return availableSeats;
    }

    // Getter method for flightTime (Returns the flight time)
    public String getFlightTime() {
        return flightTime;
    }

    // Getter method for flightClass (Returns the flight class)
    public String getFlightClass() {
        return flightClass;
    }

    // Getter method for price (Returns the price of the flight ticket)
    public int getPrice() {
        return price;
    }

    // Getter method for flightType (Returns the flight type - Domestic or International)
    public String getFlightType() {
        return flightType;
    }

    // Setter method for flightId (Sets the flight ID)
    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    // Setter method for departure (Sets the departure city/airport)
    public void setDeparture(String departure) {
        this.departure = departure;
    }

    // Setter method for destination (Sets the destination city/airport)
    public void setDestination(String destination) {
        this.destination = destination;
    }

    // Setter method for availableSeats (Sets the number of available seats)
    public void setAvailableSeats(int availableSeats) {
        this.availableSeats = availableSeats;
    }

    // Setter method for flightTime (Sets the flight time)
    public void setFlightTime(String flightTime) {
        this.flightTime = flightTime;
    }

    // Setter method for flightClass (Sets the class of the flight)
    public void setFlightClass(String flightClass) {
        this.flightClass = flightClass;
    }

    // Setter method for price (Sets the price of the flight ticket)
    public void setPrice(int price) {
        this.price = price;
    }

    // Setter method for flightType (Sets the flight type - Domestic or International)
    public void setFlightType(String flightType) {
        this.flightType = flightType;
    }
}
