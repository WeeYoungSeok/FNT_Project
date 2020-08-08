<%@page import="com.fnt.model.dao.ReplyDao"%>
<%@page import="com.fnt.model.dao.impl.ReplyDaoImpl"%>
<%@page import="java.util.List"%>
<%@page import="com.fnt.model.dto.DealBoardDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 판매 글보기</title>
<style>
	#popnick{
		cursor:pointer;
	}
</style>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<link href="css/fntdetailsaleboard.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
</head>
<body>

<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>

<section>
	<div id="sboard">
	<h1>판매 게시판</h1>
	<table>
		<col width="100px">
		<col width="200px">
		<col width="100px">
		<col width="200px">
		<col width="100px">
		<col width="200px">
		<tr>
			<th>제목</th>
			<td colspan="5">
				<c:choose>
					<c:when test="${dealboarddto.dsellflag eq 'Y' }">
						[판매완료]
					</c:when>
				</c:choose>
					${dealboarddto.dtitle }
			</td>
		</tr>
		<tr>
			<th>찜</th>
			<td style="text-align:center; padding-left:0px;">
				<c:choose>
					<c:when test="${dealboarddto.dsellflag eq 'Y' }">
						<div align="center"><img alt="noWish" src="./icon/nosale.png" style="width:20px;height:25px;"></div>
					</c:when>		
				<c:otherwise>
					<c:choose>
						<c:when test="${empty wishlistdto }">
							<span class="wish" onclick="wishcheck('${memberdto.memberid}','${dealboarddto.dnickname}','${dealboarddto.dboardno }');"><img alt="noWish" src="./icon/nowish.png" style="width:18px;height:18px;"></span>
						</c:when>
						<c:otherwise>
							<span class="wish" onclick="wishcheck('${memberdto.memberid}','${dealboarddto.dnickname}','${dealboarddto.dboardno}');"><img alt="Wish" src="./icon/wish.png" style="width:18px;height:18px;"></span>
						</c:otherwise>
					</c:choose>
					</c:otherwise>
				</c:choose>
			</td>
			<th>가격</th>
			<td>
				<fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원 
				<c:choose>
					<c:when test="${!empty memberdto && memberdto.membernickname ne dealboarddto.dnickname && dealboarddto.dsellflag eq 'N'}">
						<span id="payment"><img onclick="javascript:cashpop()" alt="payment" src="./img/payment.png" style="width:20px; height:auto; margin-left:6px;"></span>
					</c:when>
				</c:choose>
			</td>
			<th>작성자</th>
			<td><a id="popnick" onclick="popnick('${dealboarddto.dnickname}');">${dealboarddto.dnickname }</a></td>
		</tr>
		<tr>
			<th>내용</th>
			<td colspan="5" style="padding-top:10px;padding-bottom:10px;">
				<c:choose>
					<c:when test="${dealboarddto.dsellflag eq 'Y' }">
						<div align="center"><strong>판매 완료된 글입니다.</strong></div>
					</c:when>
					<c:otherwise>
						<div>${dealboarddto.dcontent }</div>					
					</c:otherwise>
				</c:choose>
			</td>
		</tr>
		<tr><td colspan="6" id="slistlast"></td></tr>
	<%
		DealBoardDto dealboarddto = (DealBoardDto) request.getAttribute("dealboarddto");
		if(dealboarddto.getDlatitude() != null) {
	%>
		<tr>
			<th>여기에서<br>만나요!</th>
			<td colspan="5" style="padding:0px;width:800px;">
				<div id="map" style="width:100%;height:350px;"></div>
				<input type="hidden" name="longitude" id="longitude" value="${dealboarddto.dlongitude }">
				<input type="hidden" name="latitude" id="latitude" value="${dealboarddto.dlatitude }">
			</td>
		</tr>
		<tr><td colspan="6" id="slistlast"></td></tr>
	<%
		}
		if(memberdto==null) {
	%>
	<% 
		} else {
	%>
	<%
			String dealboardid = dealboarddto.getDid();
			if(dealboarddto.getDid().equals(memberdto.getMemberid())|| memberdto.getMemberid().equals("admin")){
	%>
		<tr>
			<td colspan="6" align="right">
				<input id="sbbtn" type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatesaleboard&dboardno=${dealboarddto.dboardno}'">
				<input id="sbbtn" type="button" value="삭제하기" onclick="delChk(${dealboarddto.dboardno});">
			</td>
		</tr>
	<%	
			} else {
	%>
	<%
			}
		}
	%> 
		<c:choose>
			<c:when test="${dealboarddto.dsellflag eq 'Y' && dealboarddto.dnickname eq memberdto.membernickname }">
				<tr>
				<form action="mypage.do">
					<td colspan="6" >
						<div style="display:flex;">
						<p style="width:300px;height:100%;" align="right"><b style="color:red">송장번호를 입력해주세요</b></p>
						<input type="hidden" name="command" value="invoiceinsert"/>
						<input type="hidden" name="olboardno" value="<%=dealboarddto.getDboardno()%>"/>
						<c:choose>
							<c:when test="${invoice eq '입력한 송장번호가 없습니다.' }">
								<input type="text" name="invoice" id="invoice" placeholder="ex)1234567(CJ대한통운)">
							</c:when>
							<c:otherwise>
								<input type="text" name="invoice" id="invoice" placeholder="ex)1234567(CJ대한통운)" value="${invoice }">
							</c:otherwise>
						</c:choose>
						<input id="sbbtn" type="submit" value="등록하기">
						</div>
					</td>
				</form>	
				</tr>	
			</c:when>
		</c:choose>
	</table>
	<%
		if(memberdto==null) {
	%>
	<%
		} else {
	%>
	<form action="reply.do" method="post" onsubmit="insertreply();">
	<input type="hidden" name="command" value="insertreply">
		<table style="margin-bottom:3px;">
			<tr>
				<th style="background-color:#fee500;width:108px;"><input type="text" name="replynickname" value="${memberdto.membernickname }" readonly="readonly" style="text-align:center; font-size:12pt; font-weight:bold; width:90%; height:90%; border:none; margin:0px auto; background-color:#fee500;"></th>
				<td style="display:flex; padding-left:0px;">
					<input type="text" id="replytitle" name="replytitle" placeholder="댓글을 입력하세요." style="width:100%; height:28px; border:none; margin:0px auto; padding-left:10px; background-color:#f9f9f9;">
					<div id="btnbox">
						<input id="sbbtn" type="submit" id="insertreply" value="등록">
						<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
					</div>
				</td>
		</table>
	</form>			
	<%
		}
	%>
	<c:choose>
		<c:when test="${empty replylist }">
			<div id="noreply" class="re2line" style="text-align:center;width:78%;margin:0px auto;">작성된 댓글이 없습니다.</div>
			<ul id="replylist">
				<li id="reply" style="list-style:none;"></li>
				<div id="up"></div>
			</ul>
		</c:when>
		<c:otherwise>
				<ul id="replylist" style="font-family:'Arial';">
			<c:forEach items="${replylist }" var="replydto">
				
				<c:choose>
					<c:when test="${replydto.replygroupnoseq eq 1}">
						<li id="reply" style="list-style:none;">
					</c:when>
					<c:when test="${replydto.replygroupnoseq eq 0 }">
						<li id="delreply" style="width:78%; margin:0px auto; list-style:none;">삭제된 댓글입니다.</li>
					</c:when> 
					<c:otherwise>
						<li class="rereply" style="padding-left:45px;list-style:none;">
					</c:otherwise>
				</c:choose>
					<c:choose>
						<c:when test="${ replydto.replynickname eq memberdto.membernickname || dealboarddto.dnickname eq memberdto.membernickname ||memberdto.memberid eq 'admin' || groupno eq replydto.replygroupno}">
							
							
						
							<div class="repline">
							<div class="re1line" style="display:flex;">
							<div><b>${replydto.replynickname }</b></div>
							<div style="margin-left:6px;">
								${replydto.replyregdate }
							<span>
								<c:choose>
									<c:when test="${replydto.replytitletab eq 0 }">
										<input id="rbtn" type="button" value="답변" onclick="openrereply(this,'${memberdto.membernickname}',${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${replydto.replynickname == memberdto.membernickname}">							
										<input id="rbtn" type="button" value="삭제" onclick="deletereply(${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
							</span>
						</div>
						</div>
						<div class="re2line">${replydto.replytitle }</div>

						</c:when>
						<c:otherwise>
							<div class="re2line" style="width:77.8%;margin:0px auto;padding-left:20px;"><span>비밀 댓글입니다.</span></div>
						</c:otherwise>
					</c:choose>
					</li>	
					</c:forEach>		
				<div id="up"></div>
				</ul>
		</c:otherwise>
	</c:choose>	
	</div>
	</section>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68bbb576a7ffd0b92dd5af16e42288cb&libraries=services,clusterer,drawing"></script>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script>
