<%@ page import="java.sql.*, com.supplier.util.DBUtil" %>
<%@ page session="true" %>
<%
    if (session.getAttribute("rollNo") == null) {
        response.sendRedirect("login.html");
        return;
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>View Suppliers</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* Sticky Full-Width Navigation */
        .navbar-container {
            position: sticky;
            top: 0;
            left: 0;
            right: 0;
            z-index: 1000;
            background-color: white;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
        }

        /* Background Styling */
        body {
            background-color: #004080; /* Solid blue */
            color: white;
            margin: 0;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }

        /* Wider Table */
        .table-container {
            background: white;
            padding: 20px;
            border-radius: 10px;
            color: black;
            width: 95%; /* Even wider */
            margin: auto; /* Centering */
        }

        .table {
            width: 100%;
        }

        th {
            background-color: #007bff !important;
            color: white !important;
            text-align: center;
        }

        td {
            text-align: center;
            vertical-align: middle;
        }

        /* Button Styling */
        .action-buttons {
            display: flex;
            gap: 10px;
            justify-content: center;
        }

        .btn-warning:hover { background-color: #d39e00; color: white; }
        .btn-danger:hover { background-color: #c82333; color: white; }
    </style>
</head>
<body>
    <!-- Sticky Full-Width Navbar -->
    <div class="navbar-container">
        <jsp:include page="menu.jsp"/>
    </div>

    <div class="container mt-5">
        <h2 class="text-center">Supplier List</h2>
        <div class="table-container shadow">
            <!-- Success message after updating supplier -->
            <%
                String updateSuccess = request.getParameter("updateSuccess");
                if ("true".equals(updateSuccess)) {
            %>
                <div class="alert alert-success text-center">Supplier updated successfully!</div>
            <%
                }
            %>

            <table class="table table-striped table-bordered mt-3">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Name</th>
                        <th>Contact Person</th>
                        <th>Email</th>
                        <th>Phone Number</th>
                        <th>Address</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <%
                        Connection conn = DBUtil.getConnection();
                        PreparedStatement ps = conn.prepareStatement("SELECT * FROM Supplier");
                        ResultSet rs = ps.executeQuery();
                        while (rs.next()) {
                    %>
                    <tr>
                        <td><%= rs.getInt("supplier_id") %></td>
                        <td><%= rs.getString("name") %></td>
                        <td><%= rs.getString("contact_person") %></td>
                        <td><%= rs.getString("email") %></td>
                        <td><%= rs.getString("phone_number") %></td>
                        <td><%= rs.getString("address") %></td>
                        <td>
                            <div class="action-buttons">
                                <a href="updateSupplier.jsp?id=<%= rs.getInt("supplier_id") %>" class="btn btn-warning btn-sm">
                                    <i class="fas fa-edit"></i> Edit
                                </a>
                                <a href="DeleteSupplierServlet?id=<%= rs.getInt("supplier_id") %>" class="btn btn-danger btn-sm" 
                                   onclick="return confirm('Are you sure you want to delete this supplier?');">
                                    <i class="fas fa-trash-alt"></i> Delete
                                </a>
                            </div>
                        </td>
                    </tr>
                    <%
                        }
                        conn.close();
                    %>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
