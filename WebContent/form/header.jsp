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
	<form action="dealboard.do" method="post">
		<input type="hidden" name="command" value="searchdeal">
		
		<input type="text" name="searchdeal" id="searchdeal" required="required" placeholder="구매 및 판매글만 검색 가능합니다.">		
		<span><input type="submit" value="검색"></span>
	</form>
	
		<span class="mysection">
			<!-- 마이페이지 -->
			<!-- <a href=""></a> -->
			<%
				if(memberdto != null) {
			%>
				<p><a href="mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>"><%=memberdto.getMembernickname() %></a>님 환영합니다.</p>
				<button onclick="location.href='LoginCrudController?command=logout'">logout</button>
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
					<img id="alertbell" alt="alert" src="./img/bell.png"/>
				</a>
				<%
					}
				} else {
			%>
				<button onclick="location.href='fntlogincrud.jsp'">로그인</button>
				<!-- 알림 -->
			<%
				}
			%>
			
			
			<!-- 번역 -->
			<a id="trans" href="">KO/EN</a>
			
		</span>
		
		<!-- 로고 -->
		<div class="fnt_logo">
			<img src="./img/fnt_logo.png" onclick="location.href='fntmain.jsp'"/>
		</div>
		
	</header>
	

</body>
</html>