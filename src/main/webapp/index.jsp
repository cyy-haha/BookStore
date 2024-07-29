<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024/5/8
  Time: 下午 05:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Book CRUD</title>
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
        .crud-section {
            margin-bottom: 40px;
        }
        .crud-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .crud-section form {
            display: flex;
            flex-direction: column;
        }
        .crud-section form label {
            margin: 10px 0 5px;
            font-weight: bold;
        }
        .crud-section form input[type="text"],
        .crud-section form input[type="number"] {
            padding: 8px;
            margin-bottom: 20px;
            border: 1px solid #ddd;
            border-radius: 4px;
        }
        .crud-section form input[type="submit"] {
            padding: 10px;
            color: #fff;
            background-color: #5cb85c;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .crud-section form input[type="submit"]:hover {
            background-color: #4cae4c;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="crud-section">
        <h2>Search Book</h2>
        <form action="http://localhost:8080/book/" method="GET">
            <label for="searchBookId">Book Id:</label>
            <input type="number" id="searchBookId" name="bookId">
            <input type="submit" value="Search">
        </form>
    </div>

    <div class="crud-section">
        <h2>Add New Book</h2>
        <form action="http://localhost:8080/book/" method="POST">
            <label for="addBookId">Book Id:</label>
            <input type="number" id="addBookId" name="bookId">
            <label for="addBookName">Book Name:</label>
            <input type="text" id="addBookName" name="name">
            <label for="addPrice">Price:</label>
            <input type="number" id="addPrice" name="price">
            <label for="addAuthor">Author:</label>
            <input type="text" id="addAuthor" name="author">
            <input type="submit" value="Submit">
        </form>
    </div>

    <div class="crud-section">
        <h2>Update Book</h2>
        <form action="http://localhost:8080/book/" method="GET">
            <input type="hidden" name="_method" value="PUT">
            <label for="updateBookId">Book Id:</label>
            <input type="number" id="updateBookId" name="bookId">
            <input type="submit" value="Search">
        </form>
    </div>

    <div class="crud-section">
        <h2>Delete Book</h2>
        <form action="http://localhost:8080/book/" method="POST">
            <input type="hidden" name="_method" value="DELETE">
            <label for="deleteBookId">Book Id:</label>
            <input type="number" id="deleteBookId" name="bookId">
            <label for="deleteBookName">Book Name:</label>
            <input type="text" id="deleteBookName" name="name">
            <label for="deletePrice">Price:</label>
            <input type="number" id="deletePrice" name="price">
            <label for="deleteAuthor">Author:</label>
            <input type="text" id="deleteAuthor" name="author">
            <input type="submit" value="Submit">
        </form>
    </div>
</div>
</body>
</html>