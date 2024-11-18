<%@page import="model.BoardBean"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 보기</title>
<style>
    body {
        font-family: Arial, sans-serif;
        margin: 0;
        padding: 0;
        background-color: #f9f9f9;
    }
    h2 {
        color: #333;
        margin-top: 20px;
    }
    table {
        border-collapse: collapse;
        margin: 20px auto;
        width: 80%;
        max-width: 900px;
        background: #fff;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
    }
    th, td {
        padding: 15px;
        text-align: center;
        font-size: 14px;
        border: 1px solid #ddd;
    }
    th {
        background-color: #007BFF;
        color: #fff;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e9f5ff;
    }
    .button-group {
        text-align: center;
        margin-top: 20px;
    }
    input[type="button"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 5px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    input[type="button"]:hover {
        background-color: #0056b3;
    }
    .button-group input[type="button"]:last-child {
        background-color: #6c757d;
    }
    .button-group input[type="button"]:last-child:hover {
        background-color: #5a6268;
    }
    .table-info td {
        background-color: #f9f9f9;
        font-weight: bold;
    }
</style>
</head>
<body>

<%
    int num = Integer.parseInt(request.getParameter("num").trim());
    BoardDAO bdao = new BoardDAO();
    BoardBean bean = bdao.getOneBoard(num);
%>

<center>
<h2>게시글 보기</h2>
<table>
    <tr>
        <th width="195">글번호</th>
        <td width="255"><%=bean.getNum() %></td>
        <th width="195">조회수</th>
        <td width="255"><%=bean.getReadcount() %></td>
    </tr>
    <tr>
        <th>작성자</th>
        <td><%=bean.getWriter() %></td>
        <th>작성일</th>
        <td><%=bean.getReg_date() %></td>
    </tr>
    <tr>
        <th>이메일</th>
        <td colspan="3"><%=bean.getEmail() %></td>
    </tr>
    <tr>
        <th>글 내용</th>
        <td colspan="3"><%=bean.getContent() %></td>
    </tr>
</table>

<div class="button-group">
    <input type="button" value="답글쓰기" 
        onclick="location.href='BoardReWriteForm.jsp?num=<%=bean.getNum() %>&ref=<%=bean.getRef() %>&re_step=<%=bean.getRe_step() %>&re_level=<%=bean.getRe_level() %>'">
    <input type="button" value="수정하기" onclick="location.href='BoardUpdateForm.jsp?num=<%=bean.getNum() %>'">
    <input type="button" value="삭제하기" onclick="location.href='BoardDeleteForm.jsp?num=<%=bean.getNum() %>'">
    <input type="button" value="목록보기" onclick="location.href='RentcarMain.jsp?center=BoardList.jsp'">
</div>

</center>

</body>
</html>
