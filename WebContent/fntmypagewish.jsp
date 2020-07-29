<%@page import="java.util.Map"%>
<%@page import="com.fnt.model.dto.WishlistDto"%>
<%@page import="com.fnt.model.dto.QnaBoardDto"%>
<%@page import="com.fnt.model.dto.NoticeBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)찜목록 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
</head>
<body>
<%
	List<WishlistDto> wishlist = (List<WishlistDto>)request.getAttribute("wishlist");
%>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>
	<h1>내가 찜한 상품 보기</h1>
		<div id="alllist">
			<div id="list">
				<a href="mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>">내가 쓴 판매글</a>
				<a href="mypage.do?command=buylist&memberid=<%=memberdto.getMemberid()%>">내가 쓴 구매글</a>
				<a href="mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>">내가 쓴 문의글</a>
				<a href="mypage.do?command=wishlist&memberid=<%=memberdto.getMemberid()%>">내가 찜한 상품</a>
				<a href="mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>">내가 주문한 상품</a>
			</div>
			
			<div id="selllist">
				<table border="1">
					<tr>
						<th>찜한 글번호</th>
						<th>찜한 글의 제목</th>
						<th>찜한 상품 가격</th>
						<th>판매자 닉네임</th>
						<th>판매글올린날짜</th>
					</tr>
					<%
						if(wishlist.size() == 0){
					%>
						<tr>
							<td colspan="4" align="center">-----조회된 글이 없습니다.-----</td>
						</tr>
					<%
						} else {
							for(int i = 0; i < wishlist.size(); i++){
					%>
							 <tr>
								<td><%=wishlist.get(i).getWlno()%></td>
								<%
								if(wishlist != null){
									if(wishlist.get(i).getDealboarddto().getDflag().equals("S")){
								%>
								<td>
									<a href="dealboard.do?command=detailsaleboard&dboardno=<%=wishlist.get(i).getDealboarddto().getDboardno()%>"><%=wishlist.get(i).getDealboarddto().getDtitle()%></a>
								</td>
								<%
									} else if(wishlist.get(i).getDealboarddto().getDflag().equals("B")){
								%>
								<td>
									<a href="dealboard.do?command=detailboard&dboardno=<%=wishlist.get(i).getDealboarddto().getDboardno()%>"><%=wishlist.get(i).getDealboarddto().getDtitle()%></a>
								</td>
								<%
									}
								}
								%>
								
								<td><%=wishlist.get(i).getDealboarddto().getDprice()%></td>
								<td><%=wishlist.get(i).getWlsellnickname()%></td>
								<td><%=wishlist.get(i).getDealboarddto().getDregdate()%></td>
							</tr>
					<%
							}
						}
					%>
				</table>
			</div>
		</div>
		<input type="button" value="내 정보 보기" onclick="location.href='LoginCrudController?command=cruddetail&memberid=<%=memberdto.getMemberid()%>'">
		</section>
	<%@ include file="./form/footer.jsp"%>
</body>
</html></html>