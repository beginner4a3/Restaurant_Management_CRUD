<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add New Item</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://futuristforfood.com/wp-content/uploads/2024/01/AdobeStock_640075368-900.jpg'); /* Replace this URL with your desired background image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #ffffff;
        }

        .container {
            background: rgba(0, 0, 0, 0.7);
            border-radius: 10px;
            padding: 15px;
            width: 50%; 
            margin-top: 50px;
            margin-bottom: 50px;
            box-shadow: 0px 0px 10px 2px #ffffff;
        }

        .form-control {
            background-color: #f9f9f9;
            border-radius: 5px;
            height: 30px;
        }

        .form-control, .form-group label {
            font-size: 14px;
        }

        h2 {
            margin-bottom: 15px;
            font-size: 24px; 
        }

        label {
            font-weight: bold;
        }

        .btn-primary, .btn-success, .btn-secondary, .btn-info {
            border-radius: 15px;
            padding: 8px 15px;
            font-size: 14px;
        }

        .btn-primary:hover, .btn-success:hover, .btn-secondary:hover, .btn-info:hover {
            transform: scale(1.05);
        }

        .text-center.mt-4 a {
            margin: 5px;
            font-size: 14px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="text-center mt-4">
            <a href="list" class="btn btn-primary">View Menu Items</a>
            <a href="new" class="btn btn-success">Add New Item</a>
            <a href="searchItems.jsp" class="btn btn-info">Search Items</a> 
        </div>
        <h2 class="text-center">Add New Menu Item</h2>
        <form action="insert" method="post">
            <div class="form-group">
                <label for="name">Item Name:</label>
                <input type="text" name="name" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="price">Price:</label>
                <input type="number" step="0.01" name="price" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="category">Category:</label>
                <input type="text" name="category" class="form-control" required>
            </div>
            <div class="form-group">
                <label for="description">Description:</label>
                <textarea name="description" class="form-control" rows="3" required></textarea>
            </div>
            <div class="form-group">
                <label for="quantityType">Quantity Type:</label>
                <select name="quantityType" class="form-control">
                    <option value="Single">Single</option>
                    <option value="Double">Double</option>
                    <option value="Family">Family</option>
                </select>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-success">Add Item</button>
                <a href="list" class="btn btn-secondary">Back to List</a>
            </div>
        </form>
    </div>
</body>
</html>
