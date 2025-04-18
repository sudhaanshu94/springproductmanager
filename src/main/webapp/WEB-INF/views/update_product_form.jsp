<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
	<%@include file="./base.jsp" %>
    <title>Add Product</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>

<div class="container mt-5">
    <div class="row">
        <div class="col-md-6 offset-md-3">
            <h1 class="text-center mb-4"><u>Update product detail</u></h1>

            <form action="${pageContext.request.contextPath}/home/handle-update-request" method="post">
					<input type="hidden" value="${product.id}" name="Id" />
					<!-- Product Name -->
                <div class="mb-3">
                    <label for="name" class="form-label">Product Name</label>
                    <input type="text" class="form-control" id="name" name="name" value="${product.name}" required>
                </div>

                <!-- Product Description -->
                <div class="mb-3">
                    <label for="description" class="form-label">Product Description</label>
                    <textarea class="form-control" id="description" name="description" rows="5">${product.description}</textarea>
                </div>

                <!-- Product Price -->
                <div class="mb-3">
                    <label for="price" class="form-label">Product Price</label>
                    <input type="text" class="form-control" id="price" name="price" value="${product.price}" required>
                </div>

                <!-- Buttons -->
                <div class="text-center">
                    <a href="${pageContext.request.contextPath}/home/" class="btn btn-outline-danger me-2">Back</a>
                    <button type="submit" class="btn btn-primary">Update</button>
                </div>
            </form>
        </div>
    </div>
</div>

</body>
</html>
