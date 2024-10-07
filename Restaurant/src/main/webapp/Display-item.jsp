<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>Menu Item Details</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('https://img.freepik.com/premium-photo/man-prepares-food-restaurant-with-large-pan-food_457222-5996.jpg'); /* Use your own image URL */
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #fff;
            margin: 0;
            padding: 0;
        }

        .container {
            background: rgba(0, 0, 0, 0.7);
            padding: 20px;
            margin-top: 50px;
            border-radius: 10px;
            max-width: 600px;
            margin-left: auto;
            margin-right: auto;
        }

        h2 {
            text-align: center;
            color: #f8f9fa;
            margin-bottom: 30px;
        }

        p {
            font-size: 18px;
            margin: 10px 0;
        }

        .btn-back {
            background-color: #007bff;
            color: #ffffff;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 5px;
            transition: background 0.3s ease;
            display: inline-block;
            margin-top: 20px;
        }

        .btn-back:hover {
            background-color: #0056b3;
        }

        .alert {
            background-color: #dc3545;
            color: #ffffff;
            padding: 10px;
            border-radius: 5px;
            text-align: center;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Menu Item Details</h2>

        <c:if test="${not empty menuItem}">
            <p><strong>ID:</strong> ${menuItem.id}</p>
            <p><strong>Name:</strong> ${menuItem.name}</p>
            <p><strong>Price:</strong> ₹${menuItem.price}</p>
            <p><strong>Category:</strong> ${menuItem.category}</p>
            <p><strong>Description:</strong> ${menuItem.description}</p>
            <p><strong>Quantity Type:</strong> ${menuItem.quantityType}</p>
        </c:if>

        <c:if test="${empty menuItem}">
            <div class="alert">No item found with the specified ID.</div>
        </c:if>

        <a href="list" class="btn-back">Back to Menu Items</a>
    </div>
</body>
</html>
