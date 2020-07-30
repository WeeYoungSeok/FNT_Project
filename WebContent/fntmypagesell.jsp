<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item)판매글 보기</title>
<link href="css/section.css" rel="stylesheet" type="text/css" />
<link href="css/fntmydealpage.css" rel="stylesheet" type="text/css" />


</head>
<body>
<%
	List<DealBoardDto> selllist = (List<DealBoardDto>)request.getAttribute("selllist");
%>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>
		<h1>내가 쓴 판매글</h1>
		<div id="alllist">
			<div id="list">
				<p class="thislistbox" onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 판매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=buylist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 구매글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=qnalist&memberid=<%=memberdto.getMemberid()%>'">내가 쓴 문의글</p>
				<p class="listbox" onclick="location.href='mypage.do?command=wishlist&memberid=<%=memberdto.getMemberid()%>'">내가 찜한 상품</p>
				<p class="listbox" onclick="location.href='mypage.do?command=orderlist&memberid=<%=memberdto.getMemberid()%>'">내가 주문한 상품</p>
			</div>
			

			<div id="selllist">
				<table border="1">
					<tr>
						<th>글번호</th>
						<th>글제목</th>
						<th>작성날짜</th>
					</tr>
					<%
						if(selllist.size() == 0){
					%>
						<tr>
							<td colspan="3">-----조회된 글이 없습니다.-----</td>
						</tr>
					<%
						} else {
							for(int i = 0; i < selllist.size(); i++){
					%>
							<tr>
								<td><%=selllist.get(i).getDboardno() %></td>
								<td>
								<%
									if(selllist.get(i).getDsellflag().equals("Y")){
								%>
										[판매완료]
								<%		
									}
								%>

									<a href="dealboard.do?command=detailsaleboard&dboardno=<%=selllist.get(i).getDboardno()%>"><%=selllist.get(i).getDtitle() %></a>
								</td>
								<td><%=selllist.get(i).getDregdate() %></td>
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

</body>
</html>