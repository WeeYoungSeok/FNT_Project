<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) - Main</title>
<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">

// 주석 해제하면 메인에서 카카오채널 팝업 띄움 
//window.open("fntmainpopup.jsp", "FNT-PopUp", "location=0,left=500,top=180,width=480,height=640");

imgslide(); 						// 페이지 로딩될 때 함수 실행

function imgslide() {

	$val = $("#slide").attr("val"); // 현재 이미지 번호
	$mx = $("#slide").attr("mx"); 	// 총 이미지 개수

	$("#img" + $val).fadeOut(2000);	// 현재 이미지 사라지게

	if( $val == $mx ) { 			// 현재 이미지가 마지막 번호라면 다시 1번으로
		$val = 1; 
	} else { 						// 마지막 번호 아니라면 카운트 증가
		$val++; 
	}

	$("#img" + $val).fadeIn(2000); 	// 변경된 번호의 이미지 나타나게 (괄호 안 숫자 : 페이드인 소요 시간)

	$("#slide").attr('val', $val); 	// 변경된 이미지에 번호 부여

	setTimeout('imgslide()', 2000); // 1초 뒤 다시 함수 호출 (숫자 1000 : 1초)

}

jQuery(document).on("ready", function() {
    jQuery(".box").each(function () {
        
        // 개별적으로 Wheel 이벤트 적용
        jQuery(this).on("mousewheel DOMMouseScroll", function(event) {

            var delta = 0;
            var moveTop = null;
            var boxMax = jQuery(".box").length - 1;
            var winEvent = "";
              
            if(!winEvent) {
                winEvent = window.event;
            }

            if(winEvent.wheelDelta) {

                delta = winEvent.wheelDelta / 120;
                if(window.opera) {
                    delta = -delta;
                }
            }
           
            else if(winEvent.detail) {
                delta = -winEvent.detail / 3;
            }
            
            // 마우스휠을 위에서 아래로 이동
            if(delta < 0) {

                // 마지막 BOX 보다 순서값이 작은 경우에 실행
                if(jQuery(this).index() < boxMax) {
                    
                    console.log("▼");
                    if(jQuery(this).next() != undefined) {
                        moveTop = jQuery(this).next().offset().top;
                    }
                }

                // 마지막 BOX보다 더 아래로 내려가려고 하는경우 알림창 출력
                else {
                    //alert("마지막 페이지 입니다.");
                    return false;
                }
            }

            // 마우스휠을 아래에서 위로 이동
            else {

                // 첫번째 BOX 보다 순서값이 큰 경우에 실행
                if(jQuery(this).index() > 0) {

                    console.log("▲");
                    if(jQuery(this).prev() != undefined) {
                        moveTop = jQuery(this).prev().offset().top;
                    }
                }

                // 첫번째 BOX 더 위로 올라가려고 하는 경우 알림창 출력
                else {
                    //alert("첫번째 페이지 입니다.");
                    return false;
                }
            }

            // 화면 이동 0.5초(500)
            jQuery("html,body").stop().animate({
                scrollTop : moveTop + "px"
            }
            , {
                duration: 500, complete : function () { }
            });
        });
    });
});
</script>
<link href="./css/fntmain.css" rel="stylesheet" type="text/css"/>
</head>
<body>
<%@ include file="./form/header.jsp" %>
<%@ include file="./form/aside.jsp" %>
<section>
	<div class="box" id="box1">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:12%;">이제는 다들 한 번쯤은<br>경험해 본 <b>중고거래</b></p>
			<img alt="" src="img/hands.png" style="width:400px;height:auto;margin-top:12%;margin-left:20%;">
		</div>
		<div style="padding-top:3%;padding-bottom:9.5%;text-align:center;"><img alt="" src="img/tounder_w.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box2">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;">누군가에게 필요하지 않은 물건을<br>필요로 하는 다른 누군가에게<br>판매할 수 있는 것</p>
			<img alt="" src="img/gift.png" style="width:340px;height:auto;margin-top:16%;margin-left:10%;">
		</div>
		<div style="padding-top:3%;padding-bottom:6%;text-align:center;"><img alt="" src="img/tounder_w.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box3">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;">여러모로 의미도 있는<br>이상적 시스템이지만,<br>주저하게 되는 이유는 뭘까요?</p>
			<img alt="" src="img/tear.png" style="width:280px;height:auto;margin-top:14%;margin-left:20%;">
		</div>
		<div style="padding-top:3%;padding-bottom:6%;text-align:center;"><img alt="" src="img/tounder_w.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box4">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:20%;margin-bottom:11%;">'이 사진들만으로 믿을 수 있을까?'<br>'작동하는 모습을 보고 싶은데...'<br>'돈만 잃게 되는 것 아닐까?'</p>
		</div>
		<div style="padding-top:3%;padding-bottom:6%;text-align:center;"><img alt="" src="img/tounder_w.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box5">
		<div style="display: flex;">
			<p class="maincopy" style="color:black;padding-top:14%;">저희는 생각했습니다.<br><br>"<b>영상통화</b>로 <b>중고거래</b>를 하면 어떨까?"<br>"<b>실시간으로 살펴보고 구매</b>할 수 있다면?"</p>
			<img alt="" src="img/bulb.png" style="width:320px;height:auto;margin-top:14%;margin-left:8%;">
		</div>
		<div style="padding-top:2%;padding-bottom:6%;text-align:center;"><img alt="" src="img/tounder_b.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box6">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:24%;margin-bottom:11%;">지금보다 다양한 중고거래가<br>활성화 될 수 있지 않을까요?</p>
		</div>
		<div style="padding-top:3%;padding-bottom:6%;text-align:center;"><img alt="" src="img/tounder_w.png" style="width:100px;height:auto;"></div>
	</div>
	<div class="box" id="box7">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;margin-bottom:26%;">PayKeeper, 실시간 영상...<br><br>저희 <b>FNT</b>는<br>더욱 노력하겠습니다.</p>
		</div>
	</div>
</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>