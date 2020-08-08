
<%@page import="com.fnt.util.Paging"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 판매</title>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
 * {margin:0px; padding:0px;}

 .menubar:nth-child(3) {font-weight:bold;}
 
 #stable {float: center;}
 
 .titlezone {margin:0px auto;margin-left:13%;margin-top:1%;}
 
 h1 {margin-top:2%;margin-right:40px;font-family:"Arial"; color: white;}
 
 #categorylist {cursor:pointer;margin-top:27px;}
 
 #c_btn {width:50px; height:19px; border:none; border-radius:2px 2px 2px 2px; cursor:pointer; color:white; background-color:rgba(255,255,255,0.3); margin-bottom:10px;}
 #c_btn:hover {font-weight:bold; background-color:rgba(255,255,255,0); border:2px solid rgba(255,255,255,0.5);}
 
 #salepie {margin-left:10px;margin-right:10px;}
 #salelank {padding-top:24px;}
 span > span {font-family:"Arial"; font-weight:bold; font-size:14pt; margin:0px;}
 
 table {margin: 0 auto; margin-top: 1%; width: 80%; height: auto; font-family: "Arial";} 
 tr:hover {background-color:rgba(255,255,255,0.5);}
 th {font-size:14pt; color:rgba(255,255,255,0.5); font-weight:bold; height:30px; font-weight:bold; padding-top:2px;}
 td {font-size:12pt; color: white;height:28px;}
 .hovernot:hover {background-color:rgba(255,255,255,0);}
 
 span {cursor: pointer; margin-left: 10px;}
 span:hover {font-weight: bold;}
 
 a {text-decoration: none; color: black;}
 
 #slistlast {background-color: rgba(255,255,255,0.5); height: 2px;}
 
 #sbbtn {width:50px; height:30px; color:white;font-weight:bold; border:none; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:rgba( 255, 255, 255, 0.5 );}
 #sbbtn:hover {color:white;background-color:rgba(255,255,255,0);border:2px solid rgba(255,255,255,0.5);}
 
 #search {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 #salesearch {margin-top:6px; height:26px; border:2px solid white; border-radius: 4px 4px 4px 4px; padding-left:10px;}
 
 #form1 {margin-top: 5%;}
 
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
			{name:"패션", value:${fashionSaleCnt}}, 
			{name:"차량", value:${carSaleCnt}}, 
			{name:"가전제품", value:${electronicSaleCnt}}, 
			{name:"반려동물", value:${petSaleCnt}}, 
			{name:"스포츠", value:${sportSaleCnt}}
		];
	var vis = d3.select("#salepie")
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
	//	.text("카테고리별 판매글 갯수")
		.attr("class", "title");
	

	
	});
	
	
</script>
</head>
<body>
<%
	String salesearch = (String)request.getAttribute("salesearch");
	String salelist = (String)request.getAttribute("salelist");
	String dnickname = (String)request.getAttribute("dnickname");
	String categorylist = (String)request.getAttribute("categorylist");
	List<DealBoardDto> list = (List<DealBoardDto>)request.getAttribute("list");
	Paging paging = (Paging)request.getAttribute("paging");

%>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
<section>
		<div id="stable">
		<div class="titlezone" style="display:flex;align:center;">
		<h1>판매게시판</h1>
		
		<form action="dealboard.do" method="post">
			<input type="hidden" name="command" value="salesearchlist"/>	
			<input type="hidden" name="salesearch" value="sadjklsjwklsadlsa"/>
			<select id="categorylist" name="categorylist">
				<option value="CHECK">카테고리</option>
				<option value="F">패션</option>
				<option value="C">차량</option>
				<option value="D">가전제품</option>
				<option value="A">반려동물 물품</option>
				<option value="S">스포츠</option>
			</select>
			<input id="c_btn" type="submit" value="필터적용">
		</form>
		
		<div id="salepie"></div>
		<p id="salelank"></p> 
