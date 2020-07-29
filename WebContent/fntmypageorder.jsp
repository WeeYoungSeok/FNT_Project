<%@page import="com.fnt.model.dto.OrderlistDto"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)주문내역 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<%
	List<OrderlistDto> orderlist = (List<OrderlistDto>) request.getAttribute("orderlist");
%>

<style type="text/css">
a {
	text-decoration: none;
}

a:hover {
	color: orange;
}
</style>

</head>
<body>
	<%
		//request.getAttribute받아와야함
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
		<h1>내가 주문한 내역보기</h1>
		<div id="alllist">
			<div id="list">
				<a
					href="mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>">내가
					쓴 판매글</a> <a
					href="mypage.do?command=buylist&memberid=<%=memberdto.getMemberid()%>">내가
					쓴 구매글</a> <a
					href="mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>">내가
					쓴 문의글</a> <a
					href="mypage.do?command=wishlist&memberid=<%=memberdto.getMemberid()%>">내가
					찜한 상품</a> <a
					href="mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>">내가
					주문한 상품</a>
			</div>

			<div id="selllist">
				<table border="1">
					<tr>
						<th>주문내역번호</th>
						<th>판매자</th>
						<th>제목</th>
						<th>가격</th>
						<th>송장번호</th>
						<th>배송조회</th>
					</tr>
					<%
						if (orderlist.size() == 0) {
					%>
					<tr>
						<td colspan="5">-----주문내역이 없습니다.-----</td>
					</tr>
					<%
						} else {
						for (int i = 0; i < orderlist.size(); i++) {
					%>
					<tr>
						<td><%=orderlist.get(i).getOlno() %></td>
						<td><%=orderlist.get(i).getOlsellnickname() %></td>
						<td><%=orderlist.get(i).getDealboarddto().getDtitle() %></td>
						<td><%=orderlist.get(i).getDealboarddto().getDprice() %></td>
						<td><%=orderlist.get(i).getOlinvoice() %></td>
						<td>
							<input type="button" value="배송조회" onclick="invoicechk();"/>
						</td>
					</tr>
					<%
						}
					}
					%>
				</table>
			</div>
		</div>

		<input type="button" value="내 정보 보기"
			onclick="location.href='LoginCrudController?command=cruddetail&memberid=<%=memberdto.getMemberid()%>'">
	</section>

	<%@ include file="./form/footer.jsp"%>

</body>
</html>