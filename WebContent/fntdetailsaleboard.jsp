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
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}
</style>
</head>
<body>

<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>
	<section>
		<table border="1">
			<tr>
				<th>제  목</th>
				<td>${dealboarddto.dtitle }</td>
			</tr>
			<tr>
				<th>가격</th>
				<td><fmt:formatNumber value="${dealboarddto.dprice}" pattern="#,###"/>원</td>
			</tr>
			<tr>
				<th>작성자</th>
				<td>${dealboarddto.did }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td><div>${dealboarddto.dcontent }</div></td>
			</tr>		<c:choose>
			<c:when test="${not empty dealboarddto.dlongitude }">
			<tr>
				<th>여기서 만나요!</th>
				<td style="width:500px;"><div id="map" style="width:100%;height:350px;"></div><td>
			</tr>
				<input type="hidden" name="longitude" id="longitude" value="${dealboarddto.dlongitude }">
				<input type="hidden" name="latitude" id="latitude" value="${dealboarddto.dlatitude }">
			</c:when>
		</c:choose>

	<%
		if(memberdto==null) {
	%>
		
	<% 
		}else {
	%>
	<%
				DealBoardDto dealboarddto = (DealBoardDto) request.getAttribute("dealboarddto");
				String dealboardid = dealboarddto.getDid();
				if(dealboarddto.getDid().equals(memberdto.getMemberid())|| memberdto.getMemberid().equals("admin")){
	%>
			<tr>
				<td colspan="2" align="right">
					<input type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatebuyboard&dboardno=${dealboarddto.dboardno}'">
					<input type="button" value="삭제하기" onclick="delChk(${dealboarddto.dboardno});">
				</td>
			</tr>
	<%	
				} else {
	%>
					
	<%
				}
		}
	%> 
		</table>
		
	</section>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68bbb576a7ffd0b92dd5af16e42288cb&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
function delChk(dboardno){
	if(confirm("삭제하시겠습니까?")){
		location.href='dealboard.do?command=deletesaleboard&dboardno='+dboardno;
	}
}

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

mapOption = { 
    center: new kakao.maps.LatLng($("#longitude").val(), $("#latitude").val()), // 지도의 중심좌표
    level: 3 // 지도의 확대 레벨
};

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

//마커가 표시될 위치입니다 
var markerPosition  = new kakao.maps.LatLng($("#longitude").val(), $("#latitude").val()); 

//마커를 생성합니다
var marker = new kakao.maps.Marker({
position: markerPosition
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);
var infowindow = new kakao.maps.InfoWindow({zindex:1}); 
var geocoder = new kakao.maps.services.Geocoder();

/* ★★★★★★★★★★★★★★★★★★★★★★★★★★★★고치세요 
searchDetailAddrFromCoords(onload,function(result, status){
    if (status === kakao.maps.services.Status.OK) {
        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
        detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
        
        var content = '<div class="bAddr">' +
                        '<span class="title">법정동 주소정보</span>' + 
                        detailAddr + 
                    '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
});
*/
</script>
	
<%@ include file="./form/footer.jsp" %>
</body>
</html>