
$(document).ready(function(){
			// 취소
			/* 
			$(".confirmbtn").on("click", function(){
				location.href = "/";
			})
			*/
			
			$(".confirmbtn").on("click", function(){
				if($("#userpw").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#userpw").focus();
					return false;
				}
				
				// ajax 
				$.ajax({
					url : "/hiphople/member/passCheck",
					type : "POST",
					dataType : "json",
					data: {"userpw": $('#userpw').val()},
					//data : $("#delfrm").serializeArray(),
					success: function(data){						
							if(data == true){
								if(confirm("회원 탈퇴하시겠습니까?")){
									$("#delfrm").submit();
								}
							
							}else{
								alert("비밀번호가 일치하지 않습니다.");
								return;
							}
							
						}
					
				}) //end ajax 
				
		})// end click event
});// end document
