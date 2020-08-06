<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 판매글 수정하기</title>
<!-- summernote 넣기 -->
<link href="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="./js/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="./css/summernote-lite.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<link href="css/fntinsertsaleboardform.css" rel="stylesheet" type="text/css"/>
<link href="css/section.css" rel="stylesheet" type="text/css"/>

</head>
<body>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>

	<section>
	<%
		if(memberdto == null) {
	%>
		<script type="text/javascript">
			alert("로그인 해주세요");
			location.href = "fntlogincrud.jsp";
			// 여기는 고쳐야함
		</script>
	<%
		} else {
	%>
		<form action="dealboard.do" id="updateform" onsubmit="return postForm()" enctype='multipart/form-data' method="post">
			<h1>판매글 수정</h1>
			<input type="hidden" name="command" value="updatesaleboardres">
			<input type="hidden" name="dboardno" value="${dealboarddto.dboardno }">
    	    <table border="1" style="border: solid white;">
				<col width="100px">
				<col width="756px">
				<tr>
					<th>제목</th>
					<td style="display:flex; border:none;">
						<select name="dcategory">
							<option value="CHECK">카테고리</option>
							<option value="F">패션</option>
							<option value="C">차량</option>
							<option value="D">가전제품</option>
							<option value="A">반려동물용품</option>
							<option value="S">스포츠</option>
						</select>
						<input type="text" name="dtitle" id="dtitle" placeholder="제목을 입력해주세요." required="required" value="${dealboarddto.dtitle }"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td style="padding:0px auto;">
						<textarea class="summernote" id="summernote" name="dcontent" style="resize:none" >${dealboarddto.dcontent}</textarea>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td style="display:flex; border:none;">
						<input type="text" name="dprice" id="dprice" required="required" value="${dealboarddto.dprice }"/>
						<input id="formbtn" type="submit" value="수정">
						<input type="hidden" name="coords" id="coords" value="">
						<input type="hidden" name="roadname" id="roadname" value="">		
						<input type="hidden" name="dfilename" id="dfilename" value="">
									
					</td>
				</tr>
			</table>
		<span style="font-weight:bold;align:center;float:center;margin:0px auto;padding-left:220px;"><em>직거래시 원하는 장소를 검색 후 클릭해주세요!</em></span>
		</form>
			<div class="map_wrap" style="float:center;">
			    <div id="map" style="margin:0px auto;width:856px;height:500px;position:relative;overflow:hidden;"></div>
			    <div id="menu_wrap" class="bg_white" style="margin:0px auto;float:center;left: 250px;">
			        <div class="option">
			            <div>
			                <form onsubmit="searchPlaces(); return false;">
			                    키워드 : <input type="text" placeholder="장소를 검색해주세요" id="keyword" size="15" style="width:130px;"> 
			                    <button type="submit">검색하기</button> 
			                </form>
			            </div>
			        </div>
			        <hr>
			        <ul id="placesList"></ul>
			        <div id="pagination"></div>
			    </div>
			</div>
		<div id="underline" style="padding-top: 25px;"></div>			
	</section>
	
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68bbb576a7ffd0b92dd5af16e42288cb&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">
$(function(){
	$('#summernote').summernote({
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: '최대 2048자까지 쓸 수 있습니다',	//placeholder 설정
		  
		  toolbar: [
			    // [groupName, [list of button]]
			    ['fontname', ['fontname']],
			    ['fontsize', ['fontsize']],
			    ['style', ['bold', 'italic', 'underline','strikethrough', 'clear']],
			    ['color', ['forecolor','color']],
			    ['table', ['table']],
			    ['para', ['ul', 'ol', 'paragraph']],
			    ['height', ['height']],
			    ['insert',['picture']],
			    ['view', ['fullscreen', 'help']]
			  ],
			fontNames: ['Arial', 'Arial Black', 'Comic Sans MS', 'Courier New','맑은 고딕','궁서','굴림체','굴림','돋음체','바탕체'],
			fontSizes: ['8','9','10','11','12','14','16','18','20','22','24','28','30','36','50','72'],
		    callbacks: {	//여기 부분이 이미지를 첨부하는 부분
				onImageUpload : function(files,editor,welEditable) {
						sendFile(files[0],this);
				}
			}, 
		});
	

	$("input[name=dprice]").on("keyup", function() {
	    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});	
	
	$("#updateform").on("submit",function(){
		document.getElementById("coords").value=langitude;
		document.getElementById("roadname").value=roadname;
		
	});
	
});

var postForm = function() {
   if($('select[name="dcategory"]').val() == ('CHECK')){
	      alert("카테고리를 선택해주세요");
	      return false;
	   }
	   
	   if($('textarea[name="dcontent"]').val()==""){
		   alert("내용을 입력해주세요");
		   return false;
	   }
	  
	   $('textarea[name="dcontent"]').val($('#summernote').summernote('code'));
	      return true;
}


 function sendFile(file,editor){
 	var data = new FormData();
	  data.append("file", file);
           $.ajax({
           data: data,
           type: "POST",
                   // 이미지 업로드하는 파일 path 
           url: "summernote_imageUpload.jsp",
           cache: false,
           contentType: false,
         //  enctype: 'multipart/form-data',
           processData: false,
           success : function(img_name){
        	   var image =$("<img>").attr("src",img_name);
        	//   $(".summernote").summernote('insertImage', img_name);
        	   $(".summernote").summernote('insertNode', image[0]);
       		document.getElementById("dfilename").value = img_name;
    
        	   
           },
           error:function(){
        	   alert("실패!");
           }
	    });
	  } 

	  

function addCommas(x) {
    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
}
 

//모든 콤마 제거
function removeCommas(x) {
    if(!x || x.length == 0) return "";
    else return x.split(",").join("");
}

// 목록 누르면 누른 도로명 값 가져오기
function loadinfo(me){
	roadname = $(me).children("#roadname").text();
	
	if(!roadname){
		roadname = $(me).children("#placename").text();
	}
	
	if(confirm(roadname+"에서 만나겠습니까?")){
		console.log(roadname);
		console.log('x좌표'+$(me).children("#x").val());
	}
	
}

/*************** 카카오 map 시작 ****************/
//마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'),  // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
	    level: 3 // 지도의 확대 레벨
	};

