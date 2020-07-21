<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>알람내역</title>
<script type="text/javascript" src="js/fntalert.jsp"></script>
</head>
<body>
	<%
		//세션에 값이 담긴 memberdto을 받아온다.
		MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
	%>
	<h1><%=memberdto.getMembername() %>님 안녕하세요?</h1>
</body>
</html>