<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)ID 찾기</title>
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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
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
	// 내부적으로 비동기 실행시 랜덤함수가 두번실행돼서 
	// 하나의 변수에 담아서 비교했을때 값이 일치하게 만들어주기 위해
%>
		<form action="javascript:getemail()" method="post" id="form" >
		<!-- 서브밋 버튼을 누르면 getemail()함수 실행 form태그 안에있는 값을 전부 들고감 -->
		<input type="hidden" name="command" value="emailchk">
		<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=res%>">
		<div>
		<h2 align="center">ID 찾기</h2>
		<table class="border" style="width:100%">
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
				<th>NAME</th>
				<td>
					<input type="text" id="name" required="required" name="name" placeholder="이름을 입력하세요" >
				</td>
				<td></td>
			</tr>
			
			<tr>
			<td></td>
				<th>
				EMAIL
				</th>
				<td>
					<input type="text" id="email" required="required" name="email" placeholder="email을 입력하세요">
				</td>
				<td></td>
				
			</tr>
			
			<tr>
				<td></td>
				<td colspan="2">
					<input id="submitbtn" type="submit"  value="인증번호 발송">
				</td>
				<td></td>	
			</tr>
			
			<tr><td></td><td></td><td></td><td></td></tr>
		</table>
		</div>
		</form>
		
		
		<!-- getemail() 비동기가 실행됐을때 block될 폼 -->
		<form id="form2" action="javascript:getId()" id="form">
		<!-- 서브밋을 눌럿을때 getId()함수 실행 -->
			<table style="margin-top: 550px; margin-left: 35%;">
				<tr>
				<th>인증번호</th>
				<td><input style="width: 92%;" type="text" name="code" id="code"
						onkeyup="checkCode()" placeholder="인증번호를 입력하세요.">
						<!-- onkeyup은 input에 한글자입력시 계속 실행되는 함수 입력할때마다 -->
						
						</td>
						<td><div id="checkCode"></div></td>
						
				<td><input type="hidden" readonly="readonly" name="code_check2"
						id="code_check2" value=""></td>		
			</tr>
			
			<tr>
			<td colspan="2">
		<input id="hi"  class="submitbtn" type="hidden" value="인증하기">
		<!-- <input type="button" value="검색하기" onclick="sendnum()"> -->
		<!-- 여기 히든 바꾸고 디스플레이 논으로 돌리기 -->
		</td>
		</tr>
		</table>
	
		</form>
		</section>
	
	<script type="text/javascript">
		function sendnum(){
			var email = document.getElementById("email").value;
			var name = document.getElementById("name").value;
			location.href = "LoginCrudController?command=searchid&email="+email+"&name="+name;
		}
		
		
		
		
		function getParameterEmail() {
			var email = "?command=emailchk&email=" + $("#email").val() + "&code_check=" + $("#code_check").val();
			return email;
			// ? 붙인 이유는 컨트롤러? 붙이듯이 붙여주기위해 ?를 붙임
			// command를 선언하고
			// 사용자가 입력한 이메일 값 받아오고
			// 히든에 발생한 난수를 가져옴
		}
		
		
		function getemail() {
			$.ajax({
				url : "LoginCrudController" + getParameterEmail(),
				// ajax는 성공했을때 데이터를 받아와야함
				// 그 데이터가 function안에 있는 data로 들어가게 됨
				// ajax는 url이 실행되고나서 out.print로 값을 안보내주면 실패한다.
				success : function(data) {
					alert("입력하신 메일로 인증번호를 보냅니다.\n인증번호를 알맞게 입력해주세요!");
					$("#form2").css("display", "block");
					// 성공한 순간 인증번호를 입력할수있는 폼을 보여줌
				}, error:function() {
					alert("연결실패");
				}
			})
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
		
		
		function getParameterValues(){
			var queryString = "?command=real&email=" + $("#email").val() + "&name="+ $("#name").val();
			// 우리가 써준 이메일을 받아옴
			// 이유는 이메일을 받아와서 dao를 실행해서 id가 존재하는지 안하는지 알기위해 넘겨줌!
		return queryString;
		}
		
		
		function getId(){
			$.ajax({
				url : "LoginCrudController" + getParameterValues(),
				dataType : "text",
				success : function(data){
					//alert("Id는"+data.id+"입니다.");
					if(data == "1") {
						alert("존재하지 않는 아이디입니다.");
						window.location="fntlogincrudsearchid.jsp";
					} else {
						alert("인증성공!\n 아이디 : " +data+ "\n로그인 페이지로 이동합니다.");
						window.location="fntlogincrud.jsp";
						
					}
					}, error:function(){
						alert("연결실패");
					}
				});
			}
		
	</script>
	 




</body>
</html>