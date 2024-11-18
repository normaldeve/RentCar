<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 선택</title>
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
    h1 {
        font-size: 24px;
        font-weight: 700;
        color: #333;
        margin: 20px 0;
    }
    table {
        width: 1000px;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
    }
    td {
        padding: 20px;
        border: 1px solid #ddd;
        text-align: center;
    }
    td img {
        border-radius: 8px;
    }
    select {
        padding: 8px;
        font-size: 16px;
        border-radius: 4px;
        border: 1px solid #ccc;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        border: none;
        padding: 10px 20px;
        font-size: 16px;
        font-weight: 700;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .car-info {
        font-size: 18px;
        color: #666;
        margin-top: 20px;
    }
</style>
</head>
<body>

<%
    int no = Integer.parseInt(request.getParameter("no"));
    RentcarDAO rdao = new RentcarDAO();
    CarListBean bean = rdao.getOneCar(no);

    int category = bean.getCategory();
    String temp = "";
    if (category == 1) temp = "소형";
    else if (category == 2) temp = "중형";
    else temp = "대형";
%>

<center>
<h1><%=bean.getName() %> 차량 선택</h1>
<form action="RentcarMain.jsp?center=CarOptionSelect.jsp" method="post">
<table>
    <tr>
        <td rowspan="6" width="450">
            <img src="images/<%= bean.getImg() %>" width="400" alt="<%=bean.getName() %>">
        </td>
        <td width="250">차량 이름</td>
        <td width="250"><%=bean.getName() %></td>
    </tr>
    <tr>
        <td>차량 수량</td>
        <td>
            <select name="qty">
                <option value="1">1</option>
                <option value="2">2</option>
                <option value="3">3</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>차량 분류</td>
        <td><%=temp %></td>
    </tr>
    <tr>
        <td>대여 가격</td>
        <td><%=bean.getPrice() %>원</td>
    </tr>
    <tr>
        <td>제조 회사</td>
        <td><%=bean.getCompany() %></td>
    </tr>
    <tr>
        <td colspan="2">
            <input type="hidden" name="no" value="<%=bean.getNo() %>">
            <input type="hidden" name="img" value="<%=bean.getImg() %>">
            <input type="submit" value="옵션 선택 후 구매하기">
        </td>
    </tr>
</table>
<div class="car-info">
    <strong>차량 정보 보기:</strong>
    <p><%=bean.getInfo() %></p>
</div>
</form>
</center>

</body>
</html>
