 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)PW 새로 만들기</title>
<link href="css/fntsignupform.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}

table {
	margin: auto;
	margin-top: 50px;
}

#submitbtn {
	width: 100%;
	height: 40px;
}
 

section {
	padding-top: 7%;
	margin-left: 14%;
	width: 100%;
	overflow: auto;
	margin-bottom: 30px;
}

.border{
	border: 1px solid gray;
	margin-left: 13%;
}

h2{
	margin-top: 5%;
	margin-right: 25%;
}

#tablediv{
	margin-left: 8%;
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
		<div id="tablediv">
		<h2 align="center" style="font-family: Arial;">PW 변경</h2>
		<table class="border" style="width:50%">
			<col width="200px">
			<col width="200px">
			<col width="400px">
			<col width="200px">
			<tr>
				<td></td>
				<td></td>
				<td></td>
				<td></td>	
			</tr>
			<tr>
				<td></td>
				<th>NEW PW</th>
				<td>
					<input type="password" id="memberpw" name="memberpw" required="required" placeholder="비밀번호를  입력해주세요.">
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<th>NEW PWCHK</th>
				<td>
					<input type="password" id="memberpwchk" onkeyup="checkCode()" name="memberpwchk" required="required" placeholder="비밀번호를 확인해주세요.">
					</td>
				<td><div id="code_check"></div></td>
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2">
					<input class="submitbtn" id="submitbtn" type="hidden" value="비밀번호 변경">
				</td>
				<td></td>
				</tr>
			<tr><td></td><td></td><td></td><td></td></tr>
			
		</table>
		</div>
		</form>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
	function checkCode(){
		var v1 = form1.memberpwchk.value;
		var v2 = form1.memberpw.value;
		
		if(v1 != v2){
			document.getElementById("code_check").style.color = "red";
			document.getElementById("code_check").innerHTML = "&nbsp;&nbsp;잘못된 비밀번호";
			
			makeNull();
		}else{
			document.getElementById("code_check").style.color = "blue";
			document.getElementById("code_check").innerHTML = "&nbsp;&nbsp;비밀번호 일치";
			
			makeReal();
		}
	}
	
	
	function makeReal(){
		var hi = document.getElementById("submitbtn");
		hi.type="submit";
	}
	function makeNull(){
		var hi = document.getElementById("submitbtn");
		hi.type="hidden";
		// 인증번호가 다르면 인증하기 버튼을 숨긴다.
	}

</script>	

	<%@ include file="./form/footer.jsp" %>
</body>
</html>