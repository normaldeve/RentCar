<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글 쓰기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f9f9f9;
        margin: 0;
        padding: 0;
    }
    h2 {
        text-align: center;
        color: #333;
        margin-top: 30px;
    }
    form {
        width: 80%;
        max-width: 800px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    table {
        width: 100%;
        border-collapse: collapse;
        margin-bottom: 20px;
    }
    td {
        padding: 10px;
        text-align: left;
        font-size: 14px;
        border: 1px solid #ddd;
    }
    td:nth-child(1) {
        width: 150px;
        background-color: #f2f2f2;
    }
    input[type="text"], input[type="email"], input[type="password"], textarea {
        width: 90%;
        padding: 8px;
        font-size: 14px;
        border-radius: 4px;
        border: 1px solid #ddd;
        margin-top: 5px;
    }
    textarea {
        resize: vertical;
    }
    input[type="submit"], input[type="reset"], input[type="button"] {
        background-color: #007BFF;
        color: white;
        padding: 10px 20px;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
        margin-right: 10px;
        transition: background-color 0.3s;
    }
    input[type="submit"]:hover, input[type="reset"]:hover, input[type="button"]:hover {
        background-color: #0056b3;
    }
    input[type="button"] {
        background-color: #6c757d;
    }
    input[type="button"]:hover {
        background-color: #5a6268;
    }
    .form-footer {
        text-align: center;
    }
</style>
</head>
<body>

<h2>답변 글 입력하기</h2>

<%
    int num = Integer.parseInt(request.getParameter("num"));
    int ref = Integer.parseInt(request.getParameter("ref"));
    int re_step = Integer.parseInt(request.getParameter("re_step"));
    int re_level = Integer.parseInt(request.getParameter("re_level"));
    String subject = request.getParameter("subject");
%>

<form action="BoardReWriteProc.jsp" method="post">
    <table>
        <tr>
            <td>작성자</td>
            <td><input type="text" name="writer" size="60" required></td>
        </tr>
        <tr>
            <td>제목</td>
            <td><input type="text" name="subject" value="[답변]" size="60" required></td>
        </tr>
        <tr>
            <td>이메일</td>
            <td><input type="email" name="email" size="60" required></td>
        </tr>
        <tr>
            <td>비밀번호</td>
            <td><input type="password" name="password" size="60" required></td>
        </tr>
        <tr>
            <td>글 내용</td>
            <td><textarea rows="10" cols="60" name="content" required></textarea></td>
        </tr>
        <tr>
            <td colspan="2" class="form-footer">
                <input type="hidden" name="ref" value="<%=ref %>">
                <input type="hidden" name="re_step" value="<%=re_step %>">
                <input type="hidden" name="re_level" value="<%=re_level %>">
                <input type="submit" value="답변쓰기완료">
                <input type="reset" value="취소">
                <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
