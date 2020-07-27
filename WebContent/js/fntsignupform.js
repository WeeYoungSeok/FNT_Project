// id 중복체크 팝업
	function search_id(url, name) {
		var chkid = document.getElementsByName("memberid")[0];
		window.open(url + '&id=' + chkid.value, name, "width=300, height=300");
		
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
		var chknick = document.getElementsByName("membernickname")[0];
		window.open(url + '&nick=' + chknick.value, name, "width=300, height=300");
	}
 	
// 주소 검색 팝업
 	function goPopup() {
 		// jusoPopup.jsp에서 실제 주소검색 URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do) 호출
 		var pop = window.open("./jusoPopup.jsp", "pop", "width=570,height=420, scrollbars=yes, resizable=yes"); 
 	}
 	function jusoCallBack(roadFullAddr) {
 		// jusoPopup.jsp에서 주소 입력한 정보를 받아서, signupform.jsp에 정보를 등록
		document.form.memberaddr.value = roadFullAddr;

 	}

