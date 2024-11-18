<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자동차 예약하기</title>
<!-- Google Fonts에서 Roboto와 Lora 글꼴 추가 -->
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&family=Lora&display=swap" rel="stylesheet">
<style>
    /* 전체 글꼴을 Roboto로 지정 */
    body {
        font-family: 'Roboto', sans-serif;
    }

    .logo {
        display: inline-block;
        vertical-align: middle;
        margin-right: 10px;
    }

    .title {
        display: inline-block;
        vertical-align: middle;
    }

    h2 {
        font-family: 'Lora', serif; /* 제목에 Lora 글꼴 적용 */
        margin: 0;
        color: #333;
    }

    /* 링크 스타일 */
    a {
        color: white;
        text-decoration: none;
        font-weight: bold;
        transition: color 0.3s ease, background-color 0.3s ease;
    }

    a:hover {
        color: #ffeb3b; /* 마우스 오버 시 글씨 색상 */
        text-decoration: none;
    }

    /* 상단 메뉴 스타일 */
    .menu-item {
        text-align: center;
        background-color: blue;
        color: white;
        padding: 15px 0;
        font-size: 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .menu-item:hover {
        background-color: #0056b3; /* 마우스 오버 시 배경색 */
    }

    /* 테이블 스타일 */
    .header-table {
        width: 100%;
        max-width: 1400px;
        margin: 0 auto;
    }

    .header-table tr:first-child td {
        padding: 15px;
    }

    /* 로그인 버튼 스타일 */
    .login-button {
        background-color: #28a745; /* 로그인 버튼 색상 */
        color: white;
        font-weight: bold;
        border: none;
        border-radius: 4px;
        padding: 8px 16px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .login-button:hover {
        background-color: #218838; /* 로그인 버튼 마우스 오버 색상 */
    }
</style>
</head>
<body>
<%
//로그아웃 관련 코드
	String logout = request.getParameter("logout");
	if (logout != null) {
		session.setAttribute("id", null);
		session.setMaxInactiveInterval(0);
	}
	
    String id = (String)session.getAttribute("id");
    if (id == null) {
        id = "GUEST";
    }
%>

<table class="header-table">
    <tr>
        <td colspan="4">
            <a href="RentcarMain.jsp">
                <div class="logo">
                    <img alt="" src="images/RENT.webp" height="65"> 
                </div>
            </a>
            <a href="RentcarMain.jsp">
	            <div class="title">
	                <h2>CAR RENTAL</h2>
	            </div>
	        </a>
        </td>
        <td align="center" width="200">
            <%= id %> 님 
           <%
           	if(id.equals("GUEST")) { %>
                <button onclick="location.href='RentcarMain.jsp?center=MemberLogin.jsp'">로그인</button>
          	<%
           	} else { %>
           		<button onclick="location.href='RentcarMain.jsp?logout=1'">로그아웃</button>
           <% 
           	}
           %>
        </td>
    </tr>
    <tr>
        <td class="menu-item">
            <a href="RentcarMain.jsp?center=CarReserveMain.jsp">예 약 하 기</a>
        </td>
        <td class="menu-item">
            <a href="RentcarMain.jsp?center=CarReserveView.jsp">예 약 확 인</a>
        </td>
        <td class="menu-item">
            <a href="RentcarMain.jsp?center=BoardList.jsp">자유게시판</a>
        </td>
        <td class="menu-item">
            <a href="#">이벤트</a>
        </td>
        <td class="menu-item">
            <a href="#">고객센터</a>
        </td>
    </tr>
</table>

</body>
</html>
