package com.maharajas.hotel.service;

import java.util.List;

import com.maharajas.hotel.model.Room;

public interface RoomService {

	public List<Room> getAllRoomDetails();
	public String addNewRoom(Room roomData);
}
