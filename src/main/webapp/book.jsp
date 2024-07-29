<%--
  Created by IntelliJ IDEA.
  User: USER
  Date: 2024/5/9
  Time: 上午 02:04
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Result</title>
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
        .result-section {
            margin-bottom: 40px;
        }
        .result-section h2 {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }
        .result-section p {
            font-size: 18px;
            margin: 10px 0;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="result-section">
        <h2>Search Result</h2>
        <p><strong>Book Name:</strong> ${book.getName()}</p>
        <p><strong>Price:</strong> ${book.getPrice()}</p>
        <p><strong>Author:</strong> ${book.getAuthor()}</p>
        <p><strong>Book Id:</strong> ${book.getBookId()}</p>
    </div>
</div>
</body>
</html>
