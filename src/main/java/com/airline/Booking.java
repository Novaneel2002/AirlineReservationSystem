package com.airline;

import java.sql.Timestamp;

public class Booking {
    private int bookingId;
    private int flightId;
    private String passengerName;
    private String passengerEmail;
    private int seatsBooked;
    private Timestamp bookingDate;

    public Booking(int bookingId, int flightId, String passengerName, String passengerEmail, int seatsBooked, Timestamp bookingDate) {
        this.bookingId = bookingId;
        this.flightId = flightId;
        this.passengerName = passengerName;
        this.passengerEmail = passengerEmail;
        this.seatsBooked = seatsBooked;
        this.bookingDate = bookingDate;
    }

    public int getBookingId() { return bookingId; }
    public int getFlightId() { return flightId; }
    public String getPassengerName() { return passengerName; }
    public String getPassengerEmail() { return passengerEmail; }
    public int getSeatsBooked() { return seatsBooked; }
    public Timestamp getBookingDate() { return bookingDate; }
}
