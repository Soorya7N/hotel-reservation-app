package com.maharajas.hotel.model;

import java.util.Map;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

import com.fasterxml.jackson.annotation.JsonIgnoreProperties;

@Document(collection = "room")
@JsonIgnoreProperties(ignoreUnknown = true)
public class Room {

	@Id
	private String id;
	private String name;
	private String type;
	private Double rent;
	private Map<String, Boolean> amenities;
	private Integer maxPersonsAllowed;
	private String status;
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public Double getRent() {
		return rent;
	}
	public void setRent(Double rent) {
		this.rent = rent;
	}
	public Map<String, Boolean> getAmenities() {
		return amenities;
	}
	public void setAmenities(Map<String, Boolean> amenities) {
		this.amenities = amenities;
	}
	public Integer getMaxPersonsAllowed() {
		return maxPersonsAllowed;
	}
	public void setMaxPersonsAllowed(Integer maxPersonsAllowed) {
		this.maxPersonsAllowed = maxPersonsAllowed;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	@Override
	public String toString() {
		return "Room [Id=" + id + ", name=" + name + ", type=" + type + ", rent=" + rent + ", amenities=" + amenities
				+ ", maxPersonsAllowed=" + maxPersonsAllowed + ", status=" + status + "]";
	}
	
	
}
