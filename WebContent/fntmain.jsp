<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT - Main</title>
<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">

imgslide(); 						// 페이지 로딩될 때 함수 실행

function imgslide() {

	$val = $("#slide").attr("val"); // 현재 이미지 번호
	$mx = $("#slide").attr("mx"); 	// 총 이미지 개수

	$("#img" + $val).fadeOut(1000);	// 현재 이미지 사라지게

	if( $val == $mx ) { 			// 현재 이미지가 마지막 번호라면 다시 1번으로
		$val = 1; 
	} else { 						// 마지막 번호 아니라면 카운트 증가
		$val++; 
	}

	$("#img" + $val).fadeIn(1000); 	// 변경된 번호의 이미지 나타나게 (괄호 안 숫자 : 페이드인 소요 시간)

	$("#slide").attr('val', $val); 	// 변경된 이미지의 번호 부여

	setTimeout('imgslide()', 1000); // 1초 뒤 다시 함수 호출 (숫자 1000 : 1초)

}

</script>
<link href="./css/fntmain.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<div  id="slide" val="1" mx="5">
		<div id="img1">
			<img src="img/2.png"/>
		</div>
		<div id="img2">
			<img src="img/4.png"/>
		</div>
		<div id="img3">
			<img src="img/7.png"/>
		</div>
		<div id="img4">
			<img src="img/8.png"/>
		</div>
		<div id="img5">
			<img src="img/9.png"/>
		</div>
	</div>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>