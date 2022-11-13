package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;

import com.user.User;
import com.helper.FactoryProvider;

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException  {
		
		String fullName = req.getParameter("fullName");
		String phone_no = req.getParameter("phone_no");
		String email = req.getParameter("email");
		String password = req.getParameter("password");
		String address = req.getParameter("address");
		String smoney = req.getParameter("amount");
		float money = Float.parseFloat(smoney);
		
		User user = new User();
		
		user.setMoney(money);
		user.setAddress(address);
		user.setEmail(email);
		user.setName(fullName);
		user.setPassword(password);
		user.setPhone_no(phone_no);
		
		SessionFactory sf = FactoryProvider.getFactory();
		Session s = sf.openSession();
		Transaction tx = s.beginTransaction();
		
		s.save(user);
		tx.commit();
		s.close();
		
		res.setContentType("text/html");
		PrintWriter out = res.getWriter();
		out.println("<h2>Signed In Successfully</h2>");
		HttpSession session = req.getSession();
		session.setAttribute("user", user);
		RequestDispatcher rd = req.getRequestDispatcher("index_user.jsp");
		System.out.println("hii from signup session: "+user.getName());
		rd.include(req, res);
	}
}