<script>
var typing = document.getElementById('salelank');
var typewriter = new Typewriter(typing, { loop: true });
typing.style.color = "white";
typewriter.typeString('전체 누적 판매글 수 [ ${allSaleCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('카테고리별 누적 판매글 수').pauseFor(2500).deleteAll()
		  .typeString('패션 잡화 [ ${fashionSaleCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('차량 용품 [ ${carSaleCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('가전 제품 [ ${electronicSaleCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('반려동물 용품 [ ${petSaleCnt} ]').pauseFor(2500).deleteAll()
		  .typeString('스포츠 용품 [ ${sportSaleCnt} ]').pauseFor(2500).deleteAll()
		  .start();
</script>
		</div>
		<table>
				<col width="70">
     			<col width="100">
     			<col width="70">
     	 		<col width="350">
      			<col width="150">
     	 		<col width="150">
      			<col width="150">
			<tr class="hovernot">
				<th>No.</th>
				<th>분류</th>
				<th>이미지</th>
				<th>제목</th>
				<th>작성자</th>
				<th>가격</th>
				<th>작성일</th>
			</tr>
			<tr class="hovernot"><td colspan="7" id="slistlast"></td></tr>
			<c:choose>
				<c:when test="${empty list }">
					<tr>
						<td colspan="7" align="center">현재 작성된 글이 없습니다.</td>
					</tr>
					<tr>
						<td class="hovernot" colspan="7" align="right">
							<button id="sbbtn" onclick="location.href='dealboard.do?command=insertsaleboard'">글 작성</button>
						</td>
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
								<td>반려동물용품</td>
							</c:when>
							<c:otherwise>
								<td>스포츠</td>
							</c:otherwise>
							</c:choose>
							<td>
								<div style="width:80px;height:28px;">
								<c:choose>
									<c:when test="${dealboarddto.dfilename ==  NULL}">
										<img src="./img/fnt_logo.png" style="width:100%;height:100%;" id="logo"/>
									</c:when>
									<c:otherwise>
										<a href="dealboard.do?command=detailsaleboard&dboardno=${dealboarddto.dboardno}"><img src="${dealboarddto.dfilename }" style="width:100%;height:100%;"/></a>
									</c:otherwise> 
								</c:choose>
								</div>
							</td>
							<td align="left">
								<span onclick="location.href='dealboard.do?command=detailsaleboard&dboardno=${dealboarddto.dboardno}'">
								<c:choose>
									<c:when test="${dealboarddto.dsellflag eq 'Y' || dealboarddto.dsellflag eq 'F' }">
										[판매완료]
									</c:when>
								</c:choose>
								${dealboarddto.dtitle }
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
					<tr class="hovernot"><td colspan="7" id="slistlast"></td></tr>
	<%
						MemberDto dto = (MemberDto) session.getAttribute("memberdto");
						if(dto != null){
	%>		
					<tr class="hovernot">
						<td colspan="7" align="right">
							<button id="sbbtn" onclick="location.href='dealboard.do?command=insertsaleboard'">글 작성</button>
						</td>
					</tr>
	<%
						}
	%>
				</c:otherwise>
			</c:choose>
		</table></div>
	<%
		if(categorylist == null || salesearch == null) {
	%>
			<jsp:include page="./paging/fntsalepaging.jsp">
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
			<jsp:include page="./paging/fntsalecategorypaging.jsp">
			<jsp:param value="<%=salesearch %>" name="salesearch"/>
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
		<jsp:include page="./paging/fntsalepaging.jsp">
    <jsp:param value="${paging.page}" name="page"/>
    <jsp:param value="${paging.beginPage}" name="beginPage"/>
    <jsp:param value="${paging.endPage}" name="endPage"/>
    <jsp:param value="${paging.prev}" name="prev"/>
    <jsp:param value="${paging.next}" name="next"/>
	</jsp:include>
	<%
			} else if(salelist.equals("W") || salelist.equals("T")) {
	%>
				<jsp:include page="./paging/fntsalesearchtitlepaging.jsp">
				<jsp:param value="<%=salelist %>" name="salelist"/>
				<jsp:param value="<%=categorylist %>" name="categorylist"/>
			<jsp:param value="<%=salesearch %>" name="salesearch"/>
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
		<input type="hidden" name="command" value="salesearch"/>
		<input type="hidden" name="categorylist" value="Z"/>
			<select name="salelist" id="search">
				<option value="T">제목</option>
				<option value="W">작성자</option>
			</select>
			<input type="text"  name="salesearch" id="salesearch" value="" required="required" />
			<input id="sbbtn" type="submit" value="검색"/>
		</form>

	</section>
<%@ include file="./form/footer.jsp" %>	
<script type="text/javascript" src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
</body>
</html>