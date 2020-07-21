<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style type="text/css">

	* {
		margin: 0px;
		padding: 0px;
	}

	header {
		position: fixed;
		background-color: white;
		width: 100%;
		height: 90px;
		box-shadow: 0px 1px 10px #ccc;
		z-index: 4;
	}
	
	.mysection {
		float: right;
		margin-top: 36px;
		display: flex;
		flex-decoration: row;
	}
	
	#trans {
		margin-right: 40px;
		font: 12pt "Arial";
		font-weight: bold;	
	}
	
	#alertbell {
		width: 20px;
		height: 20px;
		margin-right: 10px;
	}
	
	#loginmsg {
		font: 12pt "Arial";
		right: 140px;
		color: black;
		margin-right: 10px;
		margin-top: 1px;
	}
	
	.fnt_logo {
		position: absolute;
		left: 40%;
	}
	
	.fnt_logo > img {
		width: 180px;
		height: 80px;
	}
	
</style>

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