<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>
<meta charset="UTF-8">
<link href="css/aside.css" rel="stylesheet" type="text/css"/>
	<aside onmouseover="open_menu();" onmouseout="close_menu();">
		<div id="menutitle">MENU</div>
		<div id="menubars">
			<div class="menubar"><p class="mtext" onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p class="mtext" onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
	<script type="text/Javascript">

	function open_menu() {
		document.getElementById("menubars").style.display="block";
	}
	
	function close_menu() {
		document.getElementById("menubars").style.display="none";
	}

	</script>