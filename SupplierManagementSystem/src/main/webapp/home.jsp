<%@ page session="true" %>
<%
    if (session.getAttribute("rollNo") == null) {
        response.sendRedirect("login.html");
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Supplier Management System</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <style>
        body {
            background: linear-gradient(to right, #4facfe, #00f2fe);
            min-height: 100vh;
            display: flex;
            flex-direction: column;
        }
        .container {
            flex: 1;
        }
        .btn-primary:hover { background-color: #0056b3; color: white; }
        .btn-success:hover { background-color: #218838; color: white; }
        .btn-warning:hover { background-color: #d39e00; color: white; }
    </style>
</head>
<body>
    <!-- Include Navigation Menu -->
    <jsp:include page="menu.jsp"/>

    <div class="container mt-4">
        <h2 class="text-center text-white">Supplier Management Dashboard</h2>

        <div class="row mt-4">
            <!-- Add Supplier -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-user-plus fa-3x text-primary"></i>
                        <h5 class="card-title mt-3">Add Supplier</h5>
                        <p class="card-text">Register a new supplier.</p>
                        <a href="addSupplier.jsp" class="btn btn-primary">Go to Add</a>
                    </div>
                </div>
            </div>

            <!-- View Supplier -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-list fa-3x text-success"></i>
                        <h5 class="card-title mt-3">View Suppliers</h5>
                        <p class="card-text">View and manage supplier records.</p>
                        <a href="viewSupplier.jsp" class="btn btn-success">Go to View</a>
                    </div>
                </div>
            </div>

            <!-- Update Supplier -->
            <div class="col-md-4">
                <div class="card text-center shadow">
                    <div class="card-body">
                        <i class="fas fa-edit fa-3x text-warning"></i>
                        <h5 class="card-title mt-3">Update Supplier</h5>
                        <p class="card-text">Modify supplier details.</p>
                        <a href="viewSupplier.jsp" class="btn btn-warning">Go to Update</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
