<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)이메일확인</title>
<link href="css/section2.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin: 0px; padding: 0px;}
section {margin: 0px; padding: 0px;}
table {margin: 0px auto; float: center; width: 80%;}
#code {}
#checkCode {}
#code_check {}
#hi {}
</style>
</head>
<body>
<section>
<%
	String email = (String)request.getAttribute("email");
%>
	<form id="form2" action="javascript:getId()">
	<input type="hidden" id="email" value="<%=email %>"/>
	
		<table>
			<tr>
				<td>인증번호</td>
			</tr>
			<tr>
				<td>
					<input type="text" name="code" id="code" onkeyup="checkCode();" placeholder="인증번호를 입력하세요.">
					<div id="checkCode"></div>
				</td>
			</tr>
			<tr>	
				<td><input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=request.getAttribute("code")%>"></td>		
			</tr>
			<tr>
				<td><input id="hi" type="hidden" value="인증하기"></td>
			</tr>
		</table>
		
	</form>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

	function checkCode() {
		var v1 = form2.code_check.value;
		var v2 = form2.code.value;
		
		if(v1 != v2) {
			document.getElementById("checkCode").style.color = "red";
			document.getElementById("checkCode").innerHTML = "잘못된 인증 번호";
			
			makeNull();
			
		} else {
			document.getElementById("checkCode").style.color = "blue";
			document.getElementById("checkCode").innerHTML = "인증되었습니다";
		
			makeReal();
		}
	}
	
	function makeReal() {
		var hi = document.getElementById("hi");
		hi.type="submit";
	}

	function makeNull() {
		var hi = document.getElementById("hi");
		hi.type="hidden";
	}	
		
	function getParameterValues() {
		var queryString = "?command=real&email=" + $("#email").val();
		return queryString;
	}
			
	function getId() {
		$.ajax({
			url : "LoginCrudController" + getParameterValues(),
			dataType : "json",
			success : function(data) {
				//alert("Id는"+data.id+"입니다.");
				alert("인증성공!\n 로그인 페이지로 이동합니다.");
				window.location = "fntmain.jsp";
				}, 
				
			error:function() {
				alert("연결실패");
			}
		});
	}
	
</script>
</section>
</body>
</html>