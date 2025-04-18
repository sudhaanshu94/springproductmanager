<html>
<head>
    <%@include file="./base.jsp"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <style>
        .btn-outline-success {
            color: #28a745;
            border-color: #28a745;
        }

        .btn-outline-success:hover {
            background-color: #28a745;
            color: white;
            border-color: #28a745;
        }

        .btn-outline-success:focus {
            box-shadow: 0 0 0 0.2rem rgba(40, 167, 69, 0.5);
        }

        .table-hover tbody tr:hover {
            background-color: #f5f5g6;
            
        }

        .action-icons {
            display: flex;
            justify-content: left;  /* Align icons to the left */
            gap: 10px;            /* Add some space between the icons */
        }

        .action-icons a {
            font-size: 1.5rem;
            text-decoration: none;  /* Remove underlines from links */
            transition: transform 0.2s ease-in-out; /* Smooth transition */
        }

        .action-icons a:hover {
            opacity: 0.8;          /* Reduce opacity on hover for a subtle effect */
            transform: scale(1.2);  /* Increase size on hover */
        }

        .update-icon {
            color: #007bff;      /* Blue color for update icon */
        }

        .delete-icon {
            color: #dc3545;    /* Red color for delete icon */
        }
    </style>
</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-12">
                <h1 class="text-center mb-3"><u>PRODUCTS DASHBOARD</u></h1>
                <div class="container text-center mb-4">
                    <a href="add-product" class="btn btn-outline-success">Add Product</a>
                </div>
                <div class="table-responsive">
                    <table class="table table-hover">
                        <thead class="thead-dark">
                            <tr>
                                <th scope="col">ID</th>
                                <th scope="col">Product Name</th>
                                <th scope="col">Description</th>
                                <th scope="col">Price</th>
                                <th scope="col" class="text-left">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="product" items="${products}" varStatus="status">
                                <tr class="align-middle">
                                    <td><b>XTSER${product.id}</b></td>
                                    <td>${product.name}</td>
                                    <td>${product.description}</td>
                                    <td>&#8377; ${product.price}</td>
                                    <td class="text-left">
                                        <div class="action-icons">
                                            <a href="update-product/${product.id}" title="Update" class="update-icon">
                                                <i class="fa-solid fa-pen-to-square"></i>
                                            </a>
                                            <a href="delete-product/${product.id}" title="Delete" class="delete-icon">
                                                <i class="fa-solid fa-trash"></i>
                                            </a>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
