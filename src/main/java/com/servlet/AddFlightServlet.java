package com.servlet;

import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.flight.view.ViewFlight;

@WebServlet("/AddFlightServlet")
public class AddFlightServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException{
		String source = req.getParameter("src");
		String destination = req.getParameter("dest");
		String sdate = req.getParameter("date");
		String stime = req.getParameter("time");
		String airline = req.getParameter("airline");
		int price = Integer.parseInt(req.getParameter("price"));
		
		String sDateTime = sdate + " " + stime;
		DateTimeFormatter format = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm");
		LocalDateTime dateTime = LocalDateTime.parse(sDateTime, format);
		
		System.out.println(source);
		System.out.println(destination);
		System.out.println(dateTime);
		System.out.println(airline);
		System.out.println(price);
		
		SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();

		ViewFlight v1 = new ViewFlight(source, destination, dateTime, airline, price);
		
		s.saveOrUpdate(v1);

		tx.commit();
		s.close();
		RequestDispatcher rd = req.getRequestDispatcher("flight_add_form.jsp");
		rd.include(req, res);
	}
}
