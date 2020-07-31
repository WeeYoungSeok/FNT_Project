<%@page import="com.google.gson.JsonObject"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
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
<meta charset="UTF-8">
<title>FNT - Sign Up</title>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<script src="./js/fntsignupform.js"></script>
<link href="css/fntsignupform.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	<div class="topbar">
		<a href="fntmain.jsp">
			<img id="fnt_logo" alt="FNT" src="./img/fnt_logo.png">
		</a>	
	</div>
	
	<br/><br/>
	
	<form action="signup.do" id="form" name="form" method="post" >
		<input type="hidden" name="command" value="signupform"/>
		<input type="hidden" value="" name="IDCHK" id="IDCHK"/>
		<input type="hidden" value="" name="NICKCHK" id="NICKCHK"/>
		<input type="hidden" value="" name="real" id="real"/>
		<input type="hidden" readonly="readonly" name="code_check" id="code_check" value="<%=res%>">
		<table>
			<col width="200">
			<col width="500">
			<col width="140">
			<tr><td colspan="3" align="left"><p>* 반드시 모든 항목을 작성완료하셔야만 정상 가입됩니다 :)</p></td></tr>
			<tr>
				<th>ID</th>
				<td><input class="IdChk" type="text" id="id" name="memberid" placeholder="ID를 입력해주세요. (영문/숫자 포함 10자 이내)" maxlength="10" title="n" required="required"/></td>
				<td><input type="button" id="idchkbtn" class="in_btn" onclick="search_id('signup.do?command=idchk','idchk');" value="ID 중복"></td>
			</tr>
			<tr>
				<th>Password</th>
				<td colspan="2"><input class="Pw" type="password" name="memberpw" placeholder="비밀번호를 입력해주세요. (영문/숫자 포함 6~16자 이내)" maxlength="16" required="required"/></td>
			</tr>
			<tr>
				<th>Password Check</th>
				<td colspan="2"><input class="PwChk" type="password" name="memberpwchk" placeholder="비밀번호를 다시 한 번 입력해주세요." maxlength="16" required="required"/></td>
			</tr>
			<tr>
				<th>Nickname</th>
				<td><input class="NickChk" id="nick" type="text" name="membernickname" placeholder="사용하실 닉네임을 입력해주세요. (한글 6자 이내)" required="required"/></td>
				<td><input type="button" id="nickchkbtn" class="in_btn" onclick="search_nick('signup.do?command=nickchk','nickchk');" value="Nickname 중복"></td>
			</tr>
			<tr>
				<th>Name</th>
				<td colspan="2"><input type="text" name="membername" placeholder="성함을 입력해주세요." maxlength="10" required="required"/></td>
			</tr>
			<tr>
				<th>Birthday</th>
				<td colspan="2"><input type="date" name="memberbirth" placeholder="생년월일(YYYYMMDD)을 입력해주세요. (ex.'20200101')" maxlength="8" required="required"/></td>
			</tr>
			<tr>
				<th>Phone</th>
				<td colspan="2"><input type="tel" name="memberphone" placeholder="'-'를 사용해서 전화번호를 입력해주세요. (ex.'010-0000-0000')" maxlength="13" required="required"/></td>
			</tr>
			<tr>
				<th>Address</th>
				<td><input type="text" class="memberaddr" name="memberaddr" placeholder="거래 시 배송지로 이용될 도로주소를 입력해주세요." required="required" onclick="juso();"/></td>
				<td><input type="button" value="도로명주소 검색" class="in_btn" onclick="juso();"/></td>
			</tr>
			<tr>
				<th>Email</th>
				<td><input type="email" name="memberemail" id="email" placeholder="이메일을 입력해주세요." required="required" value=<%= ((JsonObject) request.getAttribute("profileJson")).get("email") %>/></td>
				<td><input type="button" class="in_btn" onclick="emailReal('signup.do?command=emailchk','Email Validation');" value="Email 인증"></td>
			</tr>
		</table><br/>
		<button id="resetbtn" type="reset">RESET</button>
		<button id="submitbtn" type="submit">Sign Up</button>
	</form>

</body>
</html>