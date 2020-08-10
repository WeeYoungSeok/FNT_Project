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


#menutitle {padding-left:31% !important;}

#menubars {margin-top:2% !important; }
.menubar {padding-top:0 !important; width:100% !important;}
.mtext {padding-left:10% !important;}

section {overflow: auto; z-index: 1;}
#qboard {margin-top: 4%; margin-bottom: 2%; margin-left:10%;}

h1 {font-family:"Arial"; text-align:left; margin-left: 10%; color: white; margin-bottom: 1%;}
	
table {margin-left: 10%; width: 70%; height: auto; font-family: "Arial";}
	
#tolist {cursor: pointer;text-decoration:underline;}
#tolist:hover {font-weight: bold;}

th {font-size: 13pt; width: 100px; height: 30px; background-color: rgba(255,255,255,0.1);color: rgba(255,255,255,0.7); font-weight: bold; padding-top: 2px;}

td {font-size: 12pt; padding-left: 10px; color: white;}
 
#qlistlast {background-color: rgba(255,255,255,0.5); height: 2px;}

#btnbox {margin-top: 4px; float: right; display: flex;}
#qbbtn {width: 50px; height: 26px; border: 2px solid rgba(255,255,255,0); margin-left: 10px; border-radius: 2px 2px 2px 2px; cursor: pointer; color: white; background-color: rgba(255,255,255,0.3);}
#qbbtn:hover {font-weight: bold; border: 2px solid rgba(255,255,255,0.5); background-color: rgba(255,255,255,0);}

</style>
</head>
<body>
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp"%>

	<section>
		<div id="qboard">
		<h1>고객센터</h1>
		<table> 
			<tr><td colspan="4" id="qlistlast"></td></tr>
			<tr>
				<th>게시판</th>
				<td id="tolist" onclick="location.href='qna.do?command=qna'">고객센터</td>
				<th>작성자</th>
				<td><%=qnaboardlistone.getQbnickname() %></td>
			<tr>
			<tr><td colspan="4" id="qlistlast"></td></tr>
			<tr>
				<th>제목</th>
				<td colspan="3"><%=qnaboardlistone.getQbtitle() %></td>
			</tr>
			<tr><td colspan="4" id="qlistlast"></td></tr>
			<tr>
				<th>내용</th>
				<td colspan="3" width="400" height="200" style="width:600; height:240px; padding-bottom:20px; overflow:auto;"><br/><p style="font-weight: bold;">Q.문의 내용</p><%=qnaboardlistone.getQbcontent() %>
				<%
				if (qnaboardlistone.getQbflag().equals("Y")) {
				%>
					<span >&nbsp;&nbsp;&nbsp;문의 답변 | 등록일 : <%=qnaboardlistone.getQbredate() %></span>
				<%
				} 
				%>
				</td>
			</tr>
			<tr><td colspan="4" id="qlistlast"></td></tr>
		<%
			if(memberdto == null && qnaboardlistone.getQbsecret().equals("Y")) {
		%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
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