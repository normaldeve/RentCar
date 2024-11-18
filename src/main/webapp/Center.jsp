<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>차량 렌트 - 검색, 비교 후 예약</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Lora&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .container {
        width: 1000px;
        max-width: 90%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        overflow: hidden;
        background-color: #fff;
        text-align: center;
    }

    .container h2 {
        font-family: 'Lora', serif;
        font-size: 32px;
        color: #333;
        margin: 20px 0;
    }

    .container img {
        width: 100%;
        height: auto;
        transition: transform 0.3s ease;
        border-bottom: 4px solid #007bff;
    }

    .container img:hover {
        transform: scale(1.02);
    }
</style>
</head>
<body>
<center>
    <div class="container">
        <img align="center" alt="Main Image" src="images/main.webp">
    </div>
</center>
</body>
</html>
