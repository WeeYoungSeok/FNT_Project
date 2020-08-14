<%
response.setHeader("pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","No-store");
response.setDateHeader("Expires",1L);
%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<meta charset="UTF-8">
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<%
	MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
%>

	<header>
	
		<div id="headerzone">
		<!-- 로고 -->
		<img class="fnt_logo" src="./img/fnt_logo_main.png" onclick="location.href='fntmain.jsp'"/>
				
		<!-- 통합검색 -->
		<form id="searchzone" action="dealboard.do" method="post">
			<input type="hidden" name="categorylist" value="CHECK">
			<input type="hidden" name="orderlist" value="D">
			<input type="hidden" name="command" value="searchdeal">
			<input type="text" name="searchdeal" id="searchdeal" required="required" placeholder="구매글 및 판매글만 검색 가능합니다.">		
			<span>
				<button class="headerbtn" type="submit">검색</button>
			</span>
		</form>
	
		<span class="mysection">
		<script type="text/javascript">
		//채팅방 만드는 함수

		function chatGo() {
			open("https://qclass.iptime.org:8443/FNT_Project/fntstreaming.jsp","","width=2000, height=800");
		}
		</script>
			<!-- 마이페이지 -->
				<%
				if(memberdto != null) {
			%>
				<p id="loginmsg"><b onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'"><%=memberdto.getMembernickname() %></b>님<br/>환영합니다!</p>
				<%
					if(memberdto.getMemberrole().equals("USER")){
				%>
				<script type="text/javascript">
					function newpop(url, name){
						var memberid = '<%=memberdto.getMemberid()%>';
						var url = "fntalert.jsp?memberid=" + memberid;
						var option = "width=450, height=550";
						
						open(url, "", option);
					}
				</script>

				<!-- 알림 -->
				<img class="alertbell" alt="alert" src="./img/bell.png" onclick="javascript:newpop();"/>
				<button class="headerbtn" onclick="location.href='LoginCrudController?command=logout'">Sign Out</button>
				<button class="headerbtn" onclick="chatGo();">Chat</button>
				<%
					} else {
				%>
						<button class="headerbtn" onclick="location.href='LoginCrudController?command=logout'">Sign Out</button>
				<%
					}
				} else {
			%>
				<button class="headerbtn" onclick="location.href='fntlogincrud.jsp'">Sign In</button>
			<%
				}
			%>
		</span>
		</div>
	</header>
