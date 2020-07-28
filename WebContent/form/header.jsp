<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%
	MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
%>
	<header>
		
		<div id="headerzone">
		
		<!-- 로고 -->
		<img class="fnt_logo" src="./img/fnt_logo.png" onclick="location.href='fntmain.jsp'"/>
				
		<!-- 통합검색 -->
		<form id="searchzone" action="dealboard.do" method="post">
			<input type="hidden" name="command" value="searchdeal">
			<input type="text" name="searchdeal" id="searchdeal" required="required" placeholder="구매글 및 판매글만 검색 가능합니다.">		
			<span>
				<button class="headerbtn" type="submit">검색</button>
			</span>
		</form>
	
		<span class="mysection">
			<!-- 마이페이지 -->
			<%
				if(memberdto != null) {
			%>
				<p id="loginmsg"><a href="mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>"><%=memberdto.getMembernickname() %></a>님<br/>환영합니다!</p>
				<button class="headerbtn" onclick="location.href='LoginCrudController?command=logout'">logout</button>
				<%
					if(memberdto.getMemberrole().equals("USER")){
				%>
				<script type="text/javascript">
					function newpop(url, name){
						var memberid = "<%=memberdto.getMemberid()%>";
						window.open(url + "&memberid=" + memberid, name, "width=400, height=600");
					}
				</script>
				<a href="javascript:newpop('mypage.do?command=alert', 'name');">
				<% 
					// alert == null
				%>
					<img class="alertbell" alt="alert" src="./img/bell.png"/>
				<%
					// alert != null
				%>
					<img class="alertbell" alt="alert" src="./img/bell_a.png"/>
				</a>
				<%
					}
				} else {
			%>
				<button class="headerbtn" onclick="location.href='fntlogincrud.jsp'">로그인</button>
				<!-- 알림 -->
			<%
				}
			%>
			
			<!-- 번역 -->
			<button id="trans" onclick="">KO/EN</button>
			
		</span>
		</div>
		
	</header>
	

</body>
</html>