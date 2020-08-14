<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)PW 찾기</title>
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}
#menutitle {padding-left:31% !important;}
section {margin: 0px; padding: 0px;}

#form {margin-top: 8%; margin: 0px auto; width: 40%; height: 283px; }
h2 {margin-top: 20%; font-family: "Arial"; color: white; text-align: center;}
.border {width: 100%; margin: 0px auto; margin-top: 6%; font-family: "Arial"; color: white; border: 2px solid rgba(255,255,255,0.5);}
th {width: 70px; font-weight: bold; background-color: rgba(255,255,255,0.2); text-align: center;}
td {height: 30px;}
#id {width: 100%; height: 30px; padding-left: 10px; border: none; background-color: rgba(255,255,255,0); color: white;}
#id::placeholder {color: white;}
#name {width: 100%; height: 30px; padding-left: 10px; border: none; background-color: rgba(255,255,255,0); color: white;}
#name::placeholder {color: white;}
#email {width: 100%; height: 30px; padding-left: 10px; border: none; background-color: rgba(255,255,255,0); color: white;}
#email::placeholder {color: white;}
#submitbtn {width: 102%; height: 40px; font-size: 13pt; margin: 0px; color: white; border: 2px solid rgba(255,255,255,0); border-radius: 4px 4px 4px 4px; background-color: rgba(255,255,255,0.3);}
#submitbtn:hover {font-weight: bold; border: 2px solid rgba(255,255,255,0.5); background-color: rgba(255,255,255,0);}
.formx {width: 30px !important;}

#form2 {display: none; margin: 0px auto; width: 40%; margin-top: 2%;}
.validate {width: 100%; margin: 0px auto; font-family: "Arial"; color: white; border: 2px solid rgba(255,255,255,0.5);}
#code {width: 100%; height: 30px; padding-left: 10px; border: none; background-color: rgba(255,255,255,0); color: white;}
#code::placeholder {color: white;}
#checkCode {color: white; width: 100%; height: 30px; border: none; background-color: rgba(255,255,255,0); text-align: center; padding-top: 4px;}
#code_check2 {width: 100%; height: 30px; padding-left: 10px; border: none; background-color: rgba(255,255,255,0); text-align: center; font-wieght: bold;}
#hi {width: 100%; height: 40px; font-size: 13pt; border: 2px solid rgba(255,255,255,0); background-color: rgba(255,255,255,0.3); color: white; border-radius: 4px 4px 4px 4px;}
#hi:hover {border: 2px solid rgba(255,255,255,0.5); background-color: rgba(255,255,255,0); font-weight: bold;}
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
	int res = getRandom();
%>
	<form action="javascript:getemail()" method="post" id="form" >
		<!-- 서브밋 버튼을 누리면 getemail()함수 실행 form태그 안에 있는 값을 전부 들고감 -->
		<input type="hidden" name="command" value="findpw">
		<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=res%>">
		
		<div>
			<h2>PW 찾기</h2>
	
			<table class="border">
				<tr>
					<td class="formx"></td>
					<td colspan="2"></td>
					<td class="formx"></td>
				</tr>
				<tr>
					<td class="formx"></td>
					<th>ID</th>
					<td><input type="text" required="required" id="id" name="id" placeholder="ID를 입력하세요"></td>
					<td class="formx"></td>
				</tr>
				<tr>
					<td class="formx"></td>
					<th>NAME</th>
					<td><input type="text" required="required" id="name" name="name" placeholder="이름을 입력하세요" ></td>
					<td style="width: 30px !important;"></td>
				</tr>
				<tr>
					<td class="formx"></td>
					<th>EMAIL</th>
					<td><input type="text" id="email" required="required" name="email" placeholder="email을 입력하세요"></td>
					<td class="formx"></td>
				</tr>
				<tr>
					<td class="formx"></td>
					<td colspan="2"><input id="submitbtn" type="submit" value="인증하기"></td>
					<td class="formx"></td>
				</tr>
				<tr>
					<td class="formx"></td>
					<td colspan="2"></td>
					<td class="formx"></td>
				</tr>
			</table>
		</div>
	</form> 
	
	<!-- getemail() 비동기가 실행됐을 때 block 될 폼 -->
	<form id="form2" action="javascript:getId()">
	<!-- 서브밋을 눌렀을 때 getId() 함수 실행 -->
		<table class="validate">
			<tr>
				<td class="formx"></td>
				<td colspan="4"></td>
				<td class="formx"></td>
			</tr>
			<tr>
				<td class="formx"></td>
				<th>인증번호</th>
				<td><input style="width: 100%;" type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요."></td>
				<td><div id="checkCode"></div></td>
				<td><input type="hidden" readonly="readonly" name="code_check2" id="code_check2" value=""></td>
				<td class="formx"></td>
			</tr>
			<tr>
				<td class="formx"></td>
				<td colspan="4"><input id="hi" class="submitbtn" type="hidden" value="인증하기"></td>
				<td class="formx"></td>
			</tr>
			<tr>
				<td class="formx"></td>
				<td colspan="4"></td>
				<td class="formx"></td>
			</tr>
		</table>
	</form>
	
