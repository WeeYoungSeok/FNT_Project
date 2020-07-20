<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<%
	MemberDto dto = (MemberDto)session.getAttribute("dto");
	

%>

	<div>
		<img alt="FNT" src="./img/fnt_logo.png">	
	</div>
	<hr/>
	<form action="LoginCrudController">
	<input type="hidden" name="command" value="login">
	<table border="1">
		<tr>
			<td>ID : <input type="text" name="id" required="required"></td>
		</tr>
		<tr>
			<td>PW : <input type="text" name="pw" required="required"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="로그인" >
				<input type="button" value="회원가입" onclick="location.href='signup.jsp'">
			</td>
		</tr>
		
		<tr>
			<td>
				<input type="button" value="ID 찾기 / PW 찾기" onclick="location.href='logincrudfind.jsp'">
			</td>
		</tr>
	</table>
	</form>

</body>
</html>