function popnick(membernickname){
	var memberdto = "<%=memberdto%>";
	if(memberdto == "null"){	//문자열로 null 선언해줘야함
		alert("로그인이 필요합니다");
		location.href="fntlogincrud.jsp";
	}else{
	open("fntpopnick.jsp?popnick="+membernickname,"","width=400, height=500");	
	}
}

function delChk(dboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='dealboard.do?command=deletebuyboard&dboardno='+dboardno;
	}
}


function insertreply(me,memberid){
	if($("input[name=replytitle]").val()==""){
		alert("내용을 입력해주세요");
		return false;
	}else{
		return true;		
	}	
}

function openrereply(me,membernickname,replyno,replyboardno){
	if(membernickname==""){
		alert("답변 하시려면 로그인 해주세요");
		return false;
	}
	
	$(".rereplyform").hide();
	$(me).closest("li").after(
			'<li class="rereplyform" style="width:76%;height:29px;margin:0px auto;padding-left:35px;list-style:none;">'
				+'<div style="display:flex;">'
				+'<div style="width:160px;height:24px;padding-top:5px;text-align:center;background-color:#fee500;"><b>' + membernickname + '</b></div>'
				+'<form action="reply.do" method="method">'
				+'<input type="hidden" name="command" value="insertRereply">'
				+'<div><input type="text" name="rereplytitle" placeholder="댓글 내용을 입력해주세요." style="width:725px;height:28px;border:none;padding-left:10px;"/>'
				+'<input type="hidden" name="replyno" value="'+replyno+'">'
				+'<input type="hidden" name="replyboardno" value="'+replyboardno+'">'
				+'<input type="hidden" name="replynickname" value="'+membernickname+'">'
				+'<input id="rbtn" type="submit" value="등록">'
				+'</div>'
				+'</div>'
				+'</form>'
				+'</li>'
			);
}

