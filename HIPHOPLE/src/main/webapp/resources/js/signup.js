
//전역변수 설정
//유효성 검사 초기값을 false, 아무것도 입력하지 않았을때는 false값
let idcheck=false; //아이디 유효성 검사 체크 : 유효성 검사를 위한 전역변수에 기본값을 false로 처음에 선언해주기, 
let pwcheck=false; //비밀번호 유효성 검사 체크
let iddupcheck=false; //아이디 중복체크
let pwdupcheck=false; //비밀번호 중복체크

let checkEmail=false; //이메일 중복체크

let idreg;
let idval; //아이디 입력 값 

let pwreg; 
let pwval; //비밀번호 입력 값 
let repwval; //비밀번호 확인 입력 값

let nameval; // 이름 입력 값

let emailval; // 이메일 입력 값
let emailreg; // 이메일 유효성 

	

$(document).ready(function(){
	//id가 userid인 것을 선택하기 (id 선택자)
	//이벤트 : blur, keyup 등
	//blur : 포커스가 없어졌을때 발생하는 이벤트
	//keyup : 선택한 요소에서 키보드를 눌렀다가 떼었을 때 이벤트가 발생합니다. / $("선택자").keyup();
	
	$("#userid").on("keyup", function(){
		//alert("^__________^");
		
		//아이디 유효성 검사 (영문+숫자 총 길이는 4~12자 이내)
		idreg = /^[a-zA-Z0-9]{4,12}$/; // ID 유효성 검사를 위한 정규식
		idval = $("#userid").val();    // 사용자가 ID에 입력한 값
		
		if(idreg.test(idval)){ //입력한 ID 값과 정규식이 맞으면
			//alert("유효성 검사 통과");
			//$("#idmsg").html("사용가능한 아이디입니다.");
			idcheck = true; //아이디가 맞으면 true
			
			$.getJSON("/hiphople/member/checkId/" + idval, function(data){
				console.log("data = " + data);
				
				if(data == 1){ //현재 DB에 아이디가 있으면
					$("#idmsg").html("<p class='checkno'>이미 사용중인 아이디입니다.</p>");
						iddupcheck = false;
				}else{ //현재 DB에 아이디가 없으면
					$("#idmsg").html("<p class='checkok'>사용가능한 아이디입니다.</p>");
						iddupcheck = true;
				}
			})

			
		}else{ //틀리면 
			//alert("아이디를 다시 입력해주세요");
			$("#idmsg").html("<p class='checkno'>영문, 숫자를 포함하여 4자-12자 이내로 입력해주세요.</p>");
			idcheck = false; //아이디가 맞지 않으면 false
		}
			
	})// end 아이디 유효성 검사
	
	
	//비밀번호 keyup 이벤트 start	
	//비밀번호 유효성 검사(대문자 + 소문자 + 숫자 + 특수문자 + 모두 포함하며, 총 길이는 8자 이상)
	//=.*? [] 범위 중 하나는 꼭 들어가야 한다는 의미
	//a* : a가 0개 또는 여러개
	//a? : a가 0개 또는 한 개
	//. : 아무 문자
	$("#userpw").on("keyup", function(){	
		
		pwreg = /^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$/;
		pwval=$("#userpw").val();
				
		if(pwreg.test(pwval)){ //입력한 pw값과 정규식이 맞으면,
			//alert("유효성 검사 통과");
			$("#pwmsg").html("<p class='checkok'>사용가능한 비밀번호 입니다.</p>");
				pwcheck = true; //내가 만든 비밀번호
			
			
			// 비밀번호 재확인 검사
			$("#repw").on("keyup",function(){
			pwval =$("#userpw").val()
			let repwval = $("#repw").val(); //비밀번호 재확인 입력 값을 repwVal 변수에 저장
		
				if($("#userpw").val() == $("#repw").val()){ 
				$("#repwmsg").html("<p class='checkok'>비밀번호가 일치합니다.</p>");
					pwdupcheck=true;
				
				}else{
					$("#repwmsg").html("<p class='checkno'>비밀번호가 일치하지 않습니다.</p>");
					pwdupcheck=false;
					$('#repw').focus();
				}
			
			})// end 비밀번호 일치
		
		}else{ //틀리면 
			//alert("아이디를 다시 입력해주세요"); 
			$("#pwmsg").html("<p class='checkno'>비밀번호는 대소문자, 숫자, 특수문자를 조합하여 최소 8자 이상 입력해 주세요.</p>");
			$("#repwmsg").html("");
				pwcheck = false; 
		}
				
	})// end 비밀번호 유효성 검사
	

	
	// 이메일 유효성 검사
	$("#email").on("keyup", function(){
		
		emailreg=/([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		emailval = $('#email').val();
	
		// 이메일 유효성 검사 // 공백x 테스트 통과하면
		if(emailval != '' && emailval != 'undefined' && emailreg.test(emailval)){ 
			$("#emailmsg").html("<p class='checkok'>사용가능한 이메일 입니다</p>");
			
			checkEmail = true;
			
			// ajax
			$.ajax({
            type: "post",
            url: "/hiphople/member/checkEmail",
			datatype: "json",
            data: {"email": $('#email').val()},
            success: function (data) {	
                if (data == "1") {
                    $("#emailmsg").html("<p class='checkno'>이미 사용중인 이메일입니다.</p>");
						emaildupcheck = false;
                    	$('#email').focus();
                
				}else if(data == "0") {
					$("#emailmsg").html("<p class='checkok'>사용가능한 이메일입니다.</p>");
						emaildupcheck = true;
                        
                    }
                }
            })// end ajax
        
		}else{

			$("#emailmsg").html("<p class='checkno'>잘못된 형식의 이메일 주소입니다</p>");
			checkEmail = false; //아이디가 맞지 않으면 false
			$("#email").focus();
					
		}//else
		
	})// end 이메일 유효성 검사 keyup event


}) // end document.ready	

//document event가 끝나고  onsubmit 이벤트 실행 (form 전송하기 전 데이터의 유효성을 체크하기 위해서 주는 이벤트)
//return true; 면 실행 / false면 실행 x


	function checkmem(){
	//아이디가 유효성검사(idcheck)에 맞고, 비밀번호가 유효성 검사(pwcheck)에 맞으면
	//조건추가 시 && 붙이고 추가해주면 된다(변수 안에 true/false값 저장되어 있기때문에 == 생략가능)
	
	nameval = $("input#name").val();
	emailval = $("input#email").val();
	
	if(idval == "" || pwval == "" || repwval == "" || nameval == "" || emailval == ""){
		alert("모든 항목을 작성해주세요");
		return false;
		
		}else{
	
			if(idcheck && pwcheck && iddupcheck && pwdupcheck && emaildupcheck){
			//onsubmit에 true값 전송
				alert("회원가입을 축하드려요! 모든 서비스를 이용하기 위해 이메일 인증을 완료해주세요.");
				//location.href="${pageContext.request.contextPath}/member/joinOk";
				return true;
	
			}else{
			//그렇지 않으면 false값 전송
				alert("아이디와 비밀번호를 다시 확인해주세요")
				return false;
			}
		}	
	} // end checkmem 
