<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 구매</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
 * {margin:0px; padding:0px;}

 .menubar:nth-child(2) {opacity:0.7;}
 
 #btable {float:center;}
 
 h1 {padding-top:4%; font-family:"Arial";}
 
 #categorylist {cursor:pointer;}
 
 #c_btn {width:50px; height:19px; border:none; border-radius:2px 2px 2px 2px; cursor:pointer; color:white; background-color:#595959; margin-bottom:10px;}
 #c_btn:hover {font-weight:bold;}
 
 table {margin:0px auto; margin-top:1%; width:80%; height:auto; font-family:"Arial";} 
 tr:hover {background-color:#efefef;}
 th {font-size:14pt; background-color:#dddddd; height:30px; font-weight:bold; padding-top:2px;} 
 td {font-size:12pt; height:24px;}
 
 span {cursor:pointer; margin-left:10px;}
 span:hover {font-weight:bold;}
 
 a {text-decoration:none; color:black;}
 
 #blistlast {background-color:#dddddd; height:2px;}
 
 #btnline:hover {background-color:white;}
 #bbbtn {width:50px; height:26px; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:#cccccc;}
 #bbbtn:hover {font-weight:bold; background-color:#bbbbbb;}
 
 #search {margin-top:6px; height:26px; border:2px solid #cccccc; padding-left:10px;}
 #searchbuy {margin-top:8px; height:22px; border:2px solid #cccccc; padding-left:10px;}
 
 #form1 {margin-top:5%;}

</style>
<script type="text/javascript" src="http://d3js.org/d3.v3.js"></script>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function() {

		var width = 300, 
		height = 300, 
		outerRadius = Math.min(width, height) / 2, 
		innerRadius = outerRadius * .5, 
		color = d3.scale.category20();
	
	var dataset = [
			{name:"패션", value:${fashionBuyCnt}}, 
			{name:"차량", value:${carBuyCnt}}, 
			{name:"가전제품", value:${electronicBuyCnt}}, 
			{name:"반려동물", value:${petBuyCnt}}, 
			{name:"스포츠", value:${sportBuyCnt}},
		];
	var vis = d3.select("#buypie")
		.append("svg:svg")
		.attr("width", width)
		.attr("height", height)
		.append("svg:g")
		.attr("transform", "translate(" + outerRadius + "," + outerRadius + ")")
		.data([dataset]);
	
	var arc = d3.svg.arc().innerRadius(innerRadius).outerRadius(outerRadius);
	
	var pie = d3.layout.pie().value(function(d) { return d.value; });
	
	var arcs = vis.selectAll("g.slice")
		.data(pie)
		.enter()
		.append("svg:g")
		.attr("class", "slice");
	
	arcs.append("svg:path")
		.attr("d", arc)
		.attr("fill", function(d, i) { return color(i); });
	
	arcs.append("svg:text")
		.attr("dy", ".25em")
		.attr("text-anchor", "middle")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + angle(d) + ")"; })
		.text(function(d) { return d.data.name; });
	
	function angle(d) {
		var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
		return a > 90 ? a - 180 : a;
	}
	
	vis.append("svg:text")
		.attr("dy", ".25em")
		.attr("text-anchor", "middle")
		.text("카테고리별\n구매글 순위")
		.attr("class", "title");
	});

</script>
</head>
<body>
<%
	String categorylist = (String)request.getAttribute("categorylist");
	List<DealBoardDto> list = (List<DealBoardDto>)request.getAttribute("list");
	Paging paging = (Paging)request.getAttribute("paging");
	String search = (String)request.getAttribute("search");
	String selecttw = (String)request.getAttribute("selecttw");
