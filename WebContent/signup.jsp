<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="css/fntsignupform.css" rel="stylesheet" type="text/css"/>
</head>
<body>

	<div class="fnt_logo">
		<img src="./img/fnt_logo.png"/>
	</div><br/>
	
	<form action="" method="post">
		<table>
			<tr>
				<td colspan="2" align="left"><p>* 반드시 모든 항목을 작성하셔야만 정상 가입됩니다 :)</p></td>
			</tr>
			<tr>
				<th>ID</th>
				<td><input type="text" name="memberid" placeholder="ID를 입력해주세요. (영문/숫자 포함 10자 이내)" required="required"/></td>
			</tr>
			<tr>
				<th>Password</th>
				<td><input type="password" name="memberpw" placeholder="비밀번호를 입력해주세요. (영문/숫자 포함 16자 이내)" required="required"/></td>
			</tr>
			<tr>
				<th>Password Check</th>
				<td><input type="password" name="memberpwchk" placeholder="비밀번호를 다시 한 번 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Nickname</th>
				<td><input type="text" name="membernickname" placeholder="사용하실 닉네임을 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Name</th>
				<td><input type="text" name="membername" placeholder="이름을 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Birthday</th>
				<td><input type="text" name="membernickname" placeholder="생년월일을 입력해주세요. (ex. '20200811')" required="required"/></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td><input type="text" name="memberphone" placeholder="전화번호를 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Address</th>
				<td><input type="text" name="memberaddr"placeholder="거래 시 배송지로 이용될 주소지를 입력해주세요." required="required"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="text" name="memberemail" placeholder="이메일을 입력해주세요." required="required"/></td>
			</tr>
		</table><br/>
		
		<button type="submit">Sign Up</button>
	</form>

</body>
</html>