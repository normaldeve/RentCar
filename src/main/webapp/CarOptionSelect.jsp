<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 예약 옵션 선택</title>
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
        color: #555;
    }
    table {
        width: 800px;
        border-collapse: collapse;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
        border-radius: 8px;
        overflow: hidden;
        margin: 20px auto;
    }
    td {
        padding: 15px;
        text-align: center;
    }
    select, input[type="date"] {
        width: 80%;
        padding: 8px;
        border-radius: 4px;
        border: 1px solid #ddd;
    }
    input[type="submit"] {
        background-color: #007bff;
        color: #fff;
        padding: 12px 20px;
        font-size: 16px;
        font-weight: bold;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }
    input[type="submit"]:hover {
        background-color: #0056b3;
    }
    .car-name {
        font-size: 20px;
        color: #666;
        font-weight: bold;
    }
</style>
</head>
<body>

<%
    int no = Integer.parseInt(request.getParameter("no"));
    int qty = Integer.parseInt(request.getParameter("qty"));
    String img = request.getParameter("img");
%>

<center>
<form action="RentcarMain.jsp?center=CarReserveResult.jsp" method="post">
<table>
    <tr height="100">
        <td align="center" colspan="3">
            <span class="car-name">옵션 선택</span>
        </td>
    </tr>
    <tr>
        <td rowspan="7" width="500" align="center">
            <img alt="" src="images/<%=img %>" width="450">
        </td>
        <td width="250" align="center">대여기간</td>
        <td width="250" align="center">
            <select name="dday">
                <option value="1">1일</option>
                <option value="2">2일</option>
                <option value="3">3일</option>
                <option value="4">4일</option>
                <option value="5">5일</option>
                <option value="6">6일</option>
            </select>
        </td>
    </tr>
    <tr>
        <td width="250" align="center">대여일</td>
        <td width="250" align="center">
            <input type="date" name="rday" size="15">
        </td>
    </tr>
    <tr>
        <td width="250" align="center">보험적용</td>
        <td width="250" align="center">
            <select name="usein">
                <option value="1">적용 (1일 1만원)</option>
                <option value="2">비적용</option>
            </select>
        </td>
    </tr>
    <tr>
        <td width="250" align="center">와이파이 적용</td>
        <td width="250" align="center">
            <select name="usewifi">
                <option value="1">적용 (1일 1만원)</option>
                <option value="2">비적용</option>
            </select>
        </td>
    </tr>
    <tr>
        <td width="250" align="center">네비게이션 적용</td>
        <td width="250" align="center">
            <select name="usenavi">
                <option value="1">적용 (1일 1만원)</option>
                <option value="2">비적용</option>
            </select>
        </td>
    </tr>
    <tr>
        <td width="250" align="center">베이비시트 적용</td>
        <td width="250" align="center">
            <select name="useseat">
                <option value="1">적용 (1일 1만원)</option>
                <option value="2">비적용</option>
            </select>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
        	<input type="hidden" name="no" value="<%=no %>">
        	<input type="hidden" name="qty" value="<%=qty %>">
            <input type="submit" value="차량예약">
        </td>
    </tr>
</table>
</form>
</center>

</body>
</html>
