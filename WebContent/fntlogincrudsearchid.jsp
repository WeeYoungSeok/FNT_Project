<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ID 찾기</title>
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
<%!
	public int getRandom(){
	int random = 0;
	random = (int)Math.floor((Math.random()*(99999-10000+1)))+10000;
	return random;
}
%>
	
<%
	String membername = (String)request.getAttribute("membername");
	String memberemail = (String)request.getAttribute("memberemail");
	String memberphone = (String)request.getAttribute("memberphone");
%>	
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
				<td>
					<input type="button"  value="인증번호 발송" onclick="location.href='LoginCrudController?command=emailchk&membername=<%=membername%>&memberemail=<%=memberemail%>'">
				</td>
				<td>
					<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=getRandom()%>">
				</td>
			</tr>
		</table>
		<input type="submit" value="검색하기">
		</form>
		</section>
	
	 




</body>
</html>