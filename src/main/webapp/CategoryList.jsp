<%@page import="db.CarListBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 목록</title>
<!-- Google Fonts 추가 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<style>
    body {
        font-family: 'Roboto', sans-serif;
        background-color: #f4f4f9;
        color: #333;
        margin: 0;
        padding: 0;
    }
    table {
        width: 1000px;
        border-collapse: collapse;
        margin-top: 20px;
    }
    td {
        border: 1px solid #ddd;
        padding: 15px;
        text-align: center;
        background-color: #fff;
        box-shadow: 0px 4px 6px rgba(0, 0, 0, 0.1);
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
    }
    .car-name:hover {
        color: #007bff;
    }
</style>
</head>
<body>
<%

int category = Integer.parseInt(request.getParameter("category"));
String temp="";
if(category == 1) temp="소형";
else if (category == 2) temp="중형";
else temp="대형";

%>
<center>
<table>
<h2><%=temp %> 자동차 목록</h2>
<%
	RentcarDAO rdao = new RentcarDAO();
	ArrayList<CarListBean> list = rdao.getCategoryCar(category);
	
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
		j=j+1;
	}
%>
</table>
</center>
</body>
</html>
