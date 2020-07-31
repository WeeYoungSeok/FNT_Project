<%@page import="java.util.Map"%>
<%@page import="com.fnt.model.dto.WishlistDto"%>
<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)찜목록 보기</title>
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
	List<WishlistDto> wishlist = (List<WishlistDto>)request.getAttribute("wishlist");
%>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>
		<h1>내가 찜한 상품</h1>
		<div id="alllist">
			<div id="list">
				<p class="listbox" onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 판매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=buylist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 구매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 문의글</p>
				<p class="thislistbox"></p>
				<p class="listbox" onclick="location.href='mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>'">내가 주문한 상품</p>
			</div>
			
			<table id="selllist">
				<col width="10%">
				<col width="42%">
				<col width="16%">
				<col width="16%">
				<col width="16%">
				<tr>
					<th>No.</th>
					<th>제목</th>
					<th>가격</th>
					<th>작성자</th>
					<th>작성일</th>
				</tr>
				<%
					if (wishlist.size() == 0) {
				%>
				<tr>
					<td colspan="5" align="center">-----조회된 글이 없습니다.-----</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < wishlist.size(); i++) {
				%>
				<tr>
					<td><%=wishlist.get(i).getWlno()%></td>
				<%
					if (wishlist != null) {
						if (wishlist.get(i).getDealboarddto().getDflag().equals("S")) {
				%>
					<td style="text-align:left; padding-left: 40px;">
						<a href="dealboard.do?command=detailsaleboard&dboardno=<%=wishlist.get(i).getDealboarddto().getDboardno()%>"><%=wishlist.get(i).getDealboarddto().getDtitle()%></a>
					</td>
				<%
						} else if (wishlist.get(i).getDealboarddto().getDflag().equals("B")) {
				%>
					<td style="text-align:left; padding-left: 20px;">
						<a href="dealboard.do?command=detailboard&dboardno=<%=wishlist.get(i).getDealboarddto().getDboardno()%>"><%=wishlist.get(i).getDealboarddto().getDtitle()%></a>
					</td>
				<%
						}
					}
				%>
					<td><fmt:formatNumber value="<%=wishlist.get(i).getDealboarddto().getDprice()%>" pattern="#,###"/>원</td>
					<td><%=wishlist.get(i).getWlsellnickname()%></td>
					<td><%=wishlist.get(i).getDealboarddto().getDregdate()%></td>
				</tr>
				<%
						}
					}
				%>
				<tr><td id="listlast" colspan="5"></td></tr>
			</table>
			<input id="mybtn" type="button" value="내 정보 보기" onclick="location.href='LoginCrudController?command=cruddetail&memberid=<%=memberdto.getMemberid()%>'">
		</div>
	</section>
	
	<%@ include file="./form/footer.jsp"%>
</body>
</html></html>