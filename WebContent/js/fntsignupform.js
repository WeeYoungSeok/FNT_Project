	// id 중복체크 팝업
	function open_win(url,name) {
		var chkid = document.getElementsByName("memberid")[0];
		
		window.open(url + '&id=' + chkid.value,name,
					"width=300, height=300");
	}
	
	// pw pwchk 비교 처리
 	$(document).ready(function(){
 		
 		// pwchk 입력란을 벗어나면(tab, click) 실행
 		$('.PwChk').focusout(pwChk);
 	});
 	
 	function pwChk() {
		var pw = document.getElementsByName("memberpw")[0];
		var pwchk = document.getElementsByName("memberpwchk")[0];
		
		if (pw.value != pwchk.value) {
			
			// 에러메시지 출력
			alert("Password가 일치하지 않습니다! 다시 확인해주세요!");
			
			// pw, pwchk 리셋해주기 
			$('.Pw').val('');
			$('.PwChk').val('');
			
			// memberpw 입력으로 돌아가기
			pw.select();
		}
	}