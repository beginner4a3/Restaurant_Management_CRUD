<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Restaurant Management System</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/food-home-restaurant-background_636537-320560.jpg'); /* Background image URL */
            background-size: cover; 
            background-repeat: no-repeat;
            background-attachment: fixed; 
            height: 100vh; 
        }

        .container {
            background: rgba(255, 255, 255, 0.8); 
            border-radius: 15px; 
            padding: 30px; 
            box-shadow: 0px 0px 15px rgba(0, 0, 0, 0.2); 
            margin-top: 100px;
        }

        h2 {
            font-family: 'Arial', sans-serif;
            font-weight: bold;
            color: #333; 
        }

        .btn {
            margin: 15px; 
            border-radius: 25px; 
            font-size: 16px; 
        }
    </style>
</head>
<body>
    <div class="container text-center">
        <h2 class="mt-5">Welcome to Restaurant Management System</h2>
        <div class="mt-4">
            <a href="list" class="btn btn-primary">View Menu Items</a>
            <a href="new" class="btn btn-success">Add New Item</a>
            <a href="searchItems.jsp" class="btn btn-info">Search Items</a>
        </div>
    </div>
</body>
</html>
