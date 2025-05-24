package com.maharajas.hotel.service.impl;

import java.text.SimpleDateFormat;
import java.util.Collections;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import com.maharajas.hotel.model.BookingDetails;
import com.maharajas.hotel.model.Room;
import com.maharajas.hotel.repository.BookingRepository;
import com.maharajas.hotel.repository.RoomRepository;
import com.maharajas.hotel.service.BookingService;
import com.maharajas.hotel.service.utils.BookingServiceUtils;

@Service
public class BookingDetailsImpl implements BookingService {
    @Autowired
    BookingRepository bookingRepository;
    
    @Autowired
    RoomRepository roomRepository;
    @Autowired
    private SequenceGeneratorService sequenceGeneratorService;
    
    @Override
    public void createBooking(BookingDetails bookingDetails) {
        long bookRefId = sequenceGeneratorService.generateSequence("booking_sequence");
        bookingDetails.setBookingRefId("HOTEL-2025-" + bookRefId);
        bookingDetails.setNoOfDaysStay(bookingDetails.getNoOfDaysStay());
        bookingDetails.setBillAmt(bookingDetails.getBillAmt());
        bookingDetails.setOccupied(true);

        Optional<Room> optionalRoom = roomRepository.findById(bookingDetails.getRoomNum());
        if(optionalRoom.isPresent()) {
        	Room room = optionalRoom.get();
        	room.setStatus("Occupied");
        	roomRepository.save(room);
        }
        bookingRepository.save(bookingDetails);
    }
    
    @Override
    public BookingDetails getBookingDetails(String bookingId) {
        Optional<BookingDetails> bookingData = bookingRepository.findById(bookingId);
        if (bookingData.isPresent()) {
        	BookingDetails booking = bookingData.get();
        	SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
        	if (booking.isOccupied()) {
        		booking.setCheckOutDate(new Date());
        		BookingServiceUtils.calculateBill(booking.getCheckInDate(), booking.getCheckOutDate(), booking.getRoomFare(), booking);
        		
        	} else {
        		BookingServiceUtils.calculateBill(booking.getCheckInDate(), booking.getCheckOutDate(), booking.getRoomFare(), booking);
        	}
        	booking.setBalance(booking.getBalance() != null ? booking.getBalance() 
        			: booking.getBillAmt() - (booking.getAdvance() != null ? booking.getAdvance() : booking.getCheckOutPay() !=null ? booking.getCheckOutPay() : 0.0));
        	return formatBookingDetails(dateFormat, bookingData.get());
        }return null;
    }

	/*
	 * @Override public void updateBooking(BookingDetails bookingDetails, String
	 * bookingId) { bookingRepository.save(bookingDetails) }
	 */
    
    @Override
    public List<BookingDetails> getAllBookingDetails() {
        List<BookingDetails> bookingData = bookingRepository.findAll();
        if (!CollectionUtils.isEmpty(bookingData)) {
        	SimpleDateFormat dateFormat = new SimpleDateFormat("dd MMM yyyy, hh:mm a");
        	bookingData.forEach(booking -> {
        		BookingServiceUtils.calculateBill(booking.getCheckInDate(), booking.getCheckOutDate(), booking.getRoomFare(), booking);
        		booking.setBalance(booking.getBalance() != null ? booking.getBalance() 
            			: booking.getBillAmt() - (booking.getAdvance() != null ? booking.getAdvance() : booking.getCheckOutPay() !=null ? booking.getCheckOutPay() : 0.0));
        		formatBookingDetails(dateFormat, booking);
        	});
        	return bookingData;
        }return  Collections.emptyList();
    }

	private BookingDetails formatBookingDetails(SimpleDateFormat dateFormat, BookingDetails booking) {
		String checkInDateFormatted = dateFormat.format(booking.getCheckInDate());
		String checkOutDateFormatted = dateFormat.format(booking.getCheckOutDate() != null ? booking.getCheckOutDate() : new Date());
		booking.setCheckInDateFormatted(checkInDateFormatted);
		booking.setCheckOutDateFormatted(checkOutDateFormatted);
		booking.setRoomRent(BookingServiceUtils.formatCurrency(booking.getRoomFare()));
		booking.setBillAmount(BookingServiceUtils.formatCurrency(booking.getBillAmt()));
		booking.setRemainingBalance(BookingServiceUtils.formatCurrency(booking.getBalance()));
		return booking;
	}

	@Override
	public void updateBooking(BookingDetails bookingDetails, String bookingId) {
		// TODO Auto-generated method stub
		Optional<BookingDetails> optionalBooking = bookingRepository.findById(bookingId);
        if(optionalBooking.isPresent()) {
            BookingDetails existingBooking = optionalBooking.get();
            existingBooking.setCheckOutDate(bookingDetails.getCheckOutDate());
            existingBooking.setOccupied(false);
            existingBooking.setNoOfDaysStay(bookingDetails.getNoOfDaysStay());
            existingBooking.setBillAmt(bookingDetails.getBillAmt());
            existingBooking.setCheckOutPay(existingBooking.getBalance() != null ? existingBooking.getBalance() 
        			: existingBooking.getBillAmt() - (existingBooking.getAdvance() != null ? existingBooking.getAdvance() : 0.0));
            existingBooking.setBalance(0.0);
            Optional<Room> optionalRoom = roomRepository.findById(existingBooking.getRoomNum());
            if(optionalRoom.isPresent()) {
            	Room room = optionalRoom.get();
            	room.setStatus("Vacant");
            	room.setLastCheckOutDate(existingBooking.getCheckOutDate());
            	roomRepository.save(room);
            }
            bookingRepository.save(existingBooking);
        }
		
	}

	 

}
