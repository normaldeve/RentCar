<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        color: #333;
        margin: 0;
        padding: 0;
    }
    h1 {
        font-size: 24px;
        font-weight: 700;
        margin: 20px 0;
    }
    .content {
        max-width: 1000px;
        margin: auto;
        padding: 20px;
        text-align: center;
    }
    .car-table {
        width: 100%;
        border-collapse: collapse;
    }
    .car-table td {
        width: 333px;
        padding: 20px;
        text-align: center;
        vertical-align: top;
    }
    .car-table img {
        width: 280px;
        height: 200px;
        border-radius: 8px;
        box-shadow: 0 4px 8px rgba(0,0,0,0.2);
        transition: transform 0.2s;
    }
    .car-table img:hover {
        transform: scale(1.05);
    }
    .car-name {
        font-size: 18px;
        color: #555;
        margin-top: 8px;
        font-weight: bold;
    }
    .search-section {
        margin-top: 40px;
    }
    .search-section p {
        font-size: 18px;
        color: gray;
    }
    .search-section form {
        display: inline-block;
        margin: 0;
    }
    .search-section select,
    .search-section input[type="submit"],
    .search-section button {
        padding: 8px 12px;
        font-size: 16px;
        border: 1px solid #ccc;
        border-radius: 4px;
        margin: 0 5px;
    }
    .search-section button {
        background-color: #007bff;
        color: #fff;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .search-section button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<div class="content">
    <h1>최신형 자동차</h1>
    <table class="car-table">
        <tr>
            <%
                RentcarDAO rdao = new RentcarDAO();
                ArrayList<CarListBean> list = rdao.getSelectCar();
                for (int i = 0; i < list.size(); i++) {
                    CarListBean bean = list.get(i);
            %>
            <td>
                <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo() %>">
                    <img src="images/<%=bean.getImg() %>" alt="<%=bean.getName() %>">
                </a>
                <p class="car-name"><%=bean.getName() %></p>
            </td>
            <% } %>
        </tr>
    </table>

    <div class="search-section">
        <p><b>차량 검색 하기</b></p>
        <form action="RentcarMain.jsp?center=CategoryList.jsp" method="post">
            <select name="category">
                <option value="1">소형</option>
                <option value="2">중형</option>
                <option value="3">대형</option>
            </select>
            <input type="submit" value="검색">
        </form>
        <button onclick="location.href='RentcarMain.jsp?center=CarAllList.jsp'">전체 검색</button>
    </div>
</div>
</body>
</html>
