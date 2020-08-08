<%@page import="com.fnt.model.dto.ReplyDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 구매 글보기</title>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">
function delChk(dboardno) {
	if (confirm("삭제하시겠습니까?")) {
		location.href='dealboard.do?command=deletebuyboard&dboardno=' + dboardno;
	}
}

function insertreply(me,memberid) {
	if($("input[name=replytitle]").val() == "") {
		alert("내용을 입력해주세요");
		return false;
		
	} else {
		return true;		
	}	
}

function openrereply(me,membernickname,replyno,replyboardno) {
	if (membernickname == "") {
		alert("답변 하시려면 로그인 해주세요");
		return false;
	}
	
	$(".rereplyform").hide();
	$(me).closest("li").after(
		'<li class="rereplyform" style="width:76%;height:29px;margin:0px auto;padding-left:35px;list-style:none;">'
			+'<div>'
				+'<form action="reply.do" method="method">'
					+'<div style="display:flex;">'
						+'<div style="width:160px;height:24px;padding-top:5px;overflow:auto;text-align:center;color:white;background-color:rgba(255,255,255,0.3);"><b style="margin:5px;">' + membernickname + '</b></div>'
						+'<input type="hidden" name="command" value="insertRereply">'
						+'<input type="text" id="rereplytitle" name="rereplytitle" placeholder="댓글 내용을 입력해주세요." style="width:725px;height:28px;border:none;padding-left:10px;"/>'
						+'<input type="hidden" name="replyno" value="' + replyno + '">'
						+'<input type="hidden" name="replyboardno" value="' + replyboardno + '">'
						+'<input type="hidden" name="replynickname" value="' + membernickname + '">'
						+'<input id="rbtn" type="submit" value="등록" style="margin:3px;">'
					+'</div>'
				+'</form>'
			+'</div>'
		+'</li>'
	);
}

// 댓글 ajax하는거 취소

function insertRereply() {
	
 	var replynickname = $(me).parent().parent().find("div").eq(0).children().text();
	var rereplytitle = $(me).parent().find("input").val();

	if (rereplytitle == "") {
		alert("내용을 입력해주세요");
		return false;
		
	} else {
		return true;		
	}
}

function deletereply(replyno,replyboardno) {
	if (confirm("삭제하시겠습니까?")) {
		location.href='reply.do?command=deletereply2&replyno='
					 + replyno
					 + '&dboardno='
					 + replyboardno;
	}
}
</script>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<link href="css/fntdetailboard.css" rel="stylesheet" type="text/css"/>

</head>
<body>

<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	
	<section>
	
<%
	if(memberdto == null) {
	
	}
%>
		<div id="dboard">
		<h1>구매 게시판</h1>
		<table>
			<tr>
				<th>제  목</th>
				<td colspan="3">${dealboarddto.dtitle}</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td><a onclick="popnick('${dealboarddto.dnickname}');">${dealboarddto.dnickname }</a></td>
				<th>가격</th>
				<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<th>내용</th>
				<td colspan="3" width="400" height="200">${dealboarddto.dcontent }</td>
			</tr>
			<tr><td colspan="4" id="dlistlast"></td></tr>
	<%
		if (memberdto == null) {
	%>
	<% 
		} else {
	%>
	<%
			DealBoardDto dealboarddto = (DealBoardDto) request.getAttribute("dealboarddto");
			String dealboardid = dealboarddto.getDid();
			if (dealboarddto.getDid().equals(memberdto.getMemberid()) || memberdto.getMemberid().equals("admin")) {
	%>
			<tr>
				<td align="right" colspan="4" id="btnline">
					<div id="btnbox">
						<input id="bbbtn" type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatebuyboard&dboardno=${dealboarddto.dboardno}'">
						<input id="bbbtn" type="button" value="삭제하기" onclick="delChk(${dealboarddto.dboardno});">
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
	<%
		if (memberdto == null) {
	%>
	<%
		} else {
	%>
	<form action="reply.do" method="post" onsubmit="insertreply();">
	<input type="hidden" name="command" value="insertreply">
		<table style="margin-bottom:3px;">
			<tr>
				<th style="background-color:rgba(255,255,255,0.1);"><input type="text" name="replynickname" value="${memberdto.membernickname }" readonly="readonly" style="text-align:center; font-size:12pt; font-weight:bold; width:90%; height:90%; border:none; margin:0px auto; color: white; background-color:rgba(255,255,255,0);"></th>
				<td style="display:flex; padding-left:0px;">
					<input type="text" id="replytitle" name="replytitle" placeholder="댓글을 입력하세요." style="width:100%; height:28px; border:none; margin:0px auto; padding-left:10px; background-color:rgba(255,255,255,0);">
					<div id="btnbox">
						<input id="bbbtn" type="submit" id="insertreply" value="등록">
						<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
					</div>
				</td>
		</table>
	</form>	
	<%
		}
	%>
	<c:choose>
		<c:when test="${empty replylist }">
			<div id="noreply" class="re2line" style="font-family:'Arial';text-align:center; width:78%;">작성된 댓글이 없습니다.</div>
			<ul id="replylist">
				<li id="reply" style="list-style:none;"></li>
				<div id="up"></div>
			</ul>
		</c:when>
		<c:otherwise>
				<ul id="replylist" style="font-family:'Arial';">
			<c:forEach items="${replylist }" var="replydto">
				<c:choose>
					<c:when test="${replydto.replygroupnoseq eq 1}">
						<li id="reply" style="list-style:none;">
					</c:when>
					<c:when test="${replydto.replygroupnoseq eq 0 }">
						<li id="delreply" class="re2line" style="font-family:'Arial'; margin:0px auto; margin-left: 10.2%; list-style:none;text-align:center;">삭제된 댓글입니다.</li>
					</c:when>
					<c:otherwise>
						<li class="rereply" style="padding-left:45px;list-style:none;">
					</c:otherwise>
				</c:choose>
				<c:choose>
						<c:when test="${replydto.replygroupnoseq eq 0  }"></c:when>
						<c:otherwise>
						<div class="repline">
							<div class="re1line" style="display:flex;">
								<div><b>${replydto.replynickname }</b></div>
								<div style="margin-left:6px;">
									${replydto.replyregdate }
								<span>
									<c:choose>
										<c:when test="${replydto.replytitletab eq 0 }">
											<input id="rbtn" type="button" value="답변" onclick="openrereply(this,'${memberdto.membernickname}',${replydto.replyno },${replydto.replyboardno });">
										</c:when>
									</c:choose>
									<c:choose>
										<c:when test="${replydto.replynickname == memberdto.membernickname}">							
											<input id="rbtn" type="button" value="삭제" onclick="deletereply(${replydto.replyno },${replydto.replyboardno });">
										</c:when>
									</c:choose>
								</span>
							</div>
						</div>
						<div class="re2line">${replydto.replytitle }</div>
						</div>
						</c:otherwise>
					</c:choose>
					</li>
			</c:forEach>
				<div id="up"></div>
				</ul>
		</c:otherwise>
	</c:choose>
	</div>
	</section>
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript">

function popnick(membernickname) {
	
	var memberdto = "<%=memberdto%>";
	
	if (memberdto == "null") {	//문자열로 null 선언해줘야함
		alert("로그인이 필요합니다");
		location.href="fntlogincrud.jsp";
		
	} else {
	open("fntpopnick2.jsp?popnick=" + membernickname,
		 "",
		 "width=400, height=500");	
	}
}

</script>
<%@ include file="./form/footer.jsp" %>
</body>
</html>