<%@page import="db.CarViewBean"%>
<%@page import="db.CarReserveBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 목록</title>
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Lora&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
    }

    .reservation-list-container {
        width: 90%;
        max-width: 1000px;
        background-color: #fff;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
    }

    .reservation-list-container h2 {
        font-family: 'Lora', serif;
        font-size: 24px;
        color: #333;
        text-align: center;
        margin-bottom: 20px;
    }

    .reservation-table {
        width: 100%;
        border-collapse: collapse;
    }

    .reservation-table th, .reservation-table td {
        padding: 10px;
        border: 1px solid #ddd;
        text-align: center;
    }

    .reservation-table th {
        background-color: #007bff;
        color: #fff;
    }

    .reservation-table td img {
        width: 80px;
        height: auto;
        border-radius: 4px;
    }

    .delete-button {
        padding: 6px 12px;
        background-color: #e74c3c;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
    }

    .delete-button:hover {
        background-color: #c0392b;
    }
</style>
</head>
<body>

<%

    String id = (String)session.getAttribute("id");
    if(id == null) {
%>
    <script>
        alert("로그인을 먼저 해주세요");
        location.href='RentcarMain.jsp?center=MemberLogin.jsp';
    </script>
<%
    }

    RentcarDAO rdao = new RentcarDAO();
    ArrayList<CarViewBean> list = rdao.getAllReserve(id);

%>

<div class="reservation-list-container">
    <h2>차량 예약 목록</h2>
    <table class="reservation-table">
        <tr>
            <th>이미지</th>
            <th>이름</th>
            <th>대여일</th>
            <th>대여기간</th>
            <th>금액</th>
            <th>수량</th>
            <th>보험</th>
            <th>wifi</th>
            <th>베이비시트</th>
            <th>네비게이션</th>
            <th>삭제</th>
        </tr>

        <%
            for(int i = 0; i < list.size(); i++) {
                CarViewBean bean = list.get(i);
        %>
        <tr>
            <td><img alt="Car Image" src="images/<%=bean.getImg() %>"></td>
            <td><%=bean.getName() %></td>
            <td><%=bean.getRday() %></td>
            <td><%=bean.getDday() %> 일</td>
            <td><%=bean.getPrice() %> 만원</td>
            <td><%=bean.getQty() %></td>
            <td><%=bean.getUsein() %></td>
            <td><%=bean.getUsewifi() %></td>
            <td><%=bean.getUseseat() %></td>
            <td><%=bean.getUsenavi() %></td>
            <td><button class="delete-button" onclick="location.href='CarReserveDel.jsp?id=<%=id%>&rday=<%=bean.getRday()%>'">삭제</button></td>
        </tr>
        <% } %>
    </table>
</div>

</body>
</html>
