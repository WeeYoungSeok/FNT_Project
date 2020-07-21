<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<style type="text/css">
	div{
		text-align : center;
		
	}
	table{
		text-align : center;
	}
	
</style>
</head>
<body>
	<div>
		<a href="fntmain.jsp"><img alt="FNT" src="./img/fnt_logo.png"></a>	
	</div>
	<hr/>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="login">
	<table border="1">
		<tr>
			<td>ID : <input type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<td>PW : <input type="password" name="pw" required="required"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="로그인" >
				<input type="button" value="회원가입" onclick="location.href='fntsignupform.jsp'">
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="button" value="ID 찾기 / PW 찾기" onclick="location.href='command?logincrudfind'">
			</td>
		</tr>
		<tr>
			<td>
				<input type="button" value="카카오 로그인">
				<input type="button" value="네이버 로그인">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>