</section>
	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	function getemail() {
		$.ajax({
			url : "LoginCrudController" + getParameterEmail(),
			success : function(data) {
				alert("입력하신 메일로 인증번호를 보냅니다.\n인증번호를 알맞게 입력해주세요!");
				$("#form2").css("display", "block");
			}, 
			error : function() {
				alert("연결실패");
			}
		});
	}
	
	function getParameterEmail() {
		var email = "?command=findpw&email=" + $("#email").val() + "&code_check=" + $("#code_check").val();
		return email;
	}
	
	function sendnum() {
		var email = document.getElementById("email").value;
		var id = document.getElementById("id").value;
		var name = document.getElementById("name").value;
		location.href = "LoginCrudController?command=searchpw&email=" + email + "&id=" + id + "&name=" + name;
	}
	
	function getId() {
		var id = document.getElementById("id").value;
		$.ajax({
			url : "LoginCrudController" + getParameterValues(),
			type : "POST",
			dataType : "text",
			success : function(data) {
				if(data == "2") {
					alert("입력값이 존재하지 않습니다.");
					window.location = "fntlogincrudsearchpw.jsp";
				} else {
					alert("인증성공!\n 비밀번호를 변경 해주세요 ! \n ***비밀번호 변경 페이지로 이동합니다***");					
					window.location = "LoginCrudController?command=updatepw&memberid=" + id;
				}
			}, 
			error : function() {
				alert("연결실패");
			}
		});
	}
		
	function getParameterValues() {
		var queryString = "?command=real2&email=" + $("#email").val() + "&id=" + $("#id").val();
		// 우리가 써준 이메일을 받아옴
		// 이유는 이메일을 받아와서 dao를 실행해서 id가 존재하는지 안하는지 알기위해 넘겨줌!
		return queryString;
	}
	
	function checkCode() {
		var v1 = form2.code_check2.value = <%=res%>;
		// 코드check2의 벨류에 우리가 발생시킨 난수를 넣어줄거임 (hidden)
		
		var v2 = form2.code.value;
		// 사용자가 입력한 인증번호
		
		if(v1 != v2) {
			//document.getElementById("checkCode").style.color = "red";
			document.getElementById("checkCode").innerHTML = "&nbsp;&nbsp;잘못된 인증 번호";
			// 우리가 발생시킨 난수랑 사용자가 입력한 숫자랑 다르면 div태그에 빨간 글씨로 뿌려줘라
			
			makeNull();
			//그리고 이 함수 실행
		} else {
			//document.getElementById("checkCode").style.color = "blue";
			document.getElementById("checkCode").innerHTML = "&nbsp;&nbsp;인증되었습니다";
			// 사용자가 입력한 인증번호를 한글자씩 치면서 
			// 우리가 발생시킨 난수와 일치가 되는순간.!
			// 인증되었습니다 라고 div태그에 써주고
			// 이 함수를 실행한다
			makeReal();
		}
	}
		
	function makeReal() {
		var hi = document.getElementById("hi");
		hi.type = "submit";
	}

	function makeNull() {
		var hi = document.getElementById("hi");
		hi.type = "hidden";
		// 인증번호가 다르면 인증하기 버튼을 숨긴다.
	}
	
</script>
</body>
</html>