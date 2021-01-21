
// 로그인 검사
// authstatus 조회 ajax (추가하기)
$(document).ready(function(){
// 로그인 폼 유효성 검사

function checklogin() {
    
		if(document.getElementById('userid').value == "") {                                              
    		alert("아이디를 입력해주세요")
	    	return false;

 		}else if(document.getElementById('userpw').value == "") {
       		alert("비밀번호를 입력해주세요")
	        return false;

      		}else{
			document.login.submit;
    	}
	}// 로그인 유효성 검사 end
})