function insertRereply(){	

	if(rereplytitle == ""){
		alert("내용을 입력해주세요");
		return false;
	}else{
		return true;		
	}
}

function deletereply(replyno,replyboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='reply.do?command=deletereply2&replyno='+replyno+'&dboardno='+replyboardno;
	}
}

function wishcheck(memberid,dnickname,dboardno){
	if(!memberid){
		alert("찜 하시려면 로그인 해주세요🤗");
		return false;
	}
	$.ajax({
		url : "wishlist.do",
		method : "POST",
		data : {"command":"selectOnewishlist","memberid":memberid, "dnickname" :dnickname,"dboardno":dboardno },
		success : function(msg){
			if(msg == "INSERT"){
				alert("찜목록 추가");
				//$(".wish").text("★")
				$(".wish").html('<img alt="Wish" src="./icon/wish.png" style="width:18px;height:18px;">');
			}else{
				alert("찜목록 삭제");
				//$(".wish").text("☆");
				$(".wish").html('<img alt="nowish" src="./icon/nowish.png" style="width:18px;height:18px;">');
			}
		}
	});
}

function delChk(dboardno){
	if(confirm("삭제하시겠습니까?🤔")){
		location.href='dealboard.do?command=deletesaleboard&dboardno='+dboardno;
	}
}

/********** 카카오 맵  **********/
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = { 
    center: new kakao.maps.LatLng($("#longitude").val(), $("#latitude").val()), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng($("#longitude").val(), $("#latitude").val()); 
var imageSrc = "./icon/pin.png",
	imageSize = new kakao.maps.Size(64,69),
	imageOption = {offset: new kakao.maps.Point(27,69)};

var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
//마커를 생성합니다
var marker1 = new kakao.maps.Marker({
	position: markerPosition,
	image: markerImage
});

 //마커가 지도 위에 표시되도록 설정합니다
//marker.setMap(map); 

var infowindow = new kakao.maps.InfoWindow({zindex:1}); 
var geocoder = new kakao.maps.services.Geocoder();
var roadname = '${dealboarddto.droadname}';

//주소로 좌표를 검색합니다
geocoder.addressSearch(roadname, function(result, status) {
    // 정상적으로 검색이 완료됐으면 
     if (status === kakao.maps.services.Status.OK) {
        var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

        var imageSrc = "./icon/pin.png",
    	imageSize = new kakao.maps.Size(64,69),
    	imageOption = {offset: new kakao.maps.Point(27,69)};

    	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
    	
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new kakao.maps.Marker({
            position: coords,
            image: markerImage,
            map: map
        });

        // 인포윈도우로 장소에 대한 설명을 표시합니다
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div id="mapcontent" style="text-align:center;padding:6px 0;">여기서 만나요!</div>'
 					+'<div> 주소 : '+roadname+'</div>'      
        });

        infowindow.open(map, marker);
        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);
    } else {
    	marker1.setMap(map);
        var infowindow = new kakao.maps.InfoWindow({
            content: '<div id="mapcontent" style="text-align:center;padding:6px 0;">여기서 만나요!</div>'    
        });
    	infowindow.open(map, marker1);
    }
});  

$(function(){
	$("#mapcontent").parent().parent().attr('border-radius','20px;');
});

	function cashpop() {
		var url = "dealboard.do?command=cash&dboardno="+${dealboarddto.dboardno };
		var option = "width=1200, height=800";
		window.open(url,"",option);
	}

</script>
	
<%@ include file="./form/footer.jsp" %>
</body>
</html>