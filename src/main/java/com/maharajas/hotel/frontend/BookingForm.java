package com.maharajas.hotel.frontend;

import com.maharajas.hotel.model.BookingDetails;
import javafx.geometry.Insets;
import javafx.scene.Scene;
import javafx.scene.control.*;
import javafx.scene.layout.GridPane;
import javafx.stage.Stage;
import java.net.URI;
import java.net.http.HttpClient;
import java.net.http.HttpRequest;
import java.net.http.HttpResponse;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.CompletableFuture;

public class BookingForm {

    private static final String API_URL = "http://localhost:8080/api/v1/bookings/createBooking";

    private Date parseDateString(String dateString) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            return dateFormat.parse(dateString);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    private void callBookingApi(String guestName, String guestAge, String address1, String address2, String city,
                                String state, String country, String pincode, Integer noOfGuests, String roomNum,
                                String checkInDateTime, String checkOutDateTime, String roomFare, String billAmt) {

        ObjectMapper objectMapper = new ObjectMapper();
        try {
            BookingDetails bookingDetails = new BookingDetails();
            bookingDetails.setGuestName(guestName);
            bookingDetails.setGuestAge(guestAge);
            bookingDetails.setAddress1(address1);
            bookingDetails.setAddress2(address2);
            bookingDetails.setCity(city);
            bookingDetails.setState(state);
            bookingDetails.setCountry(country);
            bookingDetails.setPincode(pincode);
            bookingDetails.setNoOfGuests(noOfGuests);
            bookingDetails.setRoomNum(roomNum);
            bookingDetails.setCheckInDate(parseDateString(checkInDateTime));
            bookingDetails.setCheckOutDate(parseDateString(checkOutDateTime));
            bookingDetails.setRoomFare(Double.parseDouble(roomFare));
            // bookingDetails.setBillAmt(Double.parseDouble(billAmt)); // Optional

            String jsonPayload = objectMapper.writeValueAsString(bookingDetails);

            HttpClient client = HttpClient.newHttpClient();
            HttpRequest request = HttpRequest.newBuilder()
                    .uri(URI.create(API_URL))
                    .header("Content-Type", "application/json")
                    .POST(HttpRequest.BodyPublishers.ofString(jsonPayload))
                    .build();

            CompletableFuture<Void> future = client.sendAsync(request, HttpResponse.BodyHandlers.ofString())
                    .thenAccept(response -> {
                        System.out.println("Response Code: " + response.statusCode());
                        System.out.println("Response Body: " + response.body());
                    });

            future.join();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void showBookingForm() {
        Stage primaryStage = new Stage();

        GridPane grid = new GridPane();
        grid.setPadding(new Insets(10, 10, 10, 10));
        grid.setVgap(8);
        grid.setHgap(10);

        TextField guestNameField = new TextField();
        guestNameField.setPromptText("Enter Guest Name");

        TextField guestAgeField = new TextField();
        guestAgeField.setPromptText("Enter Guest Age");

        TextField address1Field = new TextField();
        address1Field.setPromptText("Enter Address Line 1");

        TextField address2Field = new TextField();
        address2Field.setPromptText("Enter Address Line 2");

        TextField cityField = new TextField();
        cityField.setPromptText("Enter City");

        TextField stateField = new TextField();
        stateField.setPromptText("Enter State");

        TextField countryField = new TextField();
        countryField.setPromptText("Enter Country");

        TextField pincodeField = new TextField();
        pincodeField.setPromptText("Enter Pincode");

        ComboBox<Integer> noOfGuestsCombo = new ComboBox<>();
        noOfGuestsCombo.getItems().addAll(1, 2, 3, 4, 5, 6, 7, 8, 9, 10);
        noOfGuestsCombo.setPromptText("Select Number of Guests");

        TextField roomNumField = new TextField();
        roomNumField.setPromptText("Enter Room Number");

        DatePicker checkInDatePicker = new DatePicker();
        checkInDatePicker.setPromptText("Select Check-in Date");

        DatePicker checkOutDatePicker = new DatePicker();
        checkOutDatePicker.setPromptText("Select Check-out Date");

        TextField roomFareField = new TextField();
        roomFareField.setPromptText("Enter Room Fare");

        TextField billAmtField = new TextField();
        billAmtField.setPromptText("Enter Bill Amount");

        Button bookButton = new Button("Book Now");
        bookButton.setStyle("-fx-background-color: #4CAF50; -fx-text-fill: white;");

        grid.add(new Label("Guest Name:"), 0, 0);
        grid.add(guestNameField, 1, 0);
        grid.add(new Label("Guest Age:"), 0, 1);
        grid.add(guestAgeField, 1, 1);
        grid.add(new Label("Address Line 1:"), 0, 2);
        grid.add(address1Field, 1, 2);
        grid.add(new Label("Address Line 2:"), 0, 3);
        grid.add(address2Field, 1, 3);
        grid.add(new Label("City:"), 0, 4);
        grid.add(cityField, 1, 4);
        grid.add(new Label("State:"), 0, 5);
        grid.add(stateField, 1, 5);
        grid.add(new Label("Country:"), 0, 6);
        grid.add(countryField, 1, 6);
        grid.add(new Label("Pincode:"), 0, 7);
        grid.add(pincodeField, 1, 7);
        grid.add(new Label("No of Guests:"), 0, 8);
        grid.add(noOfGuestsCombo, 1, 8);
        grid.add(new Label("Room Number:"), 0, 9);
        grid.add(roomNumField, 1, 9);
        grid.add(new Label("Check-in Date:"), 0, 10);
        grid.add(checkInDatePicker, 1, 10);
        grid.add(new Label("Check-out Date:"), 0, 11);
        grid.add(checkOutDatePicker, 1, 11);
        grid.add(new Label("Room Fare:"), 0, 12);
        grid.add(roomFareField, 1, 12);
        grid.add(new Label("Bill Amount:"), 0, 13);
        grid.add(billAmtField, 1, 13);
        grid.add(bookButton, 1, 14);

        bookButton.setOnAction(e -> {
            String guestName = guestNameField.getText();
            String guestAge = guestAgeField.getText();
            String address1 = address1Field.getText();
            String address2 = address2Field.getText();
            String city = cityField.getText();
            String state = stateField.getText();
            String country = countryField.getText();
            String pincode = pincodeField.getText();
            Integer noOfGuests = noOfGuestsCombo.getValue();
            String roomNum = roomNumField.getText();
            String checkInDateTime = checkInDatePicker.getValue() + " 12:00:00";
            String checkOutDateTime = checkOutDatePicker.getValue() + " 12:00:00";
            String roomFare = roomFareField.getText();
            String billAmt = billAmtField.getText();

            callBookingApi(guestName, guestAge, address1, address2, city, state, country, pincode,
                    noOfGuests, roomNum, checkInDateTime, checkOutDateTime, roomFare, billAmt);
        });

        Scene scene = new Scene(grid, 600, 600);
        primaryStage.setTitle("Hotel Booking Form");
        primaryStage.setScene(scene);
        primaryStage.show();
    }
}
