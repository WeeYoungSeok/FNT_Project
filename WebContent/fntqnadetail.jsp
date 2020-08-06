<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%
	QnaBoardDto qnaboardlistone = (QnaBoardDto)request.getAttribute("qnaboardlistone");
%>
<title>FNT(Feel New Item) : <%=qnaboardlistone.getQbtitle() %></title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
* {margin:0px; padding:0px;}

.menubar:nth-child(4) {opacity:0.7;}

#qboard {margin-top: 6%; margin-bottom: 6%;}

h1 {margin-top: 6%; font-family: "Arial"; text-align: center; margin-bottom: 2%;}
	
table {margin: 0 auto; width: 80%; height: auto; font-family: "Arial";}
	
#tolist {cursor: pointer;}
#tolist:hover {font-weight: bold;}

th {font-size: 14pt; width: 100px; height: 30px; background-color: #dddddd; font-weight: bold; padding-top: 2px;}

td {font-size: 12pt; padding-left: 10px; background-color: #f9f9f9;}
 
#qlistlast {background-color: #dddddd; height: 2px;}

#btnline {background-color: white;}
#btnbox {margin-top: 4px; float: right; display: flex;}
#qbbtn {width: 50px; height: 26px; border: none; margin-left: 10px; border-radius: 4px 4px 4px 4px; cursor: pointer; background-color: #cccccc;}
#qbbtn:hover {font-weight: bold; background-color: #bbbbbb;}

</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp"%>

	<section>
		<div id="qboard">
		<h1>고객센터</h1>
		<table> 
			<tr>
				<th>게시판</th>
				<td id="tolist" onclick="location.href='qna.do?command=qna'">고객센터</td>
				<th>작성자</th>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			<tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" width="400" height="200" style="vertical-align: top;"><br/><p style="font-weight: bold;">Q.문의 내용</p><%=qnaboardlistone.getQbcontent() %>
				<%
				if (qnaboardlistone.getQbflag().equals("Y")) {
				%>
					<span>&nbsp;&nbsp;&nbsp;문의 답변 | 등록일 : <%=qnaboardlistone.getQbredate() %></span>
				<%
				} 
				%>
				</td>
			</tr>
			<tr><td colspan="4" id="qlistlast"></td></tr>
		<%
			if(memberdto == null) {
		%>
		<%
			} else {
				if (memberdto.getMemberrole().equals("ADMIN")) {
		%>
			<tr>
				<td align="right" colspan="4" id="btnline">
					<div id="btnbox">
						<button id="qbbtn" onclick="location.href='qna.do?command=qnarecomment&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">답변</button>
						<button id="qbbtn" onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
					</div>
				</td>
			</tr>
		<%
			} else if (qnaboardlistone.getQbflag().equals("Y") && memberdto.getMemberid().equals(qnaboardlistone.getQbid())){
		%>
			<tr>
				<td align="right" colspan="4" id="btnline">
					<div id="btnbox">
						<button id="qbbtn" onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
					</div>
				</td>
			</tr>
		<%
			} else if (memberdto.getMemberid().equals(qnaboardlistone.getQbid()) && qnaboardlistone.getQbflag().equals("N")){
				
				%>
			<tr>
				<td align="right" colspan="4" id="btnline">
					<div id="btnbox">
						<button id="qbbtn" onclick="location.href='qna.do?command=qnaupdate&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">수정</button>
						<button id="qbbtn" onclick="location.href='qna.do?command=qnadelete&qbboardno=<%=qnaboardlistone.getQbboardno()%>'">삭제</button>
					</div>
				</td>
			</tr>
				<% 
			} else {
				%>
				<% 
			}
		}
		%>
		</table>
		</div>
	</section>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>