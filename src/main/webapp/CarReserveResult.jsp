<%@page import="db.CarListBean"%>
<%@page import="db.RentcarDAO"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예약 확인</title>
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
        height: 100vh;
    }

    .reservation-container {
        width: 500px;
        max-width: 90%;
        padding: 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        border-radius: 8px;
        background-color: #fff;
        text-align: center;
    }

    .reservation-container h2 {
        font-family: 'Lora', serif;
        font-size: 24px;
        color: #333;
        margin-bottom: 20px;
    }

    .reservation-container img {
        width: 100%;
        height: auto;
        margin-bottom: 20px;
        border-bottom: 4px solid #007bff;
    }

    .reservation-container .price-info {
        font-size: 18px;
        color: #333;
        margin: 10px 0;
    }

    .reservation-container .total-price {
        font-size: 22px;
        color: #e74c3c;
        font-weight: bold;
    }

    .reservation-container .button {
        width: 100%;
        padding: 10px;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
        font-weight: bold;
        margin-top: 20px;
    }

    .reservation-container .button:hover {
        background-color: #0056b3;
    }
</style>
</head>
<body>
<jsp:useBean id="rbean" class="db.CarReserveBean">
    <jsp:setProperty name="rbean" property="*"/>
</jsp:useBean>

<%
    String id = (String)session.getAttribute("id");
    if(id == null) {
%>
    <script>
        alert("로그인후 예약이 가능합니다.");
        location.href="RentcarMain.jsp?center=MemberLogin.jsp";
    </script>
<%
    }
    
    // 날짜 비교
    Date d1 = new Date();
    Date d2 = new Date();
    SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
    
    d1 = sdf.parse(rbean.getRday());
    d2 = sdf.parse(sdf.format(d2));
    int compare = d1.compareTo(d2);
    
    if (compare < 0) {
%>
    <script>
        alert("현재 시스템 날짜보다 이전 날짜는 선택할 수 없습니다.");
        history.go(-1);
    </script>
<%
    }
    
    String id1 = (String)session.getAttribute("id");
    rbean.setId(id1);
    
    RentcarDAO rdao = new RentcarDAO();
    rdao.setReserveCar(rbean);
    
    CarListBean cbean = rdao.getOneCar(rbean.getNo());
    int total = cbean.getPrice() * rbean.getQty() * rbean.getDday();
    
    int usein = 0;
    if(rbean.getUsein() == 1) usein = 10000;
    int usewifi = 0;
    if(rbean.getUsewifi() == 1) usewifi = 10000;
    int useseat = 0;
    if(rbean.getUseseat() == 1) useseat = 10000;
    int usenavi = 0;
    if(rbean.getUsenavi() == 1) usenavi = 10000;
    int totaloption = rbean.getQty() * rbean.getDday() * (usein + usewifi + useseat + usenavi);
%>
<center>
	<div class="reservation-container">
	    <h2>차량 예약 완료</h2>
	    <img alt="" src="images/<%= cbean.getImg() %>">
	    
	    <div class="price-info">
	        <p>차량 총 예약 금액: <%= total %> 원</p>
	        <p>차량 총 옵션 금액: <%= totaloption %> 원</p>
	    </div>
	    
	    <div class="total-price">
	        <p>최종 총 금액: <%= total + totaloption %> 원</p>
	    </div>
	    
	    <button class="button" onclick="location.href='RentcarMain.jsp'">메인 페이지로 돌아가기</button>
	</div>
</center>
</body>
</html>
