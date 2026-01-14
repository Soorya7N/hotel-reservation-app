package com.maharajas.hotel.repository;

import org.springframework.data.mongodb.repository.MongoRepository;

import com.maharajas.hotel.model.User;

import java.util.Optional;

public interface UserRepository extends MongoRepository<User, String> {
    Optional<User> findByUsername(String username);
}