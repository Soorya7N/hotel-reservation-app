package com.maharajas.hotel.service.utils;

import java.text.NumberFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.ZoneId;
import java.time.temporal.ChronoUnit;
import java.util.Date;
import java.util.Locale;
import java.util.concurrent.TimeUnit;

import com.maharajas.hotel.model.BookingDetails;

public class BookingServiceUtils {

	public static void calculateBill(Date checkInDate, Date checkOutDate, Double roomFare, BookingDetails booking) {
		 if (checkInDate == null || roomFare == null || roomFare <= 0.0) {
	            throw new IllegalArgumentException("Invalid check-in date or room fare.");
	        }

	        // Use current time if checkOut is null (ongoing stay)
	        if (checkOutDate == null || (checkOutDate != null && checkOutDate.before(new Date()) && booking.isOccupied())) {
	            checkOutDate = new Date();
	        }

	        // Convert java.util.Date to java.time.LocalDateTime
	        LocalDateTime checkIn = checkInDate.toInstant()
	                                            .atZone(ZoneId.systemDefault())
	                                            .toLocalDateTime();

	        LocalDateTime checkOut = checkOutDate.toInstant()
	                                             .atZone(ZoneId.systemDefault())
	                                             .toLocalDateTime();

	        if (!checkOut.isAfter(checkIn)) {
	            throw new IllegalArgumentException("Check-out must be after check-in.");
	        }

	        LocalDate inDate = checkIn.toLocalDate();
	        LocalDate outDate = checkOut.toLocalDate();

	        long numDays = ChronoUnit.DAYS.between(inDate, outDate);
	        if (numDays < 1) numDays = 1;

	        LocalTime checkInTime = checkIn.toLocalTime();
	        LocalDateTime cutoff;

	        if (checkInTime.isBefore(LocalTime.NOON)) {
	            cutoff = LocalDateTime.of(outDate.plusDays(1), LocalTime.NOON);
	        } else {
	            cutoff = LocalDateTime.of(outDate.plusDays(1), LocalTime.of(14, 0));
	        }

	        if (checkOut.isAfter(cutoff)) {
	            numDays++;
	        }

	        Double billAmount = roomFare * (Double.valueOf(numDays));
	        booking.setBillAmt(Math.round(billAmount * 100.0) / 100.0);
	        booking.setNoOfDaysStay(Math.toIntExact(numDays));
	        
	    }
   public static String formatCurrency(Double amount) {
       if (amount == null || amount.isNaN()) {
           return "₹0";
       }
       NumberFormat formatter = NumberFormat.getCurrencyInstance(new Locale("en", "IN"));
       return formatter.format(amount);
   }
   public static int calculateStayDays(Date checkIn, Date checkOut) {
       if (checkIn == null || checkOut == null || checkOut.before(checkIn)) {
           return 0;
       }

       long millisDiff = checkOut.getTime() - checkIn.getTime();
       long daysDiff = TimeUnit.MILLISECONDS.toDays(millisDiff);

       // Get check-in and check-out hours and minutes
       SimpleDateFormat hourFormat = new SimpleDateFormat("HH:mm");

       String checkInTimeStr = hourFormat.format(checkIn);
       String checkOutTimeStr = hourFormat.format(checkOut);

       try {
           Date baseTime = hourFormat.parse("00:00");
           long checkInTime = hourFormat.parse(checkInTimeStr).getTime() - baseTime.getTime();
           long checkOutTime = hourFormat.parse(checkOutTimeStr).getTime() - baseTime.getTime();

           // Handle time-based conditions
           long diffTime = checkOutTime - checkInTime;
           long diffHours = TimeUnit.MILLISECONDS.toHours(diffTime);
           long diffMinutes = TimeUnit.MILLISECONDS.toMinutes(diffTime) % 60;

           // Add extra day based on your time rules
           if (daysDiff == 0) {
               return 1;
           } else {
               if (diffHours > 27 || (diffHours == 27 && diffMinutes > 0)) {
                   return (int) daysDiff + 1;
               } else {
                   return (int) daysDiff;
               }
           }
       } catch (ParseException e) {
           e.printStackTrace();
           return (int) daysDiff;
       }
   }
}