//지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
var roadname = '${dealboarddto.dfilename}';

//주소-좌표 변환 할 수 있는 객체를 생성
var geocoder = new kakao.maps.services.Geocoder();
//주소로 좌표를 검색합니다
geocoder.addressSearch(roadname, function(result, status) {
  // 정상적으로 검색이 완료됐으면 
   if (status === kakao.maps.services.Status.OK) {
      var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

      // 결과값으로 받은 위치를 마커로 표시합니다
      var marker = new kakao.maps.Marker({
          map: map,
          position: coords
      });
      
      var infowindow = new kakao.maps.InfoWindow({
          content: '<div style="width:150px;text-align:center;padding:6px 0;">원래 만나려고 했던 곳!</div>'
      });
      infowindow.open(map, marker);
      // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
      map.setCenter(coords);
  } 
});  




//장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

//검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});
var infowindow2 = new kakao.maps.InfoWindow({zIndex:1});


//키워드로 장소를 검색합니다
searchPlaces();

//키워드 검색을 요청하는 함수입니다
function searchPlaces() {

 var keyword = document.getElementById('keyword').value;

/*      if (!keyword.replace(/^\s+|\s+$/g, '')) {
     alert('키워드를 입력해주세요!');
     return false;
 } 
*/

 // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
 ps.keywordSearch( keyword, placesSearchCB); 
}

//장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
 if (status === kakao.maps.services.Status.OK) {

     // 정상적으로 검색이 완료됐으면
     // 검색 목록과 마커를 표출합니다
     displayPlaces(data);

     // 페이지 번호를 표출합니다
     displayPagination(pagination);

 } else if (status === kakao.maps.services.Status.ZERO_RESULT) {
     alert('검색 결과가 존재하지 않습니다.');
     return;

 } else if (status === kakao.maps.services.Status.ERROR) {
     alert('검색 결과 중 오류가 발생했습니다.');
     return;

 }
}

