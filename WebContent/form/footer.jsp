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
	
	footer {
		position: fixed;
		bottom: 0px;
		width: 100%;
		background-color: #dddddd;
		box-shadow: 0px -1px 4px #ccc;
		height: 30px;
		z-index: 3;
	}
	
	div {
		padding: 6px;
	}
	
	.foot {
		text-align: center;
		font: 12pt "Arial";
		color: white;
	}

</style>
</head>
<body>

	<footer>
		<div>
			<p class="foot">FNT | 회사소개 | 이용약관 | 개인정보처리방침 | Copyright © & FNT. all rights reserved</p>
		</div>
	</footer>

</body>
</html>