<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024/6/2
  Time: 下午 04:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Book Information</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 20px;
            background-color: #f4f4f4;
        }
        .container {
            max-width: 800px;
            margin: 0 auto;
            padding: 20px;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        .form-section {
            margin-bottom: 40px;
        }
        .form-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .form-section form {
            display: flex;
            flex-direction: column;
        }
        .form-section form label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .form-section form input[type="text"],
        .form-section form input[type="number"] {
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .form-section form input[type="submit"] {
            padding: 10px;
            color: #fff;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .form-section form input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="form-section">
        <h2>Update Book Information</h2>
        <form action="http://localhost:8080/book/" method="POST">
            <input type="hidden" name="_method" value="PUT">

            <label for="bookId">Book Id:</label>
            <input type="text" id="bookId" name="bookId" value="${book.getBookId()}" readonly><br><br>

            <label for="name">Book Name:</label>
            <input type="text" id="name" name="name" value="${book.getName()}"><br><br>

            <label for="price">Price:</label>
            <input type="number" id="price" name="price" value="${book.getPrice()}"><br><br>

            <label for="author">Author:</label>
            <input type="text" id="author" name="author" value="${book.getAuthor()}"><br><br>

            <input type="submit" value="Update Book">
        </form>
    </div>
</div>
</body>
</html>
