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
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<style type="text/css">
aside {position: fixed; align: left; width: 14%; height: 100%; box-shadow: 1px 0px 6px black; z-index: 2;}

#menubars {margin-top: 50%; height: 62%;}
.menubar {padding-top: 12%; background-color: black; color: white; width: 100%; height: 10%; text-align: left; font: 16pt "Arial"; font-weight: bold; cursor: pointer; opacity: 0.4;}
.menubar > p {padding-left: 10%;}
.menubar:hover {opacity: 0.6;}
.menubar_x {background-color: black; width: 100%; height: 100%; opacity: 0.4;}

#sboard {margin-top:4%; margin-bottom:6%;}

h1 {margin-top:4%; font-family:"Arial"; text-align:center; margin-bottom:2%;}
	
table {margin:0px auto; width:80%; height:auto; font-family:"Arial";}

#tolist {cursor:pointer;}
#tolist:hover {font-weight:bold;}

th {font-size:14pt; width:100px; height:30px; background-color:#dddddd; font-weight:bold; padding-top:2px;}
td {font-size:12pt; padding-left:10px; background-color:#f9f9f9;}

.wish {cursor:pointer; align:center; margin:0px auto;}
.wish:hover {font-weight:bold; color:blue;}

#payment {cursor:pointer;}

#slistlast {background-color:#dddddd; height:2px;}

#btnline {background-color:white;}
#btnbox {margin-top:4px; float:right; display:flex;}
#sbbtn {width:50px; height:26px; border:none; margin-left:10px; border-radius:4px 4px 4px 4px; cursor:pointer; background-color:#cccccc;}
#sbbtn:hover {font-weight:bold; background-color:#bbbbbb;}

</style>
</head>
<body>

<%@ include file="./form/header.jsp"%>
	<aside>
		<div id="menubars">
			<div class="menubar"><p onclick="location.href='notice.do?command=notice'">공지사항</p></div>
			<div class="menubar"><p onclick="location.href='dealboard.do?command=fntbuyboard'">구매게시판</p></div>
			<div class="menubar" style="opacity:0.7;"><p onclick="location.href='dealboard.do?command=fntsaleboard'">판매게시판</p></div>
			<div class="menubar"><p onclick="location.href='qna.do?command=qna'">고객센터</p></div>
			<div class="menubar_x"></div>
		</div>
	</aside>

<section>
	<div id="sboard">
	<h1>판매 게시판</h1>
	<table>
		<col width="100">
		<col width="200">
		<col width="100">
		<col width="200">
		<col width="100">
		<col width="200">
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
					<c:when test="${empty wishlistdto }">
						<span class="wish" onclick="wishcheck('${memberdto.memberid}','${dealboarddto.dnickname}','${dealboarddto.dboardno }');"><img alt="noWish" src="./icon/nowish.png" style="width:18px;height:18px;"></span>
					</c:when>
					<c:otherwise>
						<span class="wish" onclick="wishcheck('${memberdto.memberid}','${dealboarddto.dnickname}','${dealboarddto.dboardno}');"><img alt="Wish" src="./icon/wish.png" style="width:18px;height:18px;"></span>
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
			<td><a onclick="popnick('${dealboarddto.dnickname}');">${dealboarddto.dnickname }</a></td>
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
		<tr><td colspan="6" id="dlistlast"></td></tr>
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
					<input type="button" value="수정하기" onclick="location.href='dealboard.do?command=updatesaleboard&dboardno=${dealboarddto.dboardno}'">
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
		<c:choose>
			<c:when test="${dealboarddto.dsellflag eq 'Y' && dealboarddto.dnickname eq memberdto.membernickname }">
				<form action="mypage.do">
				<tr>
					<td colspan="2" align="right">
						<em><strong style="color:red">송장번호를 입력해주세요</strong></em>
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
						<input type="submit" value="등록하기">
					</td>
				</tr>	
				</form>	
			</c:when>
		</c:choose>
	</table>
	</div>
	<%
		if(memberdto==null) {
	%>
	<%
		} else {
	%>
	<form action="reply.do" method="post" onsubmit="insertreply();">
	<input type="hidden" name="command" value="insertreply">
		<table>
			<tr>
				<th><input type="text" name="replynickname" value="${memberdto.membernickname }" readonly="readonly" style="width:80px"></th>
				<td>
					<input type="text" id="replytitle" name="replytitle" style="width:450px">
					<input type="submit" id="insertreply" value="등록">
					<input type="hidden" name="replyboardno" value="${dealboarddto.dboardno }">
				</td>
		</table>
	</form>			
	<%
		}
	%>
	<c:choose>
		<c:when test="${empty replylist }">
			<div id="noreply">작성된 댓글이 없습니다.</div>
			<ul id="replylist">
				<li id="reply" style="list-style:none;"></li>
				<div id="up"></div>
			</ul>
		</c:when>
		<c:otherwise>
				<ul id="replylist">
			<c:forEach items="${replylist }" var="replydto">
				<c:choose>
					<c:when test="${replydto.replygroupnoseq eq 1}">
						<li id="reply" style="list-style:none;">
					</c:when>
					<c:when test="${replydto.replygroupnoseq eq 0 }">
						<li id="reply" style="list-style:none;">삭제된 댓글입니다.</li>
					</c:when>
					<c:otherwise>
						<li class="rereply" style="padding-left:45px;list-style:none;">
					</c:otherwise>
				</c:choose>
					<c:choose>
						<c:when test="${replydto.replynickname eq memberdto.membernickname || dealboarddto.dnickname eq memberdto.membernickname || memberdto.memberid eq 'admin' }">
							<div><strong>${replydto.replynickname }</strong></div>
							<div>${replydto.replytitle }</div>
							<div>${replydto.replyregdate }
							<span>
								<c:choose>
									<c:when test="${replydto.replytitletab eq 0 }">
										<input type="button" value="답변" onclick="openrereply(this,'${memberdto.membernickname}',${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
								<c:choose>
									<c:when test="${replydto.replynickname == memberdto.membernickname}">							
										<input type="button" value="삭제" onclick="deletereply(${replydto.replyno },${replydto.replyboardno });">
									</c:when>
								</c:choose>
							</span>
						</div>
						</c:when>
						<c:otherwise>
							<span>비밀 댓글입니다.</span>
						</c:otherwise>
					</c:choose>
					</li>			
			</c:forEach>
				<div id="up"></div>
				</ul>
		</c:otherwise>
	</c:choose>		
	
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
	open("fntpopnick.jsp?popnick="+membernickname,"","width=200, height=250");	
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
/* 	$.ajax({
		url : "reply.do",
		method : "POST",
		data : {"command":"insertreply", 
			"memberid":memberid, 
			"replynickname":$("input[name=replynickname]").val(),
			"replytitle":$("input[name=replytitle]").val(),
			"replyboardno" : $("input[name=replyboardno]").val()},
		dataType : "JSON",
		success : function(obj){
			if(obj != null){
				alert("댓글 등록 성공!");
				$("#noreply").hide();
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 
		
				$("#replylist").last().append(
				'<ul>'+
				'<li id="relpy"  style="list-style:none;">'
					+'<div><strong>'+obj.replynickname+'</strong></div>'
					+ '<div>'+obj.replytitle+'</div>'
					+ '<div>'+year+"-"+"0"+month+"-"+date
					+'<span><input type="button" value="답변" onclick="openrereply(this,\''+obj.replynickname+'\','+obj.replyno+','+obj.replyboardno+');">'
					+'<input type="button" value="삭제" onclick="deletereply('+obj.replyno+','+obj.replyboardno+');"></span>'
					+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
					+'</div>'
				+'</li>'+
				'</ul>'
			);
				document.getElementById("replytitle").value="";
			}else{
				alert("댓글 등록 실패");
			}
		}
	});
} */

function openrereply(me,membernickname,replyno,replyboardno){
	if(membernickname==""){
		alert("답변 하시려면 로그인 해주세요");
		return false;
	}
	
	$(".rereplyform").hide();
	$(me).closest("li").after(
			'<li class="rereplyform" style="padding-left:45px;list-style:none;">'
				+'<div><strong>'+membernickname+'</strong></div>'
				+'<form action="reply.do" method="method">'
				+'<input type="hidden" name="command" value="insertRereply">'
				+'<div><input type="text" name="rereplytitle"/>'
				+'<input type="hidden" name="replyno" value="'+replyno+'">'
				+'<input type="hidden" name="replyboardno" value="'+replyboardno+'">'
				+'<input type="hidden" name="replynickname" value="'+membernickname+'">'
				+'<input type="submit" value="등록">'
				+'</div>'
				+'</form>'
			+'</li>'
			);
	
}

function insertRereply(){	
/* 	var replynickname = $(me).parent().parent().find("div").eq(0).children().text();
	var rereplytitle = $(me).parent().find("input").val(); */

	if(rereplytitle == ""){
		alert("내용을 입력해주세요");
		return false;
	}else{
		return true;		
	}
}

/* 
	$.ajax({
		url : "reply.do",
		data : {"command":"insertRereply",
			"replyno":replyno,
			"replytitle":rereplytitle,
			"replyboardno":replyboardno,
			"replynickname":replynickname
			},
		dataType:"JSON",
		success:function(obj){
			if(obj != null){
				alert("대댓글 작성 완료");
				let today = new Date();   

				let year = today.getFullYear(); // 년도
				let month = today.getMonth() + 1;  // 월
				let date = today.getDate();  // 날짜
				let day = today.getDay();  // 요일 

				var go = $(me).parent().parent().parent();
				$(".rereplyform").hide();
				go.append(
					'<ul class="rereply">' +
					'<li style="padding-left:45px;list-style:none;">'
						+'<div><strong>'+obj.replynickname+'</strong></div>'
						+ '<div>'+obj.replytitle+'</div>'
						+ '<div>'+year+"-"+"0"+month+"-"+date
//						+'<span><input type="button" value="답변" onclick="openrereply(this,\''+obj.replynickname+'\','+obj.replyno+','+obj.replyboardno+');"></span>'
						+'<input type="hidden" name="replyid" value="'+obj.replyid+'">'
						+'</div>'
					+'</li>' +
					'</ul>'
				);
				
			
			}else{
				alert("대댓글 등록 안됐어 멍청아");
			}
		}
	});
	
} */

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
var marker = new kakao.maps.Marker({
	position: markerPosition,
	image: markerImage
});

//마커가 지도 위에 표시되도록 설정합니다
marker.setMap(map);

var infowindow = new kakao.maps.InfoWindow({zindex:1}); 
var geocoder = new kakao.maps.services.Geocoder();
/* var latlng = new kakao.maps.LatLng($("#longitude").val(), $("#latitude").val());
function searchDetailAddrFromCoords(coords, callback) {
    // 좌표로 법정동 상세 주소 정보를 요청합니다
    geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
}

searchDetailAddrFromCoords(latlng,function(result, status){
    if (status === kakao.maps.services.Status.OK) {
        var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
      //  detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
        
        var content = '<div class="bAddr">' +
                        '<span class="title">★여기서 만나요★</span>' + 
                        detailAddr + 
                    '</div>';
        infowindow.setContent(content);
        infowindow.open(map, marker);
    }
}); */

var roadname = '${dealboarddto.dfilename}';
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
    } 
});  

$(function(){
	$("#mapcontent").parent().parent().attr('border-radius','20px;');
});

	function cashpop() {
		var url = "dealboard.do?command=cash&dboardno="+${dealboarddto.dboardno };
		var option = "width=500, height=600";
		window.open(url,"",option);
	}

</script>
	
<%@ include file="./form/footer.jsp" %>
</body>
</html>