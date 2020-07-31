<%@page import="com.fnt.model.dto.OrderlistDto"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)주문내역 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<link href="css/fntmydealpage.css" rel="stylesheet" type="text/css" />
<%
	List<OrderlistDto> orderlist = (List<OrderlistDto>) request.getAttribute("orderlist");
%>
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
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<script type="text/javascript">
		function invoicechk(){
			var url = "mypage.do?command=invoicechk";
			var option = "width=700px, height=700px";
			open(url, "", option);
		}
	</script>
	<section>
		<h1>내가 주문한 상품</h1>
		<div id="alllist">
			<div id="list">
				<p class="listbox" onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 판매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=buylist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 구매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 문의글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=wishlist&memberid=<%=memberdto.getMemberid()%>'">내가 찜한 상품</p>
				<p class="thislistbox"></p>
			</div>

			<table id="selllist">
				<col width="5%">
				<col width="15%">
				<col width="34%">
				<col width="13%">
				<col width="20%">
				<col width="13%">
				<tr>
					<th>No.</th>
					<th>판매자</th>
					<th>제목</th>
					<th>가격</th>
					<th>운송장 번호</th>
					<th>배송 조회</th>
				</tr>
				<%
					if (orderlist.size() == 0) {
				%>
				<tr style="font-weight:normal;">
					<td colspan="6" align="center">-----주문 내역이 없습니다.-----</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < orderlist.size(); i++) {
				%>
				<tr>
					<td style="font-weight:normal;"><%=orderlist.get(i).getOlno() %></td>
					<td style="font-weight:normal;"><%=orderlist.get(i).getOlsellnickname() %></td>
					<td>
						<a href="dealboard.do?command=detailsaleboard&dboardno=<%=orderlist.get(i).getDealboarddto().getDboardno()%>"><%=orderlist.get(i).getDealboarddto().getDtitle() %></a>
					</td>
					<td style="font-weight:normal;"><fmt:formatNumber value="<%=orderlist.get(i).getDealboarddto().getDprice()%>" pattern="#,###"/>원</td>
					<td><%=orderlist.get(i).getOlinvoice() %></td>
					<td>
						<input id="tracebtn" type="button" value="조회" onclick="invoicechk();"/>
					</td>
				</tr>
				<%
						}
					}
				%>
				<tr><td id="listlast" colspan="6"></td></tr>
			</table>
			<input id="mybtn" type="button" value="내 정보 보기" onclick="location.href='LoginCrudController?command=cruddetail&memberid=<%=memberdto.getMemberid()%>'">
		</div>
	</section>

	<%@ include file="./form/footer.jsp"%>

</body>
</html>