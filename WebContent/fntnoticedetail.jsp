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
*{margin: 0px;padding: 0px;}

#menutitle {padding-left:31% !important;}

#nboard {margin-top: 4%; margin-bottom: 2%; margin-left:10%;}
h1 {font-family:"Arial"; text-align:left; margin-left: 10%; color: white; margin-bottom: 1%;}
	
table {margin-left: 10%; width: 70%; height: auto; font-family: "Arial";}
	
#tolist {cursor: pointer;text-decoration:underline;}
#tolist:hover {font-weight: bold;}

th {font-size: 13pt; width: 100px; height: 30px; background-color: rgba(255,255,255,0.1);color: rgba(255,255,255,0.7); font-weight: bold; padding-top: 2px;}
td {font-size: 12pt; padding-left: 10px; color: white;}
 
#nlistlast {background-color: rgba(255,255,255,0.5); height: 2px;}

#btnline {background-color: white;}
#btnbox {margin-top: 4px; float: right; display: flex;}
#nbbtn {width: 50px; height: 26px; border: none; margin-left: 10px; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc;}
#nbbtn:hover {font-weight: bold; background-color: #bbbbbb;}
 
</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp"%>

	<section>
		<div id="nboard">
		<h1>공지사항</h1>
		<table> 
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr>
				<th>게시판</th>
				<td id="tolist" onclick="location.href='notice.do?command=notice'">공지사항</td>
				<th>작성자</th>
				<td><%=noticeboardlistone.getNbnickname() %></td>
			<tr>
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=noticeboardlistone.getNbtitle() %></td>
			</tr>
			<tr><td colspan="4" id="nlistlast"></td></tr>
			<tr>
				<th>내용</th>
				<td colspan="3" style="width:600; height:240px; padding-top:50px; padding-bottom:50px; overflow:auto;"><%=noticeboardlistone.getNbcontent() %></td>
			</tr>
		<%
			if(memberdto == null) {
		%>
		
			<tr><td colspan="4" id="nlistlast"></td></tr>
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