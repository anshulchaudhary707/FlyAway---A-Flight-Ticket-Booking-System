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


@WebServlet("/AdminLogInServlet")
public class AdminLogInServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest req, HttpServletResponse res)  throws ServletException, IOException{
		String admin_name = req.getParameter("email");
		String admin_password = req.getParameter("password");
		
		if(admin_name.equals("root") && admin_password.equals("root")) {
			HttpSession session = req.getSession();
			session.setAttribute("admin_name", admin_name);
			session.setAttribute("admin_password", admin_password);
			RequestDispatcher rd = req.getRequestDispatcher("index_admin.jsp");
			rd.include(req, res);
		}
		else {
			PrintWriter out = res.getWriter();
			res.setContentType("text/html");
			out.println("Invalid Credentials");
			RequestDispatcher rd = req.getRequestDispatcher("index.jsp");
			rd.include(req, res);
		}
	}
}