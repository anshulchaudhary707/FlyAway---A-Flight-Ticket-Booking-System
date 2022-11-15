package com.servlet;


import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.time.LocalDateTime;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.flight.book.BookFlight;
import com.user.User;

@WebServlet("/CancelFlightServlet")
public class CancelFlightServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException{
		try {
			HttpSession ss = req.getSession(false);
			int ticketId = Integer.parseInt(req.getParameter("tid").trim());
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			
			BookFlight bf = (BookFlight)s.get(BookFlight.class, ticketId);
			
			LocalDateTime dt = bf.getDateTime();
			
			System.out.println("dt: "+dt);
			System.out.println("bf: "+bf.getDateTime());
			
			LocalDateTime dt1 = LocalDateTime.now().plusHours(1);
			
			if(dt.isBefore(dt1)) {
				res.sendRedirect("cannot_cancel.jsp");
			}
			
			User u1 = (User)ss.getAttribute("user");
			int noOftickets = bf.getNumberOfTickets();
			
			System.out.println("Number of tickets in cancellation: "+noOftickets);
			
			float totalTicketPrice = bf.getTotalPrice();
			System.out.println("Price of tickets in cancellation: "+totalTicketPrice);
			
			float penalty = 100 * noOftickets;
			System.out.println("Penalty of tickets in cancellation: "+penalty);
			
			float money = bf.getTotalPrice()-penalty;
			
			System.out.println("Money Left in wallet after booking cancel: "+money);
			User u2 = new User(u1.getEmail(), u1.getName(), u1.getPhone_no(), u1.getPassword(), u1.getMoney()+money,u1.getAddress());
			
			ss.setAttribute("user", u2);
			
			s.delete(bf);
			s.saveOrUpdate(u2);
			
			tx.commit();
			s.close();
			res.sendRedirect("user_scheduled_flights.jsp");
		}
		catch(Exception e) {
			
		}
	}
}
