package com.flight.book;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;

@Entity
public class BookFlight {
	
	@Id
	@GeneratedValue(generator = "ticket_seq", strategy = GenerationType.SEQUENCE)
	@SequenceGenerator(name = "ticket_seq", sequenceName = "ticket_sequence", initialValue = 1, allocationSize = 1)
	private int id;
	private String source;
	private String destination;
	private String name;
	private String email;
	private String phone_no;
	private String numberOfTickets;
	private int totalPrice;
	private LocalDateTime dateTime;
	private int flight_id;
	private String passport;
	
	public BookFlight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	
	
	public BookFlight(int id, String source, String destination, String name, String email, String phone_no,
			String numberOfTickets, int totalPrice, LocalDateTime dateTime, int flight_id, String passport) {
		super();
		this.id = id;
		this.source = source;
		this.destination = destination;
		this.name = name;
		this.email = email;
		this.phone_no = phone_no;
		this.numberOfTickets = numberOfTickets;
		this.totalPrice = totalPrice;
		this.dateTime = dateTime;
		this.flight_id = flight_id;
		this.passport = passport;
	}



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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPhone_no() {
		return phone_no;
	}
	public void setPhone_no(String phone_no) {
		this.phone_no = phone_no;
	}
	public String getNumberOfTickets() {
		return numberOfTickets;
	}
	public void setNumberOfTickets(String numberOfTickets) {
		this.numberOfTickets = numberOfTickets;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public LocalDateTime getDateTime() {
		return dateTime;
	}
	public void setDateTime(LocalDateTime dateTime) {
		this.dateTime = dateTime;
	}
	public int getFlight_id() {
		return flight_id;
	}
	public void setFlight_id(int flight_id) {
		this.flight_id = flight_id;
	}

	public String getPassport() {
		return passport;
	}

	public void setPassport(String passport) {
		this.passport = passport;
	}
}
