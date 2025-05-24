package com.maharajas.hotel.controller;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.maharajas.hotel.model.BookingDetails;
import com.maharajas.hotel.model.Room;
import com.maharajas.hotel.service.BookingService;
import com.maharajas.hotel.service.RoomService;

@Controller
@RequestMapping
public class BookingFormController {

	 	@InitBinder
	    public void initBinder(WebDataBinder binder) {
	        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
	        dateFormat.setLenient(false);
	        binder.registerCustomEditor(Date.class, new org.springframework.beans.propertyeditors.CustomDateEditor(dateFormat, true));
	    }
		@Autowired
		private BookingService bookingService;
		
		@Autowired
		private RoomService roomService;
		@GetMapping("/home")
		public String homePage(Model model) {
			List<Room> rooms = roomService.getAllRoomDetails();
			model.addAttribute("rooms", rooms);
			return "homePage";
		}
		@GetMapping("/new")
	    public String showBookingForm(@RequestParam(name="roomId",required = false) String roomId, Model model) {
	        model.addAttribute("bookingDetails", new BookingDetails());
	        model.addAttribute("roomId", roomId);
	        return "booking-form";
	    }
		@GetMapping("/getAllBookings")
	    public String getAllBookingsForm(Model model) {
			List<BookingDetails> bookings = bookingService.getAllBookingDetails();
			model.addAttribute("bookings", bookings);
	        return "bookingsDataForm";
	    }
		@GetMapping("/bookings/{bookingId}")
	    public String getBookingsForm(@PathVariable ("bookingId") String bookingId, Model model) {
			BookingDetails bookings = bookingService.getBookingDetails(bookingId);
			model.addAttribute("bookings", bookings);
	        return "singlebookingDataForm";
	    }
		@PostMapping("/create")
		public String createBookingForm(@ModelAttribute BookingDetails bookingDetails, Model model){
			bookingService.createBooking(bookingDetails);  //  calls your service
	        model.addAttribute("message", "Booking Successful!");
	        return "booking-success"; 
		}

		@PutMapping("/checkout/{bookingId}")
		public String updateBooking(@ModelAttribute BookingDetails bookingDetails, @PathVariable("bookingId") String bookingId, Model model){
			bookingService.updateBooking(bookingDetails, bookingId);  //  calls your service
			model.addAttribute("message", "Booking Details Updated!");
			return "booking-success";
		}
}
