<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT - Email Validation</title>
</head>
<body>
<%
	String res = (String)request.getAttribute("code");
%>
<script type="text/javascript">

	function checkCode() {
		var v1 = form2.code_check2.value = <%=res%>;
		// 코드check2의 벨류에 우리가 발생시킨 난수를 넣어줄거임 (hidden)
		
		var v2 = form2.code.value;
		// 사용자가 입력한 인증번호
		
		if (v1 != v2) {
			document.getElementById("checkCode").style.color = "red";
			document.getElementById("checkCode").innerHTML = "잘못된 인증 번호";
			// 우리가 발생시킨 난수랑 사용자가 입력한 숫자랑 다르면 div태그에 빨간 글씨로 뿌려줘라
			
			makeNull();
			//그리고 이 함수 실행
		} else {
			document.getElementById("checkCode").style.color = "blue";
			document.getElementById("checkCode").innerHTML = "인증되었습니다";
			// 사용자가 입력한 인증번호를 한글자씩 치면서 
			// 우리가 발생시킨 난수와 일치가 되는순간.!
			// 인증되었습니다 라고 div태그에 써주고
			
			// 이 함수를 실행한다
			makeReal();
		}
	}

	function makeReal() {
		var hi = document.getElementById("hi");
		hi.type="button";
	}
	
	function makeNull() {
		var hi = document.getElementById("hi");
		hi.type="hidden";
		// 인증번호가 다르면 인증하기 버튼을 숨긴다.
	}	
	
	function checkCompl() {
		opener.document.getElementById("real").value = "Y";
		self.close();
	}
</script>
<form id="form2" action="javascript:getId()">
		<!-- 서브밋을 눌럿을때 getId()함수 실행 -->
			<table>
			<tr>
				<td><span>인증번호</span></td>
				</tr>
				<tr>
				<td><input type="text" name="code" id="code"
						onkeyup="checkCode()" placeholder="인증번호를 입력하세요.">
						<!-- onkeyup은 input에 한글자입력시 계속 실행되는 함수 입력할때마다 -->
						
						<div id="checkCode"></div></td>
						
				<td><input type="hidden" readonly="readonly" name="code_check2"
						id="code_check2" value=""></td>		
			</tr>
		</table>
		<input id="hi" type="hidden" value="인증하기" onclick="checkCompl();">
		<!-- <input type="button" value="검색하기" onclick="sendnum()"> -->
	
		</form>
		
		
		
</body>
</html>