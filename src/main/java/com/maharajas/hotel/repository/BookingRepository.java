package com.maharajas.hotel.repository;

import com.maharajas.hotel.model.BookingDetails;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface BookingRepository extends MongoRepository<BookingDetails, String> {

}
