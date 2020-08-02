<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	NoticeBoardDto noticeboardlistone = (NoticeBoardDto)request.getAttribute("noticeboardlistone");
%>
<title>FNT(Feel New Item) : <%=noticeboardlistone.getNbtitle() %></title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">

aside {position: fixed; align: left; width: 14%; height: 100%; box-shadow: 1px 0px 6px black; z-index: 2;}

#menubars {margin-top: 50%; height: 62%;}
.menubar {padding-top: 12%; background-color: black; color: white; width: 100%; height: 10%; text-align: left; font: 16pt "Arial"; font-weight: bold; cursor: pointer; opacity: 0.4;}
.menubar > p {padding-left: 10%;}
.menubar:hover {opacity: 0.6;}
.menubar_x {background-color: black; width: 100%; height: 100%; opacity: 0.4;}
 
#nboard {margin-top: 6%; margin-bottom: 6%;}

h1 {margin-top: 6%; font-family: "Arial"; text-align: center; margin-bottom: 2%;}
	
table {margin: 0 auto; width: 80%; height: auto; font-family: "Arial";}
	
#tolist {cursor: pointer;}
#tolist:hover {font-weight: bold;}

th {font-size: 14pt; width: 100px; height: 30px; background-color: #dddddd; font-weight: bold; padding-top: 2px;}

td {font-size: 12pt; padding-left: 10px; background-color: #f9f9f9;}
 
#nlistlast {background-color: #dddddd; height: 2px;}

#btnline {background-color: white;}
#btnbox {margin-top: 4px; float: right; display: flex;}
#nbbtn {width: 50px; height: 26px; border: none; margin-left: 10px; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc;}
#nbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
 
</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<aside>
		<div id="menubars">
			<div class="menubar" style="opacity:0.7;"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	
	<section>
		<div id="nboard">
		<h1>공지사항</h1>
		<table> 
			<tr>
				<th>게시판</th>
				<td id="tolist" onclick="location.href='notice.do?command=notice'">공지사항</td>
				<th>작성자</th>
				<td><%=noticeboardlistone.getNbnickname() %></td>
			<tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=noticeboardlistone.getNbtitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="4" width="800" height="360"><%=noticeboardlistone.getNbcontent() %></td>
			</tr>
		<%
			if(memberdto == null) {
		%>
		<%
			} else if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
		<tr><td colspan="4" id="nlistlast"></td></tr>
		<tr>
			<td align="right" colspan="4" id="btnline">
				<div id="btnbox">
					<button id="nbbtn" onclick="location.href='notice.do?command=noticeupdate&nbboardno=<%=noticeboardlistone.getNbboardno()%>'">수정</button>
					<button id="nbbtn" onclick="location.href='notice.do?command=noticedelete&nbboardno=<%=noticeboardlistone.getNbboardno()%>'">삭제</button>
				</div>
			</td>
		</tr>
		<%
			} else if (memberdto.getMemberrole().equals("USER")) {
		%>
		<%
			}
		%>
		</table></div>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>