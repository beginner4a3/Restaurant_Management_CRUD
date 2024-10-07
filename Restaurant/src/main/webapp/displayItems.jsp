<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Menu Items List</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/fast-food-with-doodle-style_636537-46345.jpg'); /* Replace with your preferred image URL */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            height: 100vh;
        }

        .container {
            background: rgba(255, 255, 255, 0.9);
            border-radius: 15px;
            padding: 30px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.2);
            margin-top: 50px;
        }

        h2 {
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            color: #333;
            margin-bottom: 30px;
        }

        table {
            background: #fff; 
            border-radius: 10px;
            overflow: hidden;
        }

        th, td {
            text-align: center;
        }

        th {
            background: #007bff; 
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f2f2f2; 
        }

        .btn {
            margin: 5px;
            border-radius: 25px;
            font-size: 14px;
        }

        .btn-primary {
            background-color: #007bff; 
            border: none;
        }

        .btn-success {
            background-color: #28a745;
            border: none;
        }

        .btn-warning {
            background-color: #ffc107;
            border: none;
        }

        .btn-danger {
            background-color: #dc3545;
            border: none;
        }

        .btn-secondary {
            background-color: #6c757d;
            border: none;
        }

        .btn:hover {
            opacity: 0.9;
        }

        .text-center.mt-4 a {
            margin: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center mt-4">
            <a href="list" class="btn btn-primary">View Menu Items</a>
            <a href="new" class="btn btn-success">Add New Item</a>
            <a href="searchItems.jsp" class="btn btn-info">Search Items</a> <!-- Updated link -->
        </div>
        <h2 class="text-center mt-5">Menu Items</h2>
        <table class="table table-bordered">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Price</th>
                    <th>Category</th>
                    <th>Description</th>
                    <th>Quantity Type</th>
                    <th>Actions</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="item" items="${listItems}">
                    <tr>
                        <td>${item.id}</td>
                        <td>${item.name}</td>
                        <td>${item.price}</td>
                        <td>${item.category}</td>
                        <td>${item.description}</td>
                        <td>${item.quantityType}</td>
                        <td>
                            <a href="edit?id=${item.id}" class="btn btn-warning">Edit</a>
                            <a href="delete?id=${item.id}" class="btn btn-danger">Delete</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
        <div class="text-center">
            <a href="index.jsp" class="btn btn-secondary">Back to Home</a>
        </div>
    </div>
</body>
</html>
