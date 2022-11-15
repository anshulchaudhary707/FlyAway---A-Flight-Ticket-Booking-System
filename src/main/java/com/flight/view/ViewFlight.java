package com.flight.view;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;

@Entity
public class ViewFlight {

	@Id
	@GeneratedValue
	private int id;
	private String source;
	private String destination;
	private LocalDateTime dateTime;
	private String airline;
	private int price;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getSource() {
		return source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getDestination() {
		return destination;
	}

	public void setDestination(String destination) {
		this.destination = destination;
	}

	public LocalDateTime getDateTime() {
		return dateTime;
	}

	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}

	public String getAirline() {
		return airline;
	}

	public void setAirline(String airline) {
		this.airline = airline;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public ViewFlight(String source, String destination, LocalDateTime dateTime, String airline, int price) {
		super();
		this.source = source;
		this.destination = destination;
		this.dateTime = dateTime;
		this.airline = airline;
		this.price = price;
	}

	public ViewFlight() {
		super();
		// TODO Auto-generated constructor stub
	}

}