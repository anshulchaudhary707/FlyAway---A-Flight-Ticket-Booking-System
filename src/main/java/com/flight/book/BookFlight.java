package com.flight.book;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "bookflight")
public class BookFlight {
	
	@Id
	@GeneratedValue
	private int ticket_id;
	private String source;
	private String destination;
	private String name;
	private String email;
	private String phone_no;
	private int numberOfTickets;
	private int totalPrice;
	private LocalDateTime dateTime;
	private int flight_id;
	private String passport;
	private String airline_name;
	
	public BookFlight() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public BookFlight(String source, String destination, String name, String email, String phone_no,
			int numberOfTickets, int totalPrice, LocalDateTime dateTime, int flight_id, String passport,
			String airline_name) {
		super();
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
		this.airline_name = airline_name;
	}
	
	public int getTicket_id() {
		return ticket_id;
	}
	public void setTicket_id(int ticket_id) {
		this.ticket_id = ticket_id;
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
	public int getNumberOfTickets() {
		return numberOfTickets;
	}
	public void setNumberOfTickets(int numberOfTickets) {
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
	public String getAirline_name() {
		return airline_name;
	}
	public void setAirline_name(String airline_name) {
		this.airline_name = airline_name;
	}

	@Override
	public String toString() {
		return "BookFlight [ticket_id=" + ticket_id + ", source=" + source + ", destination=" + destination + ", name="
				+ name + ", email=" + email + ", phone_no=" + phone_no + ", numberOfTickets=" + numberOfTickets
				+ ", totalPrice=" + totalPrice + ", dateTime=" + dateTime + ", flight_id=" + flight_id + ", passport="
				+ passport + ", airline_name=" + airline_name + "]";
	}
	
}