//검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

 var listEl = document.getElementById('placesList'), 
 menuEl = document.getElementById('menu_wrap'),
 fragment = document.createDocumentFragment(), 
 bounds = new kakao.maps.LatLngBounds(), 
 listStr = '';
 
 // 검색 결과 목록에 추가된 항목들을 제거합니다
 removeAllChildNods(listEl);

 // 지도에 표시되고 있는 마커를 제거합니다
 removeMarker();
 
 for ( var i=0; i<places.length; i++ ) {

     // 마커를 생성하고 지도에 표시합니다
     var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
         marker = addMarker(placePosition, i), 
         itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다
	
         
     // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
     // LatLngBounds 객체에 좌표를 추가합니다
     bounds.extend(placePosition);
 
     // 마커와 검색결과 항목에 mouseover 했을때
     // 해당 장소에 인포윈도우에 장소명을 표시합니다
     // mouseout 했을 때는 인포윈도우를 닫습니다
     (function(marker, title) {
         kakao.maps.event.addListener(marker, 'mouseover', function() {
             displayInfowindow(marker, title);
         });

         kakao.maps.event.addListener(marker, 'mouseout', function() {
             infowindow.close();
         });

         itemEl.onmouseover =  function () {
             displayInfowindow(marker, title);
         };

         itemEl.onmouseout =  function () {
             infowindow.close();
         };
         
         itemEl.onclick =  function () {
         	displayHERE(marker, title);
         	langitude = placePosition;
         };
          
//        마크를 클릭했을 때 클릭한 자체의 주소를 알고 싶은데 그게 안되네
/* 			kakao.maps.event.addListener(marker, 'click', function() {
         	//infowindow.close();
         	displayHERE(marker, title);
         	langitude = placePosition;
         	
         	if(confirm(places[marker.getTexts()].road_address_name+"에서 만나겠습니까?")){
	         	roadname = places[marker.getTexts()].road_address_name;
	         	console.log(roadname);
         	}
         	
         	
         //	console.log(langitude);
         });  */
         
         
     })(marker, places[i].place_name);

     fragment.appendChild(itemEl);
 }

 // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
 listEl.appendChild(fragment);
 menuEl.scrollTop = 0;

 // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
 map.setBounds(bounds);
 
}
var roadname;
var langitude;
//검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

 var el = document.createElement('li'),
 itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
             '<div class="info"  onclick="loadinfo(this);">' +
             '   <h5 id="placename">' + places.place_name + '</h5>';
             

 if (places.road_address_name) {
     itemStr += '    <span id="roadname">' + places.road_address_name + '</span>' +
                 '   <span class="jibun gray">' +  places.address_name  + '</span>';
 } else {
     itemStr += '    <span>' +  places.address_name  + '</span>'; 
 }
              
   itemStr += '  <span class="tel">' + places.phone  + '</span>' +
             '</div>';           

 el.innerHTML = itemStr;
 el.className = 'item';

 return el;
}




//마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
 var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
     imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
     imgOptions =  {
         spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
         spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
         offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
     },
     markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
         marker = new kakao.maps.Marker({
         position: position, // 마커의 위치
         image: markerImage 
     });

 marker.setMap(map); // 지도 위에 마커를 표출합니다
 markers.push(marker);  // 배열에 생성된 마커를 추가합니다

 return marker;
}

//지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
 for ( var i = 0; i < markers.length; i++ ) {
     markers[i].setMap(null);
 }   
 markers = [];
}

//검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
 var paginationEl = document.getElementById('pagination'),
     fragment = document.createDocumentFragment(),
     i; 

 // 기존에 추가된 페이지번호를 삭제합니다
 while (paginationEl.hasChildNodes()) {
     paginationEl.removeChild (paginationEl.lastChild);
 }

 for (i=1; i<=pagination.last; i++) {
     var el = document.createElement('a');
     el.href = "#";
     el.innerHTML = i;

     if (i===pagination.current) {
         el.className = 'on';
     } else {
         el.onclick = (function(i) {
             return function() {
                 pagination.gotoPage(i);
             }
         })(i);
     }

     fragment.appendChild(el);
 }
 paginationEl.appendChild(fragment);
}

//검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
//인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
 var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

 infowindow.setContent(content);
 infowindow.open(map, marker);
}

function displayHERE(marker,title){
	 var content = '<div style="padding:10px;z-index:1;">여기서 만나요♬</div>';
	 
	 infowindow2.setContent(content);
	 infowindow2.open(map, marker);
}

// 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
 while (el.hasChildNodes()) {
     el.removeChild (el.lastChild);
 }
}


		
</script>
<%@ include file="./form/footer.jsp" %>
<%
		}
%>
</body>
</html>