<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT - Sign Up</title>
<link href="css/fntsignupform.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript">

	function validate() {
		// id, pw 형식
		var re = /^[a-zA-Z0-9]{6,12}$/
		
		// email 형식
		var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
		
		var memberid = document.getElementById("memberid");
		var memberpw = document.getElementById("memberpw");
		var memberemail = document.getElementById("memberemail");
		
		// id 형식 유효성
		if (!check(re,memberid,"ID는 영문/숫자 6~12자 이내로 작성해주세요!")) {
			return false;
		}
		
		// pw 형식 유효성
		if (!check(re,memberpw,"Password는 영문/숫자 6~12자 이내로 작성해주세요!")) {
			return false;
		}
		
		// pw, pwchk 대조 유효성
		if (signup.memberpw.value != signup.memberpw.value) {
			alert("Password가 일치하지 않습니다! 다시 확인해주세요!");
			signup.memberpw.value = "";
			signup.memberpw.focus();
			return false;
		}
		
		// email 형식 유효성
		if (!check(re2,memberemail,"이메일 형식이 적합하지 않습니다!")) {
			return false;
		}
		
	}
</script>
</head>
<body>

	<div class="fnt_logo">
		<img src="./img/fnt_logo.png"/>
	</div><br/><br/>
	
	<form name="signup" onsubmit="return validate();" action="notice.do?command=signup" method="post">
		<table>
			<tr>
				<td colspan="2" align="left"><p>* 반드시 모든 항목을 작성완료하셔야만 정상 가입됩니다 :)</p></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" id="memberid" name="memberid" placeholder="ID를 입력해주세요. (영문/숫자 포함 6~12자 이내)" maxlength="10" required="required"/></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" id="memberpw" name="memberpw" placeholder="비밀번호를 입력해주세요. (영문/숫자 포함 6~12자 이내)" maxlength="16" required="required"/></td>
			</tr>
			<tr>
				<th>Password Check</th>
				<td><input type="password" id="memberpwchk" name="memberpwchk" placeholder="비밀번호를 다시 한 번 입력해주세요." maxlength="16" required="required"/></td>
			</tr>
			<tr>
				<th>Nickname</th>
				<td><input type="text" id="membernickname" name="membernickname" placeholder="사용하실 닉네임을 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" id="membername" name="membername" placeholder="이름을 입력해주세요." maxlength="10" required="required"/></td>
			</tr>
			<tr>
				<th>Birthday</th>
				<td><input type="date" id="memberbirth" name="memberbirth" required="required"/></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type="tel" id="memberphone" name="memberphone" placeholder="전화번호를 입력해주세요. (ex. '010-0000-0000')" required="required"/></td>
			</tr>
			<tr>
				<th>Address</th>
				<td><input type="text" id="memberaddr" name="memberaddr" placeholder="거래 시 배송지로 이용될 주소지를 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" id="memberemail" name="memberemail" placeholder="이메일을 입력해주세요." required="required"/></td>
			</tr>
		</table><br/>
		<button id="resetbtn" type="reset">RESET</button>
		<button id="submitbtn" type="submit">Sign Up</button>
	</form>

</body>
</html>