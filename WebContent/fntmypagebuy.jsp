<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)구매글 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<link href="css/fntmydealpage.css" rel="stylesheet" type="text/css" />
<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function(){
		// 현재 게시판 버튼은 사라짐
		$(".thislistbox").animate({width:"0px",opacity:"0.1"},1000);
		
		// 다른 게시판 버튼은 1/4 너비로 차지
		$(".listbox").animate({width:"100%"},1000);
	});
</script>
</head>
<body>
<%
	List<DealBoardDto> buylist = (List<DealBoardDto>)request.getAttribute("buylist");
%>
	<%@ include file="./form/header.jsp"%>
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>
	<section>
		<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
	<%
		} else {
	%>
		<h1>내가 쓴 구매글</h1>
		<div id="alllist">
			<div id="list">
				<p class="listbox" onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 판매글</p>
				<p class="thislistbox"></p>
				<p class="listbox" onclick="location.href='mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 문의글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=wishlist&memberid=<%=memberdto.getMemberid()%>'">내가 찜한 상품</p>
				<p class="listbox" onclick="location.href='mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>'">내가 주문한 상품</p>
			</div>
			
			<table id="selllist">
				<col width="15%">
				<col width="60%">
				<col width="25%">
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>작성일</th>
				</tr>
				<%
					if (buylist.size() == 0) {
				%>
				<tr>
					<td colspan="3" align="center">-----조회된 글이 없습니다.-----</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < buylist.size(); i++) {
				%>
				<tr>
					<td><%=buylist.get(i).getDboardno() %></td>
					<td style="text-align:left; padding-left: 40px;">
						<a href="dealboard.do?command=detailboard&dboardno=<%=buylist.get(i).getDboardno()%>"><%=buylist.get(i).getDtitle() %></a>
					</td>
					<td><%=buylist.get(i).getDregdate() %></td>
				</tr>
				<%
						}
					}
				%>
				<tr><td id="listlast" colspan="3"></td></tr>
			</table>
			<input id="mybtn" type="button" value="내 정보 보기" onclick="location.href='LoginCrudController?command=cruddetail&memberid=<%=memberdto.getMemberid()%>'">
		</div>
		</section>
		
	<%@ include file="./form/footer.jsp"%>
	<%
		}
	%>
</body>
</html>