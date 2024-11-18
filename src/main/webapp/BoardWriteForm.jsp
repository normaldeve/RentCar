<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘의 게시판</title>
<!-- Google Fonts 추가 (Roboto) -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f9; /* 배경 색상을 밝은 회색으로 설정 */
        color: #333;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }
    h2 {
        font-size: 24px;
        font-weight: 700;
        margin: 20px 0;
        text-align: center;
    }
    table {
        width: 1000px;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        margin: 20px 0;
    }
    td {
        padding: 20px;
        font-size: 14px;
        border-top: 1px solid #ddd;
        text-align: left;
    }
    td:first-child {
        background-color: #f1f1f1; /* 배경 색상 파란색 제거 후 회색으로 설정 */
        color: #333;
        font-weight: bold;
        width: 150px;
    }
    input[type="text"], input[type="email"], input[type="password"], textarea {
        width: 95%;
        padding: 10px;
        border: 1px solid #ccc;
        border-radius: 5px;
        font-size: 14px;
        box-sizing: border-box;
    }
    textarea {
        resize: none;
    }
    input[type="submit"], input[type="reset"], button {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    input[type="submit"]:hover, input[type="reset"]:hover, button:hover {
        background-color: #0056b3;
    }
    button {
        background-color: #6c757d;
    }
    button:hover {
        background-color: #5a6268;
    }
    .button-group {
        text-align: center;
    }
</style>
</head>
<body>

<center>
    <h2>게시글 쓰기</h2>
    <form action="BoardWriteProc.jsp" method="post">
        <table>
            <tr>
                <td>작성자</td>
                <td><input type="text" name="writer" placeholder="작성자를 입력하세요"></td>
            </tr>
            <tr>
                <td>제목</td>
                <td><input type="text" name="subject" placeholder="제목을 입력하세요"></td>
            </tr>
            <tr>
                <td>이메일</td>
                <td><input type="email" name="email" placeholder="example@email.com"></td>
            </tr>
            <tr>
                <td>비밀번호</td>
                <td><input type="password" name="password" placeholder="비밀번호를 입력하세요"></td>
            </tr>
            <tr>
                <td>글 내용</td>
                <td><textarea rows="10" name="content" placeholder="글 내용을 입력하세요"></textarea></td>
            </tr>
            <tr>
                <td colspan="2" class="button-group">
                    <input type="submit" value="글쓰기">
                    <input type="reset" value="다시 작성">
                    <button type="button" onclick="location.href='RentcarMain.jsp?center=BoardList.jsp'">전체 게시글 보기</button>
                </td>
            </tr>
        </table>
    </form>
</center>

</body>
</html>
