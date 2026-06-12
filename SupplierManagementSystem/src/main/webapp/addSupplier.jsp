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
    <title>Add Supplier</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

    <style>
        /* Background Styling */
        body {
            background-color: #004080; /* Single solid blue color */
            color: white;
        }

        .container {
            background: rgba(255, 255, 255, 0.1);
            padding: 20px;
            border-radius: 10px;
        }

        .form-container {
            background: white; /* Light background for better visibility */
            padding: 20px;
            border-radius: 10px;
            color: black; /* Ensure text is visible */
        }

        /* Button Hover Effects */
        .btn-success:hover { background-color: #218838; color: white; }
    </style>
</head>
<body>
    <!-- Include Navigation Menu -->
    <jsp:include page="menu.jsp"/>

    <div class="container mt-5">
        <h2 class="text-center">Add New Supplier</h2>
        <div class="col-md-6 mx-auto form-container shadow">
            <form action="AddSupplierServlet" method="post">
                <div class="mb-3">
                    <label class="form-label">Supplier Name</label>
                    <input type="text" name="name" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Contact Person</label>
                    <input type="text" name="contact" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Email</label>
                    <input type="email" name="email" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Phone Number</label>
                    <input type="text" name="phone" class="form-control" required>
                </div>
                <div class="mb-3">
                    <label class="form-label">Address</label>
                    <textarea name="address" class="form-control" rows="3" required></textarea>
                </div>
                <div class="text-center">
                    <button type="submit" class="btn btn-success">
                        <i class="fas fa-plus-circle"></i> Add Supplier
                    </button>
                </div>
            </form>
        </div>
    </div>
</body>
</html>
