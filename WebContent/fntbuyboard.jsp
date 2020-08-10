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

 .menubar:nth-child(2) {font-weight:bold;}
 
 #btable {float:center;}
 
 .titlezone {margin:0px auto;margin-left:13%;margin-top:1%;}
 
 h1 {margin-top:2%;margin-right:40px;font-family:"Arial"; color: white;}
 
 #categorylist {cursor:pointer;margin-top:27px;}
 
 #c_btn {width:50px; height:19px; border:none; border-radius:2px 2px 2px 2px; cursor:pointer; color:white; background-color:rgba(255,255,255,0.3); margin-bottom:10px;}
 #c_btn:hover {font-weight:bold; background-color:rgba(255,255,255,0); border:2px solid rgba(255,255,255,0.5);}
 
 #buypie {margin-left:10px;margin-right:10px;}
 #buylank {padding-top:24px;}
 span > span {font-family:"Arial"; font-weight:bold; font-size:14pt; margin:0px;}
 
 table {margin:0px auto; margin-top:1%; width:80%; height:auto; font-family:"Arial";} 
 tr:hover {background-color:rgba(255,255,255,0.5);}
 th {font-size:14pt; color:rgba(255,255,255,0.5); font-weight:bold; height:30px; font-weight:bold; padding-top:2px;}
 td {font-size:12pt; color: white;height:28px;}
 .hovernot:hover {background-color:rgba(255,255,255,0);}
 
 span {cursor:pointer; margin-left:10px;}
 span:hover {font-weight:bold;}
 
 a {text-decoration:none; color:black;}
 
 #blistlast {background-color:rgba(255,255,255,0.5); height:2px;}
 
 #bbbtn {width:50px; height:30px; color:white;font-weight:bold; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:rgba( 255, 255, 255, 0.5 );}
 #bbbtn:hover {color:white;background-color:rgba(255,255,255,0);border:2px solid rgba(255,255,255,0.5);}
 
 #search {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 #searchbuy {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 
 #form1 {margin-top:5%;}

</style>
<script type="text/javascript" src="http://d3js.org/d3.v3.js"></script>
<script src="http://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/4.3.1/js/bootstrap.min.js"></script>
<script src="https://www.cssscript.com/demo/simple-typewriter-effect-pure-javascript-typewriterjs/typewriter.js"></script>
<script type="text/javascript">
	window.addEventListener('DOMContentLoaded', function() {

	var width = 70,
		height = 70,
		outerRadius = Math.min(width, height)/2,
		innerRadius = outerRadius * .5,
		color = d3.scale.category20();
	
	var dataset = [
			{name:"패션", value:${fashionBuyCnt}}, 
			{name:"차량", value:${carBuyCnt}}, 
			{name:"가전제품", value:${electronicBuyCnt}}, 
			{name:"반려동물", value:${petBuyCnt}}, 
			{name:"스포츠", value:${sportBuyCnt}}
		];
	var vis = d3.select("#buypie")
		.append("svg:svg")
		.attr("width", width)
		.attr("height", height)
		.append("svg:g")
		.attr("transform", "translate(" + outerRadius + "," + outerRadius + ")")
		.data([dataset]);
	
	var arc = d3.svg.arc().innerRadius(0).outerRadius(outerRadius);
	
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
		.attr("dy", ".2em")
		.attr("text-anchor", "middle")
		.attr("transform", function(d) { return "translate(" + arc.centroid(d) + ")rotate(" + angle(d) + ")"; })
		//.text(function(d) { return d.data.name; })
		;
	
	function angle(d) {
		var a = (d.startAngle + d.endAngle) * 90 / Math.PI - 90;
		return a > 90 ? a - 180 : a;
	}
	
	vis.append("svg:text")
		.attr("dy", ".2em")
		.attr("text-anchor", "middle")
	//	.text("카테고리별 구매글 갯수")
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
		<div class="titlezone" style="display:flex;align:center;">
			<h1>구매게시판</h1>
			
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
			
			<div id="buypie"></div>
			<p id="buylank"></p> 
<script>
var typing = document.getElementById('buylank');
var typewriter = new Typewriter(typing, { loop: true });
typing.style.color = "white";
typewriter.typeString('전체 누적 구매글 수 [ ${allBuyCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('카테고리별 누적 구매글 수').pauseFor(2500).deleteAll()
		  .typeString('패션 잡화 [ ${fashionBuyCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('차량 용품 [ ${carBuyCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('가전 제품 [ ${electronicBuyCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('반려동물 용품 [ ${petBuyCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('스포츠 용품 [ ${sportBuyCnt} ]').pauseFor(2500).deleteAll()
		  .start();
</script>
		</div>
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
				<tr class="hovernot">
	      			<th>No.</th>
					<th>분류</th>
					<th>제목</th>
					<th>작성자</th>
					<th>가격</th>
					<th>작성일</th>
				</tr>
				<tr class="hovernot"><td colspan="6" id="blistlast"></td></tr>
				<c:choose>
					<c:when test="${empty list }">
						<tr>
							<td colspan="7" align="center">현재 작성된 글이 없습니다.</td>
						</tr>


						<tr class="hovernot"><td colspan="7" id="blistlast"></td></tr>
						<c:if test="${!empty memberdto }">
						<tr class="hovernot">
							<td colspan="7" align="right">
								<button id="bbbtn" onclick="location.href='dealboard.do?command=insertbuyboard'">글 작성</button>
							</td>
						</tr>
						</c:if>

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
									<td>반려동물용품</td>
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

						<tr class="hovernot"><td colspan="7" id="blistlast"></td></tr>

						<%
							MemberDto dto = (MemberDto) session.getAttribute("memberdto");
							if(dto != null){
						%>		

						<tr class="hovernot">
							<td colspan="7" align="right">

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
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>