<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 목록</title>
<!-- Google Fonts 추가 (Roboto) -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 20px;
        display: flex;
        justify-content: center;
        align-items: center;
        flex-direction: column;
    }
    h1 {
        font-size: 24px;
        font-weight: 700;
        margin: 20px 0;
        color: #333;
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
    td a {
        text-decoration: none;
        color: inherit;
    }
    td img {
        border-radius: 8px;
        transition: transform 0.3s ease;
    }
    td img:hover {
        transform: scale(1.05);
    }
    .car-name {
        font-size: 18px;
        font-weight: 700;
        color: #333;
        margin-top: 10px;
    }
    .car-name:hover {
        color: #007bff;
    }
</style>
</head>
<body>

<center>
<h1>전체 렌트카 보기</h1>
<table>
<%
    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarListBean> list = rdao.getAllCar();
    
    int j = 0;
    for(int i = 0; i < list.size(); i++) {
        CarListBean bean = list.get(i);
        if(j % 3 == 0) {
%>
    <tr height="220">    
<% } %>     
        <td width="333">
            <a href="RentcarMain.jsp?center=CarReserveInfo.jsp?no=<%=bean.getNo() %>">
                <img src="images/<%=bean.getImg() %>" width="300" height="200" alt="">
                <p class="car-name"><%=bean.getName() %></p>
            </a>
        </td>
<%        
        j = j + 1;
        if(j % 3 == 0) {
%>
    </tr>
<%
        }
    }
    // 남은 열을 채우기 위해 빈 셀 추가
    while(j % 3 != 0) {
%>
        <td></td>
<%
        j++;
    }
%>
</table>
</center>

</body>
</html>
