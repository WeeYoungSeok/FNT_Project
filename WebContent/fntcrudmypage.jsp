<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) 내 정보 보기</title>
</head>
<body>
<%
	MemberDto dto = (MemberDto)request.getAttribute("dto");
%>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>

	<h2>내 정보 보기</h2>
	<table border="1">
		<tr>
			<th>Id</th>
			<td>
				<%=dto.getMemberid() %>
			</td>
			<th>PW</th>
			<td>
				<%=dto.getMemberpw() %>
			</td>
			<th>NICKNAME</th>
			<td>
				<%=dto.getMembernickname() %>
			</td>
			<th>NAME</th>
			<td>
				<%=dto.getMembername() %>
			</td>
			<th>PHONE</th>
			<td>
				<%=dto.getMemberphone() %>
			</td>
			<th>EMAIL</th>
			<td>
				<%=dto.getMemberemail() %>
			</td>
		</tr>
	
	</table>


	<%@ include file="./form/footer.jsp" %>
</body>
</html>