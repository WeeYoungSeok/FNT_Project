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
<title>FNT(Feel New Item)로그인 페이지</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script src="${pageContext.request.contextPath }/js/kakao.min.js"></script>

<script type="text/javascript">
Kakao.init('290f8b616802bba9fad591226e4dab51');
	
// 카카오 소셜 로그인
	function loginWithKakao() {
		Kakao.Auth.login({
			success: function(authObj) {
				location.href = '${pageContext.request.contextPath}/kakaosignup.do?access_token=' + authObj.access_token;
			},
			fail: function(err) {
				alert(JSON.stringify(err))
		},
	})}
	
</script>

<link href="css/fntlogincrud.css" rel="stylesheet" type="text/css"/>
<%
    String clientId = "T0e_dO0FJagJxo8igTCZ";
    String redirectURI = URLEncoder.encode("http://127.0.0.1:8787/FNT_Project/naversignup.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
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
		<col width="40">
		<col width="100">
		<col width="100">
		<col width="200">
		<col width="40">
		<tr><td class="ltablex"></td><td colspan="3"></td><td class="ltablex"></td></tr>
		<tr style="text-align:center;"><td colspan="5" style="padding-bottom:12px;"><b style="font-size:26pt; font-family:'Arial';">Log In</b></td></tr>
		<tr>
			<td class="ltablex"></td>
			<th>ID</th>
			<td colspan="2"><input type="text" name="id" required="required" placeholder="ID를 입력하세요."></td>
			<td class="ltablex"></td>
		</tr>
		<tr>
			<td class="ltablex"></td>
			<th>PW</th>
			<td colspan="2"><input type="password" name="pw" required="required" placeholder="Password를 입력하세요."></td>
			<td class="ltablex"></td>
		</tr>
		<tr>
			<td class="ltablex"></td>
			<td colspan="2">
				<button class="login_btn" type="submit">로그인</button>
			</td>
			<td>
				<button class="login_btn" type="button" onclick="location.href='fntsignupform.jsp'">회원가입</button>
			</td>
			<td class="ltablex"></td>
		</tr>
		
		<tr>
			<td class="ltablex"></td>
			<td colspan="3" style="text-align:center;">
				<pre><b id="findbtn" onclick="location.href='LoginCrudController?command=logincrudsearchid'">ID로 찾기</b> / <b id="findbtn" onclick="location.href='LoginCrudController?command=logincrudsearchpw'">PW로 찾기</b></pre>
			</td>
			<td class="ltablex"></td>
		</tr> 
		<tr>
			<td class="ltablex"></td>
			<td colspan="2"><!-- navers -->
				<a href="<%=apiURL%>"><img id="naver_id_login" height="50" src="img/naver_btn.png"/></a>
			</td>
			<td><!-- 카카오 -->
				<a><img id="kakao_id_login" src="img/kakao_btn.png" height="50" onclick="javascript:loginWithKakao()"/></a>
			</td>
			<td class="ltablex"></td>
		</tr>
		<tr><td class="ltablex"></td><td colspan="3"></td><td class="ltablex"></td></tr>
	</table>
	</form>
</body>
</html>	