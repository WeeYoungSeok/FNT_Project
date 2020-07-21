<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<header>
	
		<span class="mysection">
			<!-- 마이페이지 -->
			<!-- <a href=""></a> -->
			<button onclick="location.href='fntlogincrud.jsp'">로그인</button>
			
			<!-- 알림 -->
			<a href="mypage.do?command=alert">
				<img id="alertbell" alt="alert" src="./img/bell.png"/>
			</a>
			
			<!-- 번역 -->
			<a id="trans" href="">KO/EN</a>
			
		</span>
		
		<!-- 로고 -->
		<div class="fnt_logo">
			<img src="./img/fnt_logo.png" onclick="location.href='fntmain.html'"/>
		</div>
		
	</header>
	

</body>
</html>