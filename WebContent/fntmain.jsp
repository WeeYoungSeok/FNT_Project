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

imgslide(); //페이지가 로딩될때 함수를 실행합니다

function imgslide() {
	$val = $("#slide").attr("val"); //현재 이미지 번호를 가져옵니다
	$mx = $("#slide").attr("mx"); //총 이미지 개수를 가져옵니다
	$("#img" + $val).hide(); //현재 이미지를 사라지게 합니다.
	if( $val == $mx ) {
		$val = 1; 
	} //현재이미지가 마지막 번호라면 1번으로 되돌립니다.
	else { 
		$val++; 
	} //마지막 번호가 아니라면 카운트를 증가시켜줍니다
	$("#img" + $val).fadeIn(1000); //변경된 번호의 이미지영역을 나타나게 합니다.괄호 안에 숫자는 페이드인 되는 시간을 나타냅니다.
	$("#slide").attr('val', $val); //변경된 이미지영역의 번호를 부여합니다.
	setTimeout('imgslide()', 2000); //1초 뒤에 다시 함수를 호출합니다.(숫자값 1000당 1초)
}

</script>
<link href="./css/fntmain.css" rel="stylesheet" type="text/css"/>
</head>
<body>
	
	<%@ include file="./form/header.jsp" %>
	<%@ include file="./form/aside.jsp" %>
	
	<div  id="slide" val="1" mx="9">
		<div id="img1">
			<img src="img/1.png"/>
		</div>
		<div id="img2">
			<img src="img/2.png"/>
		</div>
		<div id="img3">
			<img src="img/3.png"/>
		</div>
		<div id="img4">
			<img src="img/4.png"/>
		</div>
		<div id="img5">
			<img src="img/5.png"/>
		</div>
		<div id="img6">
			<img src="img/6.png"/>
		</div>
		<div id="img7">
			<img src="img/7.png"/>
		</div>
		<div id="img8">
			<img src="img/8.png"/>
		</div>
		<div id="img9">
			<img src="img/9.png"/>
		</div>
	</div>
	<%@ include file="./form/footer.jsp" %>
</body>
</html>