%>
	<%@ include file="./form/header.jsp"%>
	<%@ include file="./form/aside.jsp"%>
	<section>
		<div id="btable">
		<h1>구매게시판</h1>
		<table>
			<colgroup>
				<col width="100">
     			<col width="100">
     	 		<col width="300">
      			<col width="150">
     	 		<col width="150">
      			<col width="150">
			</colgroup>
			<tbody>
				<tr>
					<td colspan="6" id="btnline">
						<form action="dealboard.do" method="post">
							<input type="hidden" name="command" value="buysearchlist"/>	
							<input type="hidden" name="search" value="asldjskalsjalsjdk"/>
							<select id="categorylist" name="categorylist">
								<option value="CHECK">카테고리</option>
								<option value="F">패션</option>
								<option value="C">차량</option>
								<option value="D">가전제품</option>
								<option value="A">애완</option>
								<option value="S">스포츠</option>
							</select>
							<input id="c_btn" type="submit" value="필터적용">
						</form>
					</td>
					<td>
						<div id="buypie"></div>
					</td>
				</tr>
				<tr>
	      			<th>No.</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>가격</th>
					<th>작성일</th>
				</tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="5" align="center">작성된 글이 없습니다.</td>
						</tr>
					</c:when>
					<c:otherwise>
						<c:forEach items="${list }" var="dealboarddto" varStatus="status">
							<tr>
								<td>${dealboarddto.dboardno }</td>
								<c:choose>
								<c:when test="${dealboarddto.dcategory eq 'F'}">
									<td>패션</td>
								</c:when>
								<c:when test="${dealboarddto.dcategory eq 'C'}">
									<td>차량</td>
								</c:when>
								<c:when test="${dealboarddto.dcategory eq 'D'}">
									<td>가전제품</td>
								</c:when>
								<c:when test="${dealboarddto.dcategory eq 'A'}">
									<td>애완</td>
								</c:when>
								<c:otherwise>
									<td>스포츠</td>
								</c:otherwise>
								</c:choose>
								<td align="left">
									<span onclick="location.href='dealboard.do?command=detailboard&dboardno=${dealboarddto.dboardno}'">${dealboarddto.dtitle }
									<c:choose>
										<c:when test="${replyAllCount[status.index] ne 0}">
											(${replyAllCount[status.index]})
										</c:when>
									</c:choose>
									</span>
								</td>
								<td>${dealboarddto.dnickname }</td>
								<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
								<td>${dealboarddto.dregdate }</td>
							</tr>
						</c:forEach>
						<tr><td colspan="6" id="blistlast"></td></tr>
						<%
							MemberDto dto = (MemberDto) session.getAttribute("memberdto");
							if(dto != null){
						%>		
						<tr>
							<td id="btnline" colspan="6" align="right">
								<button id="bbbtn" onclick="location.href='dealboard.do?command=insertbuyboard'">글 작성</button>
							</td>
						</tr>
						<%
							}
						%>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
	</div>

		<%
		if(categorylist == null || search == null) {
			%>
			<jsp:include page="./paging/fntbuypaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
			<% 
		} else {
			if(categorylist.equals("A")||categorylist.equals("S")||categorylist.equals("D")||categorylist.equals("C")||categorylist.equals("F")) {
		%>
			<jsp:include page="./paging/fntbuycategorypaging.jsp">
			<jsp:param value="<%=search %>" name="search"/>
			<jsp:param value="<%=categorylist %>" name="dcategory"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
		<% 
			} else if(categorylist.equals("CHECK")){
		%>
		<jsp:include page="./paging/fntbuypaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if(selecttw.equals("W") || selecttw.equals("T")) {
				%>
				<jsp:include page="./paging/fntbuysearchtitlepaging.jsp">
				<jsp:param value="<%=selecttw %>" name="selecttw"/>
				<jsp:param value="<%=categorylist %>" name="categorylist"/>
			<jsp:param value="<%=search %>" name="search"/>
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
				<% 
			}
		}
	%>
		<form id="form1" action="dealboard.do" method="post">
		<input type="hidden" name="command" value="search"/>
		<input type="hidden" name="categorylist" value="Z"/>
			<select name="selecttw" id="search">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select>
			<input id="searchbuy" type="text"  name="search" value="" required="required" />
			<input id="bbbtn" type="submit" value="검색"/>
		</form>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>