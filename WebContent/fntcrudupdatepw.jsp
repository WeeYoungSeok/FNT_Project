<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)PW 새로 만들기</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
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
		<form action="LoginCrudController" id="form1" method="post">
		<input type="hidden" name="memberid" value="<%=memberid%>">
		<input type="hidden" name="command" value="updatepwres">
		<h2>비밀번호 변경!!</h2>
		<table border="1">
			<tr>
				<td>
					<input type="password" id="memberpw" name="memberpw" required="required" placeholder="비밀번호를  입력해주세요.">
				</td>
			</tr>
			<tr>
				<td>
					<input type="password" id="memberpwchk" onkeyup="checkCode()" name="memberpwchk" required="required" placeholder="비밀번호를 확인해주세요.">
					
				<div id="code_check"></div>
				</td>
			</tr>
			
			<tr>
				<td>
					<input id="hi" type="hidden" value="비밀번호 변경 완료!">
				</td>
			</tr>
		</table>
		</form>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function checkCode(){
		var v1 = form1.memberpwchk.value;
		var v2 = form1.memberpw.value;
		
		if(v1 != v2){
			document.getElementById("code_check").style.color = "red";
			document.getElementById("code_check").innerHTML = "잘못된 비밀번호";
			
			makeNull();
		}else{
			document.getElementById("code_check").style.color = "blue";
			document.getElementById("code_check").innerHTML = "비밀번호 일치";
			
			makeReal();
		}
	}
	
	
	function makeReal(){
		var hi = document.getElementById("hi");
		hi.type="submit";
	}
	function makeNull(){
		var hi = document.getElementById("hi");
		hi.type="hidden";
		// 인증번호가 다르면 인증하기 버튼을 숨긴다.
	}

</script>	

	<%@ include file="./form/footer.jsp" %>
</body>
</html>