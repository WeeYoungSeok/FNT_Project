<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT - Main</title>
<link href="css/fntmain.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
		<div class="container">
			<ul class="slider">
				<li class="item"><img src="img/1.png"/></li>
				<li class="item"><img src="img/2.png"/></li>
				<li class="item"><img src="img/3.png"/></li>
				<li class="item"><img src="img/4.png"/></li>
				<li class="item"><img src="img/5.png"/></li>
				<li class="item"><img src="img/6.png"/></li>
				<li class="item"><img src="img/7.png"/></li>
				<li class="item"><img src="img/8.png"/></li>
				<li class="item"><img src="img/9.png"/></li>
			</ul>
		</div>
		<script src="./js/fntmain.js"></script>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>