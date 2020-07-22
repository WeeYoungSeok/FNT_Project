<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
<style type="text/css">
	div{
		text-align: center;
	}
</style>
</head>
<body>

	<div>
	<a href="fntmain.jsp"><img alt="FNT" src="./img/fnt_logo.png"></a>	
	</div>
	
	
		<form action="LoginCrudController" method="post">
		<input type="hidden" name="command" value="searchid">
		<h2>ID 찾기</h2>
		
		<table border="1">
			<tr>
				<td>
					<input type="text" id="name" name="name" placeholder="이름을 입력하세요" >
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="email" name="email" placeholder="email을 입력하세요">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" id="phone" name="phone" placeholder="핸드폰번호를 입력하세요">
				</td>
				<td>
					<input type="button" name="certification" value="인증하기" onclick="">
				</td>
			</tr>
		</table>
		<input type="submit" value="검색하기">
		</form>
	
	




</body>
</html>