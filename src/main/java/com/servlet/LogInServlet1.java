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

import com.helper.FactoryProvider;
import com.user.User;

@WebServlet("/LogInServlet1")
public class LogInServlet1 extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
		String email = req.getParameter("email");
		String password = req.getParameter("password");

		SessionFactory sf = FactoryProvider.getFactory();
		Session s = sf.openSession();

		User user = (User) s.get(User.class, email);
		System.out.println(password);

		if (user != null && password.equals(user.getPassword())) {
			HttpSession session = req.getSession();
			session.setAttribute("user", user);
			User user1 = (User) session.getAttribute("user");
			System.out.println("hii from login session: " + user1.getName());
			res.sendRedirect("book_searched_flights_user1.jsp");
		} else {
			PrintWriter out = res.getWriter();
			res.setContentType("text/html");
			out.println("Invalid Credentials");
			RequestDispatcher rd = req.getRequestDispatcher("user_login_form1.jsp");
			rd.include(req, res);
		}
	}
}
