package com.maharajas.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import com.maharajas.hotel.model.BookingDetails;
import com.maharajas.hotel.service.BookingService;

import jakarta.websocket.server.PathParam;

@RestController
@RequestMapping("/api/v1/bookings")
public class BookingController {

	@Autowired
	private BookingService bookingService;

	@PostMapping("/createBooking")
	public String createBooking(@RequestBody BookingDetails bookingDetails){

		bookingService.createBooking(bookingDetails);
		return "Booking Successful!";
	}
	@GetMapping("/getBooking/{bookingId}")
	public BookingDetails getBooking(@PathParam("bookingId") String bookingId){

		BookingDetails bookingDetails = bookingService.getBookingDetails(bookingId);
		return bookingDetails;
	}
	@GetMapping("/getAllBookings")
	public List<BookingDetails> getAllBookings(){

		List<BookingDetails> bookingDetails = bookingService.getAllBookingDetails();
		return bookingDetails;
	}

	@PutMapping("/checkout/{bookingId}")
	public ResponseEntity<String> updateBooking(@RequestBody BookingDetails bookingDetails, @PathVariable("bookingId") String bookingId) {
		bookingService.updateBooking(bookingDetails, bookingId);
		return ResponseEntity.ok("Booking update SuccessFull!");
	}
	

}
