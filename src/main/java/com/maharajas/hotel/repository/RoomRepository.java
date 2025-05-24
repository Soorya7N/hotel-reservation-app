package com.maharajas.hotel.repository;

import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import com.maharajas.hotel.model.Room;

@Repository
public interface RoomRepository extends MongoRepository<Room, String>{

}
