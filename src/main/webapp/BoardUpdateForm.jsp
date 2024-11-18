<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 수정</title>
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
    }
    td {
        padding: 10px;
        text-align: left;
        font-size: 14px;
        border: 1px solid #ddd;
    }
    td:nth-child(1) {
        width: 120px;
        background-color: #f2f2f2;
    }
    input[type="text"], input[type="password"], textarea {
        width: 100%;
        padding: 8px;
        font-size: 14px;
        border-radius: 4px;
        border: 1px solid #ddd;
        margin-top: 5px;
    }
    textarea {
        resize: vertical;
    }
    input[type="submit"], input[type="button"] {
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
    input[type="submit"]:hover, input[type="button"]:hover {
        background-color: #0056b3;
    }
    .form-footer {
        text-align: center;
    }
</style>
</head>
<body>

<h2>게시글 수정</h2>

<%
    // 해당 게시글 번호를 통해서 게시글을 수정
    int num = Integer.parseInt(request.getParameter("num").trim());
    
    BoardDAO bdao = new BoardDAO();
    BoardBean bean = bdao.getOneUpdateBoard(num);
%>

<form action="BoardUpdateProc.jsp" method="post">
    <table>
        <tr>
            <td>작성자</td>
            <td><%=bean.getWriter() %></td>
            <td>작성일</td>
            <td><%=bean.getReg_date() %></td>
        </tr>
        <tr>
            <td>제목</td>
            <td colspan="3"><input type="text" name="subject" value="<%=bean.getSubject() %>" required></td>
        </tr>
        <tr>
            <td>패스워드</td>
            <td colspan="3"><input type="password" name="password" required></td>
        </tr>
        <tr>
            <td>글내용</td>
            <td colspan="3"><textarea rows="10" cols="60" name="content" required><%=bean.getContent() %></textarea></td>
        </tr>
        <tr>
            <td colspan="4" class="form-footer">
                <input type="hidden" name="num" value="<%=bean.getNum() %>">
                <input type="submit" value="글수정">
                <input type="button" onclick="location.href='BoardList.jsp'" value="전체글보기">
            </td>
        </tr>
    </table>
</form>

</body>
</html>
