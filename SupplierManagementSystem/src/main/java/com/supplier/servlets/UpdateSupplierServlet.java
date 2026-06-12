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

@WebServlet("/UpdateSupplierServlet")
public class UpdateSupplierServlet extends HttpServlet {
    /**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
            throws ServletException, IOException {
        try {
            int id = Integer.parseInt(request.getParameter("id"));
            String name = request.getParameter("name");
            String contact = request.getParameter("contact");
            String email = request.getParameter("email");
            String phone = request.getParameter("phone");
            String address = request.getParameter("address");

            Connection conn = DBUtil.getConnection();
            PreparedStatement ps = conn.prepareStatement(
                "UPDATE Supplier SET name=?, contact_person=?, email=?, phone_number=?, address=? WHERE supplier_id=?"
            );
            ps.setString(1, name);
            ps.setString(2, contact);
            ps.setString(3, email);
            ps.setString(4, phone);
            ps.setString(5, address);
            ps.setInt(6, id);
            ps.executeUpdate();

            conn.close();

            // Redirect back to viewSupplier.jsp with success message
            response.sendRedirect("viewSupplier.jsp?updateSuccess=true");

        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
