<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Menu Items</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            background-image: url('https://img.freepik.com/premium-photo/hungry-obese-man-looking-food-fridge-home-night-generate-ai_868783-2631.jpg'); /* Replace this URL with your desired image */
            background-size: cover;
            background-repeat: no-repeat;
            background-attachment: fixed;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }

        .container {
            background: rgba(0, 0, 0, 0.7); 
            border-radius: 15px;
            padding: 30px;
            max-width: 50%; 
            margin-top: 100px;
            box-shadow: 0px 0px 15px 5px rgba(255, 255, 255, 0.5);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
            color: #ffffff;
        }

        .form-group label {
            color: #ffffff;
            font-weight: bold;
        }

        .form-control {
            border-radius: 5px;
        }

        .btn-primary, .btn-success, .btn-info {
            border-radius: 15px;
            padding: 8px 15px;
            font-size: 14px;
        }

        .btn-primary, .btn-success, .btn-info {
            margin: 5px;
            transition: transform 0.2s, background-color 0.2s;
        }

        .btn-primary:hover, .btn-success:hover, .btn-info:hover {
            transform: scale(1.05);
            background-color: #0056b3; 
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
        <h2>Search Menu Item by ID</h2>
        <form action="searchById" method="get">
            <div class="form-group">
                <label for="id">Enter Item ID:</label>
                <input type="number" name="id" class="form-control" placeholder="Enter item ID..." required>
            </div>
            <div class="text-center">
                <button type="submit" class="btn btn-primary">Search</button>
            </div>
        </form>
    </div>
</body>
</html>
