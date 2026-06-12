package com.supplier.servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.supplier.util.DBUtil;

@WebServlet("/AddSupplierServlet")
public class AddSupplierServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "INSERT INTO Supplier (name, contact_person, email, phone_number, address) VALUES (?, ?, ?, ?, ?)"
            );
            ps.setString(1, request.getParameter("name"));
            ps.setString(2, request.getParameter("contact"));
            ps.setString(3, request.getParameter("email"));
            ps.setString(4, request.getParameter("phone"));
            ps.setString(5, request.getParameter("address"));
            ps.executeUpdate();
            
            response.sendRedirect("viewSupplier.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
