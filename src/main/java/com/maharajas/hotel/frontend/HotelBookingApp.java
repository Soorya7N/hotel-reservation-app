package com.maharajas.hotel.frontend;

import javafx.application.Application;
import javafx.geometry.Pos;
import javafx.scene.Scene;
import javafx.scene.control.Button;
import javafx.scene.control.Label;
import javafx.scene.layout.VBox;
import javafx.stage.Stage;

public class HotelBookingApp extends Application {

    @Override
    public void start(Stage primaryStage) {
        Label titleLabel = new Label("Welcome to Hotel Maharajas");
        titleLabel.setStyle("-fx-font-size: 28px; -fx-font-weight: bold; -fx-text-fill: darkblue;");

        Button bookButton = new Button("New Booking");
        Button viewButton = new Button("View Bookings");

        bookButton.setStyle("-fx-font-size: 14px; -fx-padding: 10px 20px;");
        viewButton.setStyle("-fx-font-size: 14px; -fx-padding: 10px 20px;");

        bookButton.setOnAction(e -> new BookingForm().showBookingForm());
        viewButton.setOnAction(e -> {
            // new ViewBookings().showBookingTable(); // Implement this if needed
        });

        VBox vbox = new VBox(20, titleLabel, bookButton, viewButton);
        vbox.setAlignment(Pos.CENTER);

        Scene scene = new Scene(vbox, 500, 400);
        primaryStage.setTitle("Hotel Maharajas - Main Menu");
        primaryStage.setScene(scene);
        primaryStage.show();
    }

    public static void main(String[] args) {
        launch(args);
    }
}
