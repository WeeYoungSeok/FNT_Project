<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 구매글 수정하기</title>
<style>
	table{
		margin: 0 auto; 
		margin-top: 3%; 
		width: 80%; 
		height: auto; 
		font-family: Arial;
		float: center;
	}	
</style>
<!-- summernote 넣기 -->
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js-->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.8/summernote.js"></script>





<link rel="stylesheet" href="./css/summernote-lite.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=68bbb576a7ffd0b92dd5af16e42288cb&libraries=services,clusterer,drawing"></script>
<script>
$(function(){
	$('#summernote').summernote({
		  height: 300,					// 에디터 높이
		 // width: 756,
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
		
</script>
<link href="css/section.css" rel="stylesheet" type="text/css"/>
<link href="css/fntinsertbuyboardform.css" rel="stylesheet" type="text/css"/>

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
		<form action="dealboard.do" id="insertform" onsubmit="return postForm()" enctype='multipart/form-data' method="post">
			<h1>구매글 수정</h1>
			<input type="hidden" name="command" value="updatebuyboardres">
			<input type="hidden" name="dboardno" value="${dealboarddto.dboardno }">
			<table>
				<col width="100px">
				<col width="756px">
				<tr>
					<th>제목</th>
					<td style="display:flex; border:none;">
						<select name="dcategory" id="dcategory">
							<option value="CHECK">카테고리</option>
							<option value="F">패션</option>
							<option value="C">차량</option>
							<option value="D">가전제품</option>
							<option value="A">애완</option>
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
						<input id="formbtn" type="submit" value="전송" style="width:100px">
					</td>
				</tr>
			</table>
		</form>
	</section>
<%@ include file="./form/footer.jsp" %>
<%
		}
%>
</body>
</html>