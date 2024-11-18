<%@page import="model.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<jsp:useBean id="boardbean" class="model.BoardBean">
	<jsp:setProperty name="boardbean" property="*" />
</jsp:useBean>

<%

	//데이터베이스 쪽으로 bean 클래스를 넘겨준다.
	BoardDAO bDao = new BoardDAO();
	bDao.insertBoard(boardbean);
	response.sendRedirect("RentcarMain.jsp?center=BoardList.jsp");


%>

</body>
</html>