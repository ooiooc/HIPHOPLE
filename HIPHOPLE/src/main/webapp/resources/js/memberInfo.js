/**
 * 
 */


$(document).ready(function(){
	var formObj = $("form[role='form']");
	
	//취소 버튼 클릭
	$(".cancel").on("click", function(){
		
		location.href = "/hiphople";
			
	})
	
	//회원정보수정 버튼 클릭
	$(".update").on("click", function(){
		
		if($("#userpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				
				if($("#username").val()==""){
					alert("성명을 입력해주세요.");
					$("#username").focus();
					return false;
			
				}
				
						
	})//
	
	
	
})//end document