<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)PW 찾기</title>
<link href="css/fntsignupform.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
	#form2 {
	display: none;
}
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
	margin-left: 25%;
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
	int res = getRandom();
%>
		<form action="javascript:getemail()" method="post" id="form" >
		<!-- 서브밋 버튼을 누리면 getemail()함수 실행 form태그 안에 있는 값을 전부 들고감 -->
		<input type="hidden" name="command" value="findpw">
		<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=res%>">
		<div>
		<h2 align="center" style="font-family: Arial;">PW 찾기</h2>
		<table class="border" style="width: 100%;">
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
				<th>ID</th>
				<td>
					<input type="text" required="required" id="id" name="id" placeholder="ID를 입력하세요">
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<th>NAME</th>
				<td>
					<input type="text" required="required" id="name" name="name" placeholder="이름을 입력하세요" >
				</td>
				<td></td>
			</tr>
			<tr>
				<td></td>
				<th>EMAIL</th>
				<td>
					<input type="text" id="email" required="required" name="email" placeholder="email을 입력하세요">
				</td>
				<td></td>
			</tr>
			<tr>
			<td></td>
				<td colspan="2">
					<input id="submitbtn" type="submit" value="인증하기">
				</td>
				<td></td>
			</tr>
			<tr><td></td><td></td><td></td><td></td></tr>
		</table>
		</div>
		</form> 
		<!-- getemail() 비동기가 실행됐을 때 block 될 폼 -->
		<form id="form2" action="javascript:getId()">
		<!-- 서브밋을 눌렀을 때 getId() 함수 실행 -->
			<table style="margin-top: 550px; margin-left: 35%;">
				<tr>
					<th>인증번호</th>
				
				
					<td><input style="width: 92%;" type="text" name="code" id="code" onkeyup="checkCode()" placeholder="인증번호를 입력하세요.">
						</td>
						<td><div id="checkCode"></div></td>
						
						<td><input type="hidden" readonly="readonly" name="code_check2" id="code_check2" value=""></td>
				</tr>
			<tr>
			<td colspan="2">
			<input id="hi"  class="submitbtn" type="hidden" value="인증하기">
			</td>
			</tr>
			</table>
		</form>
	</section>
	
	<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script type="text/javascript">
		function getemail(){
			$.ajax({
				url : "LoginCrudController" + getParameterEmail(),
				success : function(data){
					alert("입력하신 메일로 인증번호를 보냅니다.\n인증번호를 알맞게 입력해주세요!");
					$("#form2").css("display", "block");
				}, error : function(){
					alert("연결실패");
				}
			});
		}
		function getParameterEmail(){
			var email = "?command=findpw&email=" + $("#email").val()+ "&code_check=" + $("#code_check").val();
			return email;
		}
		function sendnum(){
			var email = document.getElementById("email").value;
			var id = document.getElementById("id").value;
			var name = document.getElementById("name").value;
			location.href="LoginCrudController?command=searchpw&email="+email+"&id="+id+ "&name="+name;
		}
		
		function getId(){
			var id = document.getElementById("id").value;
			$.ajax({
				url : "LoginCrudController" + getParameterValues(),
				type : "POST",
				dataType : "text",
				success : function(data){
					if(data == "2"){
						alert("입력값이 존재하지 않습니다.");
						window.location="fntlogincrudsearchpw.jsp";
					} else {
						alert("인증성공!\n 비밀번호를 변경 해주세요 ! \n ***비밀번호 변경 페이지로 이동합니다***");
						
						window.location="LoginCrudController?command=updatepw&memberid="+ id;
					}
				}, error:function(){
					alert("연결실패");
				}
			});
		}
		
		
		function getParameterValues(){
			var queryString = "?command=real2&email=" + $("#email").val()+"&id="+ $("#id").val();
			// 우리가 써준 이메일을 받아옴
			// 이유는 이메일을 받아와서 dao를 실행해서 id가 존재하는지 안하는지 알기위해 넘겨줌!
		return queryString;
		}
		
		
		function checkCode(){
			var v1 = form2.code_check2.value = <%=res%>;
			// 코드check2의 벨류에 우리가 발생시킨 난수를 넣어줄거임 (hidden)
			
			var v2 = form2.code.value;
			// 사용자가 입력한 인증번호
			
			if(v1 != v2){
				document.getElementById("checkCode").style.color = "red";
				document.getElementById("checkCode").innerHTML = "&nbsp;&nbsp;잘못된 인증 번호";
				// 우리가 발생시킨 난수랑 사용자가 입력한 숫자랑 다르면 div태그에 빨간 글씨로 뿌려줘라
				
				makeNull();
				//그리고 이 함수 실행
			}else {
				document.getElementById("checkCode").style.color = "blue";
				document.getElementById("checkCode").innerHTML = "&nbsp;&nbsp;인증되었습니다";
				// 사용자가 입력한 인증번호를 한글자씩 치면서 
				// 우리가 발생시킨 난수와 일치가 되는순간.!
				// 인증되었습니다 라고 div태그에 써주고
				
				// 이 함수를 실행한다
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
</body>
</html>