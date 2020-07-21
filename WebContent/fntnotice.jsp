
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css"> * {margin: 0px; padding: 0px;} section {padding-top: 90px; padding-left: 240px;} </style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<section>
		
		<h1>공지사항</h1>
		
		
		<div>
		<input type="button" value="글 작성" onclick="location.href='notice.do?command=insert'"/>
		</div>
		
		
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>