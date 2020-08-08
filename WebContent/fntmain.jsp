<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
response.setHeader("pragma","No-cache");
response.setHeader("Cache-Control","no-cache");
response.addHeader("Cache-Control","No-store");
response.setDateHeader("Expires",1L);
%>
<%@page import="com.fnt.model.dto.MemberDto"%>
<% request.setCharacterEncoding("UTF-8"); %>
<% response.setContentType("text/html; charset=UTF-8"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FNT(Feel New Item) - Main</title>
<link href="css/header.css" rel="stylesheet" type="text/css"/>
<script src="https://code.jquery.com/jquery-latest.min.js" type="text/javascript"></script>
<script type="text/javascript">

// 주석 해제하면 메인에서 카카오채널 팝업 띄움 
window.open("fntmainpopup.jsp", "FNT-PopUp", "location=0,left=500,top=180,width=480,height=640");

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
<header>
<%
	MemberDto memberdto = (MemberDto)session.getAttribute("memberdto");
%>
		<div id="headerzone">
		
		<!-- 로고 -->
		<img class="fnt_logo" src="./img/fnt_logo_main.png" onclick="location.href='fntmain.jsp'"/>
				
		<!-- 통합검색 -->
		<form id="searchzone" action="dealboard.do" method="post">
			<input type="hidden" name="categorylist" value="CHECK">
			<input type="hidden" name="orderlist" value="D">
			<input type="hidden" name="command" value="searchdeal">
			<input type="text" name="searchdeal" id="searchdeal" required="required" placeholder="구매글 및 판매글만 검색 가능합니다.">		
			<span>
				<button class="headerbtn" type="submit">검색</button>
			</span>
		</form>
	
		<span class="mysection">
		<script type="text/javascript">
		//채팅방 만드는 함수
		function chatGo() {
			open("https://qclass.iptime.org:8443/FNT_Project/fntstreaming.jsp","","width=1600, height=1000");
		}
		</script>
			<!-- 마이페이지 -->
			<%
				if(memberdto != null) {
			%>
				<p id="loginmsg"><b onclick="location.href='mypage.do?command=mypage&memberid=<%=memberdto.getMemberid()%>'"><%=memberdto.getMembernickname() %></b>님<br/>환영합니다!</p>
				<%
					if(memberdto.getMemberrole().equals("USER")){
				%>
				<script type="text/javascript">
					function newpop(url, name){
						var memberid = '<%=memberdto.getMemberid()%>';
						var url = "fntalert.jsp?memberid=" + memberid;
						var option = "width=450, height=550";
						
						open(url, "", option);
					}
				</script>

				<!-- 알림 -->
				<img class="alertbell" alt="alert" src="./img/bell.png" onclick="javascript:newpop();"/>
				<button class="headerbtn" onclick="location.href='LoginCrudController?command=logout'">Sign Out</button>
				<button class="headerbtn" onclick="chatGo();">Chat</button>
				<%
					} else {
				%>
						<button class="headerbtn" onclick="location.href='LoginCrudController?command=logout'">Sign Out</button>
				<%
					}
				} else {
			%>
				<button class="headerbtn" onclick="location.href='fntlogincrud.jsp'">Sign In</button>
			<%
				}
			%>
		</span>
		</div>
	</header>
	<%@ include file="./form/aside.jsp" %>
<section>
	<div style="top:80%;left:46.5%;text-align:center;z-index:2;position:fixed;">
		<img alt="" src="img/tounder_w.png" style="width:100px;height:auto;">
	</div>
	<div class="box" id="box1">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:14%;">주변에서 다들 한 번쯤은<br>경험해 봤다는 <b>중고거래</b></p>
			<img alt="" src="img/hands.png" style="width:380px;height:auto;margin-top:14%;margin-left:8%;">
		</div>
	</div>
	<div class="box" id="box2">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;"><b>내게</b>는 제 몫을 다 한 물건이지만<br>필요로 하는 <b>다른 누군가</b>에게</p>
			<img alt="" src="img/gift.png" style="width:300px;height:auto;margin-top:16%;margin-left:4%;">
		</div>
	</div>
	<div class="box" id="box3">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;">여러모로 의미도 있는<br><b>이상적 시스템</b>이지만,<br>주저하게 되는 <b>이유</b>는 뭘까요?</p>
			<img alt="" src="img/tear.png" style="width:280px;height:auto;margin-top:14%;margin-left:10%;">
		</div>
	</div>
	<div class="box" id="box4">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:18%;margin-bottom:9%;">'이 사진들만으로 <b>믿을 수</b> 있을까?'<br>'<b>작동</b>하는 모습을 보고 싶은데...'<br>'믿고 결제했다가 괜히 <b>돈만 잃는</b> 것 아닐까?'</p>
		</div>
	</div>
	<div class="box" id="box5">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:14%;">저희는 생각했습니다.<br><br>"메신저 대신 <b>일회성 영상통화</b>로 <b>중고거래</b>를 하면 어떨까?"<br>"<b>실시간으로 살펴보고 나서 구매</b>할 수 있다면?"</p>
			<!-- <img alt="" src="img/bulb.png" style="width:320px;height:auto;margin-top:14%;margin-left:8%;"> -->
		</div>
	</div>
	<div class="box" id="box6">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:22%;margin-bottom:14%;">지금보다도 훨씬 <b>다양한</b> 물건들의 <b>중고거래</b>가<br>더욱 많이 <b>활성화</b> 될 수 있지 않을까요?</p>
		</div>
	</div>
	<div class="box" id="box7">
		<div style="display: flex;">
			<p class="maincopy" style="padding-top:16%;margin-bottom:26%;">PayKeeper, 실시간 영상...<br><br>지켜봐 주세요!<br>저희 <b>FNT</b>는 더욱 노력하겠습니다 :D</p>
		</div>
	</div>
	<div class="box" id="box8"></div>
</section>
<%@ include file="./form/footer.jsp" %>
</body>
</html>