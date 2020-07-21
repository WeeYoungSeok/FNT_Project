<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)관리자페이지</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
	List<MemberDto> list = (List<MemberDto>)request.getAttribute("list");
%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
		<h1>관리자페이지</h1>
			<p>신고 및 차단처리</p>
			<div>
				<p><a href="admin.do?command=select">전체회원 조회</a></p>
			</div>
			<p>탈퇴회원 조회</p>
			<p>신고회원 조회</p>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>