<%@page import="db.RentcarDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<jsp:useBean id="mbean" class="db.MemberBean">
		<jsp:setProperty name="mbean" property="*" />
	</jsp:useBean>
<%

	RentcarDAO rdao = new RentcarDAO();
	rdao.insertMember(mbean);
%>
		<script>
			alert("회원가입이 완료되었습니다.");
			location.href="RentcarMain.jsp";
		</script>	

</body>
</html>