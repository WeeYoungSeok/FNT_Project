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
<script type="text/javascript"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<link href="js/fntsignupform.js" type="text/javascript">
</head>
<body>

	<div>
		<a href="fntmain.jsp">
			<img id="fnt_logo" alt="FNT" src="./img/fnt_logo.png">
		</a>	
	</div>
	
	<br/><br/>
	
	<form onsubmit="return validate();" action="signup.do?command=signup" method="post">
		<input type="hidden" name="command" value="signup">
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