// id 중복체크 팝업
	function search_id(url, name) {
		if($(".IdChk").val() == "") {
			alert("ID를 입력해주세요!");
			return false;
		} else {
			window.open(url + '&id=' + $("#id").val(), name, "width=362, height=197");
		}
	}
	
// pw, pwchk 비교 처리
 	$(document).ready(function() {
 		// pwchk 입력란을 벗어나면(tab, click) 실행
 		$('.PwChk').focusout(pwChk);
 	});
 	function pwChk() {
		var pw = document.getElementsByName("memberpw")[0];
		var pwchk = document.getElementsByName("memberpwchk")[0];
		if (pw.value != pwchk.value) {
			// 에러메시지 출력
			alert("Password가 일치하지 않습니다! 다시 확인해주세요!");
			// pw, pwchk 리셋
			$('.Pw').val('');
			$('.PwChk').val('');
			// memberpw 입력으로 돌아가기
			pw.select();
		}
	}
 	
 // nickname 중복체크 팝업
	function search_nick(url, name) {
		if($("#nick").val() == "") {
			alert("Nickname을 입력해주세요!");
			return false;
		} else {
			window.open(url + '&nick=' + $("#nick").val(), name, "width=330, height=200");
		}
	}
 	
// 주소 검색 팝업
 	function juso() {
 		// jusoPopup.jsp에서 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do) 호출
 		var pop = window.open("./jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes"); 
 	}
 	function jusoCallBack(roadFullAddr) {
 		// jusoPopup.jsp에서 주소 입력한 정보를 받아서, signupform.jsp에 정보를 등록
		document.form.memberaddr.value = roadFullAddr;

 	}

// 유효성 검사...
 	$(function() {
 		$("form").on("submit", function(e) {
 		       
 			if($("#IDCHK").val() == "") {
 				alert("아이디 중복확인 해주세요");
 				e.preventDefault();		
 			} 
 			if($("#NICKCHK").val() == "") {
 				alert("닉네임 중복확인 해주세요");
 				e.preventDefault();	
 			}
 			if($("#real").val() == "") {
 				alert("이메일 인증을 해주세요");
 				return false;
 			} 
 			
 			
 		    });
 		});

 	function emailReal(url, name) {
 		if($("#email").val() == "") {
 			alert("이메일을 입력해주세요.");
 			return false;
 		} else {
 			window.open(url + getParameterEmail(), name, "width=400, height=170");
 		}
 	}

 	function getParameterEmail() {
 		var email = "&email=" + $("#email").val() + "&code_check=" + $("#code_check").val();
 		return email;
 		// ? 붙인 이유는 컨트롤러? 붙이듯이 붙여주기위해 ?를 붙임
 		// command를 선언하고
 		// 사용자가 입력한 이메일 값 받아오고
 		// 히든에 발생한 난수를 가져옴
 	}