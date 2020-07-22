<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<script type="text/javascript">
	
// 카카오 소셜 로그인
	
	// 웹 플랫폼 도메인 등 초기화한 앱의 설정이 그대로 적용 - 초기화 상태에 현재 도메인이 등록되지 않은 경우 에러 발생
	Kakao.init('290f8b616802bba9fad591226e4dab51')
	function loginWithKakao() {
		Kakao.Auth.login({
			success: function(authObj) {
				alert(JSON.stringify(authObj))
			},
			fail: function(err) {
				alert(JSON.stringify(err))
		},
	})}
	
</script>

<link href="css/fntlogincrud.css" rel="stylesheet" type="text/css"/>

</head>
<body>
	<div class="logo">
		<a href="fntmain.jsp">
			<img id="fnt_logo" alt="FNT" src="./img/fnt_logo.png">
		</a>	
	</div>
	<form action="LoginCrudController" method="post">
	<input type="hidden" name="command" value="login">
	<table>
		<tr>
			<th>ID</th>
			<td><input type="text" name="id" required="required" placeholder="ID를 입력하세요."></td>
		</tr>
		<tr>
			<th>PW</th>
			<td><input type="password" name="pw" required="required" placeholder="Password를 입력하세요."></td>
		</tr>
		<tr>
			<td colspan="2" align="center">
				<button class="login_btn" type="submit">로그인</button>
				<button class="login_btn" type="button" onclick="location.href='fntsignupform.jsp'">회원가입</button>
			</td>
		</tr>
		
		<tr>
			<td colspan="2">
				<input class="findbtn" type="button" value="ID 찾기 " onclick="location.href='LoginCrudController?command=logincrudsearchid'">
				<input class="findbtn" type="button" value="PW 찾기 " onclick="location.href='LoginCrudController?command=logincrudsearchpw'">

			</td>
		</tr> 
		<tr>
			<td colspan="2">
				<div class="social_login_btn">
					<!-- 네이버 -->
					<div id="naver_id_login"></div>
					
					<!-- 카카오 -->
					<img id="kakao_id_login" src="./img/login_btn_kakao.png" onclick="javascript:loginWithKakao()"/>
				</div>
			</td>
		</tr>
	</table>
	</form>

<%
	String clientId = "T0e_dO0FJagJxo8igTCZ";//애플리케이션 클라이언트 아이디값";
	String redirectURI = URLEncoder.encode("http://127.0.0.1:8787/FNT_Project/fntsignupform.jsp", "UTF-8");
	SecureRandom random = new SecureRandom();
	String state = new BigInteger(130, random).toString();
	String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
	apiURL += "&client_id=" + clientId;
	apiURL += "&redirect_uri=" + redirectURI;
	apiURL += "&state=" + state;
	session.setAttribute("state", state);
%>
<script type="text/javascript">

// 네이버 소셜 로그인

	var naver_id_login = new naver_id_login("T0e_dO0FJagJxo8igTCZ", "http://127.0.0.1:8787/FNT_Project/");
	var state = naver_id_login.getUniqState();
	naver_id_login.setButton("green", 12,40);
	naver_id_login.setDomain("http://127.0.0.1:8787/FNT_Project/");
	naver_id_login.setState(state);
	naver_id_login.setPopup();
	naver_id_login.init_naver_id_login();
	naver_id_login.self.close();
	
</script>


 

</body>
</html>