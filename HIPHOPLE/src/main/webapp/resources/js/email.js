
/*  */
/*
	Null값 확인
	입력한 정보와 일치하는 정보가 있는지 확인
	

*/

$(function(){
	
	//이메일 체크(중복 및 유효성 검사)
	$("#findPwd_email").focusout(function(){
    	if(findPwd_emailValidate() == true){
    		findPwd_emailChk();
    	}
    })//이메일 체크 끝

	// 비밀번호 찾기_인증번호 전송 & 재전송
    $('#btn_findPwd_VeriCode, #btn_findPwd_resend').click(function(){
    	let emailVal = $("#findPwd_email").val();  
    	
    	if(findPwd_emailValidate() == true){
    		if(findPwd_emailChk() == true){
    			$.ajax({
        			url : "findPwdVeriCode.me",
        			type : "post",
        			data : {email : emailVal},
        			success : function(str){
        				console.log(str);
        				console.log('Raejin0!234');
        				alert("입력하신 이메일로 인증번호를 전송하였습니다.")
        		    	$('#btn_findPwd_VeriCode').hide();
        		    	$('#btn_findPwd_verify, #btn_findPwd_resend').show();
        		    	
        		        // 인증번호 '확인' 
        		        $('#btn_findPwd_verify').click(function(){
        		        	let inputVeriCode = $('input[name=inputVeriCode]').val();
        		        	
        		        	if(ranNum == inputVeriCode){
        		        		$('input[name=isVerified]').val('Y');
        		    			$('#verifyWrap, #veriMsg').hide();
        		    			$('.successMsgBox').show();
        		        	}else{
        		        		displayErrorMsg($("#veriMsg"), '인증번호를 확인하세요.');
        		        	}	
        		        })
        			}, 
        			error : function(){
                		var msg = "인증번호 전송 중 오류 발생";
                    	location.href="error.ydl?msg="+msg;
                	}
        		});
    		}
    	} 
    })
    
    // '비밀번호 찾기' 버튼 클릭 시 '전체 유효성 검사' 후 submit
    $('#btn_submit_findPwdForm').click(function(){
    	// 기본 정보 에러메시지 노출용
    	if(findPwd_emailValidate() == true){
    		findPwd_emailChk();
    	};
    	
    	if($('input[name=isVerified]').val() == 'N'){
    		displayErrorMsg($("#veriMsg"), '이메일을 인증하세요.');
    	}
    	
    	if(pwdValidate() == true){

    		pwdChkValidate();
    	};
    	
    	if(findPwd_emailValidate() == true && findPwd_emailChk() == true && $('input[name=isVerified]').val() == 'Y'
    		&& pwdValidate() == true && pwdChkValidate() == true){
    		$('#findPwdForm').trigger('submit');
    		alert("비밀번호를 재설정합니다.");
    	};
    });
    
    //비밀번호 찾기, 이메일 존재 유무 및 가입타입 확인
    function findPwd_emailChk(){
    	var result = false;
    	$.ajax({
    		url : "findPwd_emailChk.me",
        	type : "get",
        	data : { mId : $('#findPwd_email').val() },
        	async : false,
        	success : function(value){
//        		console.log(value);
        		if(value == "exist" ){
        			$("#emailMsg").css("display","none");
        			result = true; 
        		}else if(value == "naver"){
        			displayErrorMsg($("#emailMsg"), "간편 가입 회원입니다. 네이버로 로그인하세요.");
        			result = false; 
        		}
        		else{
        			displayErrorMsg($("#emailMsg"), '등록되지 않은 아이디입니다.');
        			result = false; 
        		}
        	}
        	, error : function(){
        		var msg = "비밀번호 찾기 이메일 존재 유무 및 가입타입 확인 중 에러 발생";
        		location.href="error.ydl?msg="+msg;
        	}
        })
    	return result;
    }
    
    // 비밀번호 찾기_비밀번호 유효성 검사
    function findPwd_emailValidate(){ 
        let emailVal = $("#findPwd_email").val();  
        // 이메일 미입력
        if (emailVal == "" ){
            displayErrorMsg($("#emailMsg"), '이메일을 입력하세요.');
             return false;
        }
        // 이메일 정규표현식
        else if(!chk(/^[\a-z0-9_-]{5,20}@[\a-zA-Z]+(\.[\a-zA-Z]+){1,2}$/, emailVal, $("#emailMsg"), "5~20자의 영문 소문자, 숫자와 특수기호(_),(-)만 사용 가능합니다.")){
             return false;
        } 
        else{
            $("#emailMsg").css("display","none");
            return true;
        }
    }


})//end









/*
$(document).ready(function(){
	
		$("#checkEmail").click(function(){
			
			let userid = $("#userid").val(); //아이디
			let receiveMail = $("#receiveMail").val();//이메일
			
			$.ajax({
				type:"GET",
				url: "/check/findpw",
				data:{
					"userid" : userid,
					"receiveMail": receiveMail
				
				},
				success: function (res) {
	                if (res['check']) {
	                    swal("발송 완료!", "입력하신 이메일로 임시비밀번호가 발송되었습니다.", "success").then((OK) = > {
	                        if(OK) {
	                            $.ajax({
	                                type: "POST",
	                                url: "/check/findPw/sendEmail",
	                                data: {
	                                    "receiveMail": receiveMail,
	                                    "userid": userid
	                                }
	                            })
	                            window.location = "/member/login";
	                    }
                    })
                    $('#checkMsg').html('<p style="color:darkblue"></p>');
                } else {
                    $('#checkMsg').html('<p style="color:red">일치하는 정보가 없습니다.</p>');
                }
            }
        })//ajax

	})//
});*/

/*
	$(function(){
		$("#checkEmail").click(function(){
			$.ajax({
				url : "../member/find_pw.do",
				type : "POST",
				data : {
					id : $("#userid").val(),
					email : $("#receiveMail").val()
				},
				success : function(result) {
					alert(result);
				},
			})
		});
	})

*/


