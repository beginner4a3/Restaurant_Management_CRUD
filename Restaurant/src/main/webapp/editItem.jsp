<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/fast-food-items_636537-206603.jpg'); 
            background-size: cover;
            background-attachment: fixed;
            background-repeat: no-repeat;
            color: #fff;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
        }

        .container {
            background: rgba(0, 0, 0, 0.7); 
            padding: 30px;
            border-radius: 10px;
            max-width: 600px;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            box-shadow: 0px 0px 15px 5px rgba(0,0,0,0.3);
        }

        h2 {
            text-align: center;
            margin-bottom: 30px;
            color: #f8f9fa;
        }

        label {
            color: #f8f9fa;
        }

        .form-group input, .form-group select, .form-group textarea {
            background: rgba(255, 255, 255, 0.9);
            color: #000;
        }

        .btn-primary, .btn-secondary {
            width: 120px;
            padding: 10px;
            margin-top: 15px;
            border-radius: 5px;
            font-weight: bold;
            transition: background 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0062cc;
        }

        .btn-secondary {
            background-color: #6c757d;
        }

        .btn-secondary:hover {
            background-color: #5a6268;
        }

        .btn-secondary, .btn-primary {
            margin-right: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2 class="text-center">Edit Menu Item</h2>
        <form action="update" method="post">
            <input type="hidden" name="id" value="${menuItem.id}">
            <div class="form-group">
                <label for="name">Item Name:</label>
                <input type="text" name="name" value="${menuItem.name}" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" name="price" value="${menuItem.price}" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <select name="category" class="form-control">
                    <c:forEach var="category" items="${categories}">
                        <option value="${category}" ${category == menuItem.category ? 'selected' : ''}>${category}</option>
                    </c:forEach>
                </select>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" class="form-control" required>${menuItem.description}</textarea>
            </div>
            <div class="form-group">
                <label for="quantityType">Quantity Type:</label>
                <select name="quantityType" class="form-control">
                    <option value="Single" ${menuItem.quantityType == 'Single' ? 'selected' : ''}>Single</option>
                    <option value="Double" ${menuItem.quantityType == 'Double' ? 'selected' : ''}>Double</option>
                    <option value="Family" ${menuItem.quantityType == 'Family' ? 'selected' : ''}>Family</option>
                </select>
            </div>
            <button type="submit" class="btn btn-primary">Update Item</button>
            <a href="list" class="btn btn-secondary">Back to List</a>
        </form>
    </div>
</body>
</html>
