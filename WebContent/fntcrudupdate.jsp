<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 수정</title>
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
   width: 740px;
   height: 24px;
}
</style>
</head>
<body>

	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>

	<section>
	<h2>내정보 수정</h2>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="crudupdateres">
	
		<table border="1">
		<tr>
			<th>Id</th>
			<td><input type="text" readonly="readonly" name="memberid" value="<%=memberdto.getMemberid()%>"></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="text" name="memberpw" value="<%=memberdto.getMemberpw()%>"></td>
		</tr>
		<tr>
			<th>NICKNAME</th>
			<td><input type="text" readonly="readonly" name="membernickname" value="<%=memberdto.getMembernickname()%>"></td>
		</tr>
		<tr>
			<th>NAME</th>
			<td><input type="text" readonly="readonly" name="membername" value="<%=memberdto.getMembername()%>"></td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td><input type="text" readonly="readonly" name="memberphone" value="<%=memberdto.getMemberphone()%>"></td>
		</tr>
		<tr>
			<th>email</th>
			<td><input type="text" name="memberemail" value="<%=memberdto.getMemberemail()%>"></td>
		</tr>
		<tr>
			<td>
				<input type="submit" value="수정하기">
			</td>
		</tr>
		</table>
	</form>
	</section>
</body>
</html>