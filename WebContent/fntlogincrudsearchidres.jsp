<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MemberDto dto = (MemberDto)request.getAttribute("dto");
	%>
	<div><%=dto.getMemberid() %></div>
	<br/>
	<input type="button" value="로그인 하러가기" onclick="location.href='fntlogincrud.jsp'">
	 
</body>
</html>