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

</head>
<body>
<%
	List<OrderlistDto> orderlist = (List<OrderlistDto>) request.getAttribute("orderlist");
%>
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
				<p class="thislistbox" onclick="location.href='mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>'">내가 주문한 상품</p>
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
				<tr>
					<td colspan="6" align="center">-----주문 내역이 없습니다.-----</td>
				</tr>
				<%
					} else {
						for (int i = 0; i < orderlist.size(); i++) {
				%>
				<tr>
					<td><%=orderlist.get(i).getOlno() %></td>
					<td><%=orderlist.get(i).getOlsellnickname() %></td>
					<td><%=orderlist.get(i).getDealboarddto().getDtitle() %></td>
					<td><fmt:formatNumber value="<%=orderlist.get(i).getDealboarddto().getDprice()%>" pattern="#,###"/>원</td>
					<td><%=orderlist.get(i).getOlinvoice() %></td>
					<td>
						<input type="button" value="배송조회" onclick="invoicechk();"/>
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