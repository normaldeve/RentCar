<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원 가입</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Lora&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }

    .container {
        width: 400px;
        max-width: 90%;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        overflow: hidden;
        background-color: #fff;
        padding: 20px;
        text-align: center;
    }

    .container h2 {
        font-family: 'Lora', serif;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .container table {
        width: 100%;
        margin: 0 auto;
        border-collapse: separate;
        border-spacing: 0 10px;
    }

    .container td {
        padding: 8px;
        font-size: 14px;
        color: #333;
    }

    .container input[type="text"],
    .container input[type="password"],
    .container input[type="tel"] {
        width: 100%;
        padding: 8px;
        border: 1px solid #ddd;
        border-radius: 4px;
        box-sizing: border-box;
        transition: border-color 0.3s;
    }

    .container input[type="text"]:focus,
    .container input[type="password"]:focus,
    .container input[type="tel"]:focus {
        border-color: #007bff;
    }

    .container input[type="submit"],
    .container input[type="reset"] {
        width: 100%;
        padding: 10px;
        font-size: 16px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s;
    }

    .container input[type="submit"]:hover,
    .container input[type="reset"]:hover {
        background-color: #0056b3;
    }

    .container input[type="reset"] {
        background-color: #6c757d;
    }

    .container input[type="reset"]:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
<center>
    <div class="container">
        <h2>회원 가입</h2>
        <form action="MemberJoinProc.jsp" method="post">
            <table>
                <tr>
                    <td>아이디</td>
                    <td><input type="text" name="id" required></td>
                </tr>
                <tr>
                    <td>패스워드</td>
                    <td><input type="password" name="pass" required></td>
                </tr>
                <tr>
                    <td>전화번호</td>
                    <td><input type="tel" name="tel" required></td>
                </tr>
                <tr height="50">
                    <td colspan="2" align="center">
                        <input type="submit" value="회원 가입">
                        <input type="reset" value="취소">
                    </td>
                </tr>
            </table>
        </form>
    </div>
</center>
</body>
</html>
