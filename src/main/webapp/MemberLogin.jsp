<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>로그인</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
    }

    .login-container {
        width: 500px;
        max-width: 90%;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        background-color: #fff;
        text-align: center;
    }

    .login-container h2 {
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .login-container input[type="text"], 
    .login-container input[type="password"] {
        width: 80%;
        padding: 10px;
        margin: 8px 0;
        border: 1px solid #ccc;
        border-radius: 4px;
        font-size: 14px;
    }

    .login-container input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        margin-top: 10px;
    }

    .login-container input[type="submit"]:hover {
        background-color: #0056b3;
    }

    .login-container .signup-button {
        width: 100%;
        padding: 10px;
        background-color: #6c757d;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        margin-top: 10px;
    }

    .login-container .signup-button:hover {
        background-color: #5a6268;
    }
</style>
</head>
<body>
<center>
    <div class="login-container">
        <h2>로그인</h2>
        <form action="MemberLoginProc.jsp" method="post">
            <input type="text" name="id" placeholder="아이디" required>
            <input type="password" name="pass" placeholder="패스워드" required>
            <input type="submit" value="로그인">
        </form>
        <button class="signup-button" onclick="location.href='RentcarMain.jsp?center=MemberJoin.jsp'">회원가입</button>
    </div>
</center>
</body>
</html>
