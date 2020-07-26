<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>PW 새로 만들기</title>
<style type="text/css">
* {
   margin: 0px;
   padding: 0px;
}

section {
   padding-top: 90px;
   padding-left: 240px;
}

input {
   width: 500px;
   height: 24px;
   padding-left: 6px;
}

td {
   width: 500px;
   height: 24px;
}
</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	<section>
<%
	String memberid = (String)request.getAttribute("memberid");
%>
		<form action="LoginCrudController" method="post">
		<input type="hidden" name="memberid" value="<%=memberid%>">
		<input type="hidden" name="command" value="updatepwres">
		<h2>비밀번호 변경!!</h2>
		<table border="1">
			<tr>
				<td>
					<input type="text" name="memberpw" required="required" placeholder="비밀번호를  입력해주세요.">
				</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="memberpwchk" required="required" placeholder="비밀번호를 확인해주세요.">
				</td>
			</tr>
			<tr>
				<td>
					<input  type="submit" value="비밀번호 변경 완료!">
				</td>
			</tr>
		</table>
		</form>
	</section>
</body>
</html>