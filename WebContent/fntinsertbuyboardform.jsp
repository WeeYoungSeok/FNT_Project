<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) : 구매 글쓰기</title>
<script type="text/javascript" src="./se2/js/service/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript" src="https://code.jquery.com/jquery-latest.min.js"></script>
<script type="text/javascript">
$(function(){
	$("input[name=dprice]").on("keyup", function() {
	    $(this).val(addCommas($(this).val().replace(/[^0-9]/g,"")));
	});	
	
    //전역변수선언
    var editor_object = [];
     
    nhn.husky.EZCreator.createInIFrame({
        oAppRef: editor_object,
        elPlaceHolder: "dcontent",
        sSkinURI: "./se2/SmartEditor2Skin.html",
        htParams : {
            // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseToolbar : true,            
            // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
            bUseVerticalResizer : true,    
            // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
            bUseModeChanger : true,
        }
    });
     
    //전송버튼 클릭이벤트
    $("#submitbutton").click(function() {
        //id가 dcontent인 textarea에 에디터에서 대입
        editor_object.getById["dcontent"].exec("UPDATE_CONTENTS_FIELD", []);
         
        // 이부분에 에디터 validation 검증
         
        //폼 submit
        $("#insertform").submit();
    })
	
	
	
});

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
		<form action="dealboard.do" id="insertform" enctype='multipart/form-data' method="post">
		<input type="hidden" name="command" value="insertbuyboardres">
			<table border="1">
				<tr>
					<th>글제목</th>
					<td>
						<select name="dcategory">
							<option>카테고리</option>
							<option value="F">패션</option>
							<option value="C">차량</option>
							<option value="D">가전제품</option>
							<option value="A">애완</option>
							<option value="S">스포츠</option>
						</select>
						<input type="text" name="dtitle" placeholder="제목을 입력해주세요." required="required"/>
					</td>
				</tr>
				<tr>
					<th>내용</th>
					<td>
						<textarea cols="100" rows="10" name="dcontent" id="dcontent"></textarea>
					</td>
				</tr>
				<tr>
					<th>가격</th>
					<td><input type="text" name="dprice" id="dprice" required="required" style="width:100px"/>
					<input type="file" name="dfilename" id="dfilename" accept="image/*" multiple></td>
				</tr>
				<tr>
					<td colspan="2" align="right"><input type="button" id="submitbutton" value="전송" style="width:100px"></td>
				</tr>
			</table>
		</form>
	</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>