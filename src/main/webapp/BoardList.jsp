<%@page import="model.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전체 게시글</title>
<!-- Google Fonts 추가 (Roboto) -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f9;
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
    th {
        padding: 20px;
        text-align: center;
        border-top: 1px solid #ddd;
    }
    
	td {
        padding: 20px;
        text-align: left;
        border-top: 1px solid #ddd;
    }
    th {
        background-color: #007BFF;
        color: white;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #e9f5ff;
    }
    a {
        text-decoration: none;
        color: #007BFF;
    }
    a:hover {
        text-decoration: underline;
    }
    .button-container {
        text-align: center;
        margin: 20px;
    }
    input[type="button"] {
        background-color: #007BFF;
        color: white;
        border: none;
        padding: 10px 20px;
        border-radius: 5px;
        cursor: pointer;
        font-size: 14px;
    }
    input[type="button"]:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>

<%

    BoardDAO bDao = new BoardDAO();
    ArrayList<BoardBean> list = bDao.getAllBoard();

%>

<center>
    <h2>전체 게시글 보기</h2>
    <table>
        <tr>
            <th width="60">번호</th>
            <th width="340">제목</th>
            <th width="130">작성자</th>
            <th width="170">작성일자</th>
            <th width="100">조회수</th>
        </tr>
        <%
        for(int i = 0; i < list.size(); i++) {
            BoardBean bean = list.get(i);
        %>
        <tr>
            <td><%=i + 1 %></td>
            <td align="left">
                <a href="BoardInfo.jsp?num=<%=bean.getNum()%>">
                    <%
                    if(bean.getRe_step() > 1) {
                        for(int j = 0; j < (bean.getRe_step() - 1) * 5; j++) {
                    %>&nbsp;
                    <% 		}
                    }
                    %>
                    <%=bean.getSubject() %></a>
            </td>
            <td><%=bean.getWriter() %></td>
            <td><%=bean.getReg_date() %></td>
            <td><%=bean.getReadcount() %></td>
        </tr>
        <%
        }
        %>
    </table>
    <div class="button-container">
        <input type="button" value="글쓰기" onclick="location.href='BoardWriteForm.jsp'">
    </div>
</center>

</body>
</html>
