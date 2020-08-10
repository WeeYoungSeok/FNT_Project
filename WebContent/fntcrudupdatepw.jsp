 <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)PW 새로 만들기</title>
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

#menutitle {
	padding-left: 31% !important;
}

section {
	padding-top: 7%;
	width: 100%;
	overflow: auto;
	margin-bottom: 30px;
}

#tablediv {
	margin-left: 8%;
}

h2 {
	margin-top: 5%;
	margin-right: 25%;
	color: white;
	text-align: center;
	font-family: Arial;
}

.border {
	margin: 0px auto;
	margin-top: 50px;
	border: 2px solid rgba(255, 255, 255, 0.5);
	margin-left: 13%;
	font-family: Arial;
}

th {
	color: white;
	height: 30px;
	background-color: rgba(255, 255, 255, 0.2);
}

td {
	color: white;
}

#memberpw {
	color: white;
	padding-left: 10px;
	width: 96%;
	height: 30px;
	border: none;
	border-radius: 2px 2px 2px 2px;
	background-color: rgba(255, 255, 255, 0);
}

#memberpw::placeholder {
	color: white;
}

#memberpwchk {
	color: white;
	padding-left: 10px;
	width: 96%;
	height: 30px;
	border: none;
	border-radius: 2px 2px 2px 2px;
	background-color: rgba(255, 255, 255, 0);
}

#memberpwchk::placeholder {
	color: white;
}

#submitbtn {
	width: 100%;
	height: 40px;
	font-size: 14pt;
	color: white;
	background-color: rgba(255,255,255,0.2);
	border: 2px solid rgba(255,255,255,0);
	border-radius: 4px 4px 4px 4px;
}

#submitbtn:hover {
	background-color: rgba(255,255,255,0);
	border: 2px solid rgba(255,255,255,0.5);
	font-weight: bold;
}

.notform {
	width: 30px !important;
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
		<h2>PW 변경</h2>
		<table class="border" style="width:50%">
			<tr>
				<td colspan="4" style="height: 30px;"></td>
			</tr>
			<tr>
				<td class="notform"></td>
				<th>NEW PW</th>
				<td>
					<input type="password" id="memberpw" name="memberpw" required="required" placeholder="비밀번호를 입력해주세요.">
				</td>
				<td class="notform"></td>
			</tr>
			<tr>
				<td></td>
				<th>NEW PWCHK</th>
				<td>
					<input type="password" id="memberpwchk" onkeyup="checkCode()" name="memberpwchk" required="required" placeholder="비밀번호를 다시 한 번 입력해주세요.">
					</td>
				<td></td>
			</tr>
			<tr><td colspan="4" style="height: 40px; padding-top: 6px;"><div id="code_check" style="text-align: center;"></div></td></tr>
			<tr>
				<td></td>
				<td colspan="2">
					<input class="submitbtn" id="submitbtn" type="hidden" value="비밀번호 변경">
				</td>
				<td></td>
				</tr>
			<tr>
				<td colspan="4" style="height: 30px;"></td>
			</tr>
			
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
			document.getElementById("code_check").style.color = "white";
			document.getElementById("code_check").innerHTML = "잘못된 비밀번호";
			
			makeNull();
		}else{
			document.getElementById("code_check").style.color = "#fee500";
			document.getElementById("code_check").innerHTML = "비밀번호 일치";
			
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