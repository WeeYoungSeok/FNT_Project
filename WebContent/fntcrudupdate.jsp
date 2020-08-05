<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 수정</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
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
		<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
	<%
		} else {
	%>
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
	<%@ include file="./form/footer.jsp" %>
	<%
		}
	%>
</body>
</html>