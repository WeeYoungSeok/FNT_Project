function validate() {
	// id, pw 형식
	var re = /^[a-zA-Z0-9]{6,12}$/
	
	// email 형식
	var re2 = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	
	var memberid = document.getElementById("memberid");
	var memberpw = document.getElementById("memberpw");
	var memberemail = document.getElementById("memberemail");
	
	// id 형식 유효성
	if (!check(re,memberid,"ID는 영문/숫자 6~12자 이내로 작성해주세요!")) {
		return false;
	}
	
	// pw 형식 유효성
	if (!check(re,memberpw,"Password는 영문/숫자 6~12자 이내로 작성해주세요!")) {
		return false;
	}
	
	// pw, pwchk 대조 유효성
	if (signup.memberpw.value != signup.memberpw.value) {
		alert("Password가 일치하지 않습니다! 다시 확인해주세요!");
		signup.memberpw.value = "";
		signup.memberpw.focus();
		return false;
	}
	
	// email 형식 유효성
	if (!check(re2,memberemail,"이메일 형식이 적합하지 않습니다!")) {
		return false;
	}
	
}