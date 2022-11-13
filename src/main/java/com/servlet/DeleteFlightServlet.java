package com.servlet;

import java.io.IOException;

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

@WebServlet("/DeleteFlightServlet")
public class DeleteFlightServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException{
		try {
			int flightId = Integer.parseInt(req.getParameter("flight_id").trim());
			
			SessionFactory sf = new Configuration().configure("hibernate.cfg.xml").buildSessionFactory();
			Session s = sf.openSession();
			Transaction tx = s.beginTransaction();
			ViewFlight vf = (ViewFlight)s.get(ViewFlight.class, flightId);
			s.delete(vf);
			tx.commit();
			s.close();
			res.sendRedirect("view_all_takedOff_flight.jsp");
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
}