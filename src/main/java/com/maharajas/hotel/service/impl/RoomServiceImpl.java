package com.maharajas.hotel.service.impl;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.maharajas.hotel.model.Room;
import com.maharajas.hotel.repository.RoomRepository;
import com.maharajas.hotel.service.RoomService;

@Service
public class RoomServiceImpl implements RoomService {

	@Autowired
	private RoomRepository roomRepository;
	
	@Override
	public List<Room> getAllRoomDetails() {
		return roomRepository.findAll();
	}

	@Override
	public String addNewRoom(Room roomData) {
		try {
			roomRepository.save(roomData);
		} catch (Exception e) {
			return "New Room insertion Failed";
		}
		return "Room Data added Successfully";
		
	}



}
