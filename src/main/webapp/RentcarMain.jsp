<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>차량 렌탈 서비스</title>
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
        border-top: 1px solid #ddd;
        text-align: center;
    }
    td:first-child {
        border-top: none;
    }
    h1 {
        font-size: 24px;
        font-weight: 700;
        margin: 20px 0;
    }
</style>
</head>
<body>

<%
    String center = request.getParameter("center");
    if(center == null) {
        center = "Center.jsp";
    }
%>
<center>
<table>
    <tr height="140">
        <td> <jsp:include page="Top.jsp" /></td>
    </tr>
    
    <tr height="600">
        <td> <jsp:include page="<%= center %>"/></td>
    </tr>
    
    <tr height="100">
        <td> <jsp:include page="Bottom.jsp" /></td>
    </tr>
</table>
</center>

</body>
</html>
