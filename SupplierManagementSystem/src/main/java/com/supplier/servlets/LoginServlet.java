package com.supplier.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String rollNo = request.getParameter("rollNo");
        String password = request.getParameter("password");

        if (rollNo.equals(password)) { // Simple authentication
            HttpSession session = request.getSession();
            session.setAttribute("rollNo", rollNo);

            // Create a cookie for session management
            Cookie userCookie = new Cookie("rollNo", rollNo);
            userCookie.setMaxAge(60 * 60); // 1 hour
            response.addCookie(userCookie);

            response.sendRedirect("home.jsp");
        } else {
            response.sendRedirect("login.html?error=Invalid credentials");
        }
    }
}
