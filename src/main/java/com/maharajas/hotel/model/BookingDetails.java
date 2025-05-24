package com.maharajas.hotel.model;

import java.util.Date;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.format.annotation.DateTimeFormat;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Document(collection = "bookings")
@JsonIgnoreProperties(ignoreUnknown = true)
public class BookingDetails {

	@Id
	private String bookingRefId;
	private String guestName;
	private String guestAge;
	private String address1;
	private String address2;
	private String city;
	private String state;
	private String country;
	private String pincode;
	private Integer noOfGuests;
	private String roomNum;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date checkInDate;
	private String checkInDateFormatted;
	@DateTimeFormat(pattern = "yyyy-MM-dd'T'HH:mm")
	private Date checkOutDate;
	private String checkOutDateFormatted;
	private Double roomFare;
	private String roomRent;
	private Double billAmt;
	private String billAmount;
	private Integer noOfDaysStay;
	private Double advance;
	private String advancePaid;
	private Double outStandingAmt;
	private String outStandingAmtPaid;
	private Double balance;
	private String remainingBalance;
	private boolean occupied;

	public String getBookingRefId() {
		return bookingRefId;
	}

	public void setBookingRefId(String bookingRefId) {
		this.bookingRefId = bookingRefId;
	}

	public String getGuestName() {
		return guestName;
	}

	public void setGuestName(String guestName) {
		this.guestName = guestName;
	}

	public String getGuestAge() {
		return guestAge;
	}

	public void setGuestAge(String guestAge) {
		this.guestAge = guestAge;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getCity() {
		return city;
	}

	public void setCity(String city) {
		this.city = city;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}

	public String getPincode() {
		return pincode;
	}

	public void setPincode(String pincode) {
		this.pincode = pincode;
	}

	public Integer getNoOfGuests() {
		return noOfGuests;
	}

	public void setNoOfGuests(Integer noOfGuests) {
		this.noOfGuests = noOfGuests;
	}

	public String getRoomNum() {
		return roomNum;
	}

	public void setRoomNum(String roomNum) {
		this.roomNum = roomNum;
	}

	public Date getCheckInDate() {
		return checkInDate;
	}

	public void setCheckInDate(Date checkInDate) {
		this.checkInDate = checkInDate;
	}

	public Date getCheckOutDate() {
		return checkOutDate;
	}

	public void setCheckOutDate(Date checkoutDate) {
		this.checkOutDate = checkoutDate;
	}

	public Double getRoomFare() {
		return roomFare;
	}

	public void setRoomFare(Double roomFare) {
		this.roomFare = roomFare;
	}

	public Double getBillAmt() {
		return billAmt;
	}

	public void setBillAmt(Double billAmt) {
		this.billAmt = billAmt;
	}

	public Integer getNoOfDaysStay() {
		return noOfDaysStay;
	}

	public void setNoOfDaysStay(Integer noOfDaysStay) {
		this.noOfDaysStay = noOfDaysStay;
	}

	public String getCheckInDateFormatted() {
		return checkInDateFormatted;
	}

	public void setCheckInDateFormatted(String checkInDateFormatted) {
		this.checkInDateFormatted = checkInDateFormatted;
	}

	public String getCheckOutDateFormatted() {
		return checkOutDateFormatted;
	}

	public void setCheckOutDateFormatted(String checkOutDateFormatted) {
		this.checkOutDateFormatted = checkOutDateFormatted;
	}

	public String getRoomRent() {
		return roomRent;
	}

	public void setRoomRent(String roomRent) {
		this.roomRent = roomRent;
	}

	public String getBillAmount() {
		return billAmount;
	}

	public void setBillAmount(String billAmount) {
		this.billAmount = billAmount;
	}

	public Double getAdvance() {
		return advance;
	}

	public void setAdvance(Double advance) {
		this.advance = advance;
	}

	public String getAdvancePaid() {
		return advancePaid;
	}

	public void setAdvancePaid(String advancePaid) {
		this.advancePaid = advancePaid;
	}

	public Double getBalance() {
		return balance;
	}

	public void setBalance(Double balance) {
		this.balance = balance;
	}

	public String getRemainingBalance() {
		return remainingBalance;
	}

	public void setRemainingBalance(String remainingBalance) {
		this.remainingBalance = remainingBalance;
	}

	public boolean isOccupied() {
		return occupied;
	}

	public void setOccupied(boolean occupied) {
		this.occupied = occupied;
	}

	public Double getOutStandingAmt() {
		return outStandingAmt;
	}

	public void setOutStandingAmt(Double outStandingAmt) {
		this.outStandingAmt = outStandingAmt;
	}

	public String getOutStandingAmtPaid() {
		return outStandingAmtPaid;
	}

	public void setOutStandingAmtPaid(String outStandingAmtPaid) {
		this.outStandingAmtPaid = outStandingAmtPaid;
	}

	@Override
	public String toString() {
		return "BookingDetails{" +
				"bookingRefId='" + bookingRefId + '\'' +
				", guestName='" + guestName + '\'' +
				", guestAge='" + guestAge + '\'' +
				", address1='" + address1 + '\'' +
				", address2='" + address2 + '\'' +
				", city='" + city + '\'' +
				", state='" + state + '\'' +
				", country='" + country + '\'' +
				", pincode='" + pincode + '\'' +
				", noOfGuests=" + noOfGuests +
				", roomNum='" + roomNum + '\'' +
				", checkInDate=" + checkInDate +
				", checkoutDate=" + checkOutDate +
				", roomFare=" + roomFare +
				", billAmt=" + billAmt +
				", noOfDaysStay=" + noOfDaysStay +
				'}';
	}
}
