<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 글 수정하기</title>
<!-- summernote 넣기 -->
<link href="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css" rel="stylesheet">
<script src="http://code.jquery.com/jquery-1.9.1.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="http://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="./js/summernote-lite.js"></script>
<script src="./js/summernote-ko-KR.min.js"></script>
<link rel="stylesheet" href="./css/summernote-lite.css">
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.1/summernote.css" rel="stylesheet">

<script>
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
	

	
});

var postForm = function() {
	if($('select[name="dcategory"]').val() == ('CHECK')){
		alert("카테고리를 선택해주세요");
		return false;
	}else{
		$('textarea[name="dcontent"]').val($('#summernote').summernote('code'));
	   	return true;
	}
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
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
}

section {
	padding-top: 90px;
	padding-left: 240px;
}

input {
	width: 500px;
	height: 24px;
	padding-left: 6px;
}

td {
	width: 740px;
	height: 24px;
}

</style>
</head>
<body>
<%@ include file="./form/header.jsp"%>
<%@ include file="./form/aside.jsp"%>

	<section>
		<form action="dealboard.do" id="insertform" onsubmit="return postForm()" enctype='multipart/form-data' method="post">
		<input type="hidden" name="command" value="updatebuyboardres">
		<input type="hidden" name="dboardno" value="${dealboarddto.dboardno }">
			<table border="1">
				<tr>
					<th>글제목</th>
					<td>
						<select name="dcategory">
							<option value="CHECK">카테고리</option>
							<option value="F">패션</option>
							<option value="C">차량</option>
							<option value="D">가전제품</option>
							<option value="A">애완</option>
							<option value="S">스포츠</option>
						</select>
						<input type="text" name="dtitle" placeholder="제목을 입력해주세요." required="required" value="${dealboarddto.dtitle }"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea class="summernote" id="summernote" name="dcontent" style="resize:none" >${dealboarddto.dcontent}</textarea>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="dprice" id="dprice" required="required" style="width:100px" value="${dealboarddto.dprice }"/>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="submit" value="전송" style="width:100px"></td>
				</tr>
				
				
			</table>
		</form>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>