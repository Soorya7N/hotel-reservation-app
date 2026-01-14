package com.maharajas.hotel.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import com.maharajas.hotel.model.Room;
import com.maharajas.hotel.service.RoomService;

@RestController
@RequestMapping("api/v1")
public class RoomsController {

	@Autowired
	private RoomService roomService;
	
	@GetMapping("/rooms")
	public List<Room> getRoomDetails() {
		return roomService.getAllRoomDetails();
	}
	
	@PostMapping("/rooms/new")
	public String addNewRoom(@RequestBody final Room roomData) {
		return roomService.addNewRoom(roomData);
	}
}
