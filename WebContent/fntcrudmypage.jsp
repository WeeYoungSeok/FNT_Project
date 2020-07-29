<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 보기</title>
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

	<h2>내 정보 보기</h2>
	<section>
	
	<table border="1">
		<tr>
			<th>Id</th>
			<td>
				<%=memberdto.getMemberid() %>
			</td>
		</tr>
		<tr>
			<th>PW</th>
			<td>
				<%=memberdto.getMemberpw() %>
			</td>
		</tr>
		<tr>
			<th>NICKNAME</th>
			<td>
				<%=memberdto.getMembernickname() %>
			</td>
		</tr>
		<tr>
			<th>NAME</th>
			<td>
				<%=memberdto.getMembername() %>
			</td>
		</tr>
		<tr>
			<th>PHONE</th>
			<td>
				<%=memberdto.getMemberphone() %>
			</td>
		</tr>
		<tr>
			<th>EMAIL</th>
			<td>
				<%=memberdto.getMemberemail() %>
			</td>
		</tr>
		<tr>
			<td colspan="2" align="right">
				<input type="button" value="개인정보 수정" onclick="location.href='LoginCrudController?command=crudupdate&memberid=<%=memberdto.getMemberid()%>'">
			</td>
		</tr>
	</table>
				<input type="button" value="탈퇴하기" onclick="location.href='LoginCrudController?command=outmember&memberid=<%=memberdto.getMemberid()%>&memberenabled=N'">
				
	</section>

	


	<%@ include file="./form/footer.jsp" %>
</body>
</html>