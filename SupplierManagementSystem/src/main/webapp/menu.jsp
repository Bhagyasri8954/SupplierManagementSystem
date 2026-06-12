<%@ page import="java.sql.*, com.supplier.util.DBUtil" %>
<%
    // Fetch count of updated suppliers
    int updatedCount = 0;
    try {
        Connection conn = DBUtil.getConnection();
        PreparedStatement ps = conn.prepareStatement("SELECT COUNT(*) FROM Supplier WHERE updated = 1");
        ResultSet rs = ps.executeQuery();
        if (rs.next()) {
            updatedCount = rs.getInt(1);
        }
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark">
    <div class="container-fluid">
        <!-- Left Side Links -->
        <a class="navbar-brand" href="home.jsp">Supplier Management</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav me-auto">
                <li class="nav-item">
                    <a class="nav-link" href="home.jsp"><i class="fas fa-home"></i> Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="addSupplier.jsp"><i class="fas fa-user-plus"></i> Add Supplier</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="viewSupplier.jsp"><i class="fas fa-list"></i> View Suppliers</a>
                </li>
            </ul>

            <!-- Right Side: Update Count & Logout -->
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link text-warning" href="viewSupplier.jsp">
                        <i class="fas fa-edit"></i> Updates
                        <span class="badge bg-danger"><%= updatedCount %></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link btn btn-outline-danger border-light text-light ms-2" href="LogoutServlet">
                        <i class="fas fa-sign-out-alt"></i> Logout
                    </a>
                </li>
            </ul>
        </div>
    </div>
</nav>
