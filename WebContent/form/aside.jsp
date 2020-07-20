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

	aside {
		position: fixed;
		align: left;
		top: 90px;
		height: 100%;
		background-color: #fee500;
		box-shadow: 1px 0px 6px #ccc;
		z-index: 2;
	}
	
	.menubar {
		padding-top: 24px;
		background-color: #fee500;
		width: 200px;
		height: 50px;
	}
	
	.menubar:hover {
		background-color: black;
		color: white;
		font-weight: bold;
		cursor: pointer;
	}
	
	p {
		text-align: left;
		padding-left: 40px;
		font: 16pt "Arial";
		
	}
	
</style>
</head>
<body>

	<aside>
	
		<p class="menubar" onclick="location.href='notice.do?command=notice'">공지사항</p>
		<p class="menubar" onclick="">구매게시판</p>
		<p class="menubar" onclick="">판매게시판</p>
		<p class="menubar" onclick="">고객센터</p>
		
	</aside>

</body>
</html>