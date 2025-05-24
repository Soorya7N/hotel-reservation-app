package com.maharajas.hotel.service;

import java.util.List;

import com.maharajas.hotel.model.BookingDetails;

public interface BookingService {

    public void createBooking(BookingDetails bookingDetails);
    
    public BookingDetails getBookingDetails(String bookingId);

    void updateBooking(BookingDetails bookingDetails, String bookingId);

    public List<BookingDetails> getAllBookingDetails();


}
