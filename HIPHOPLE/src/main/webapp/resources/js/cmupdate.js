
// 커뮤니티 게시판 글 수정 action

$(document).ready(function(){
	var formObj = $("form[role='form']"); // 
	
	console.log(formObj);
	
	//수정 버튼 클릭했을 때
	$(".cmodifybtn").on("click", function(){
		formObj.attr("action", "/hiphople/community/update.do");
		alert("수정되었습니다.")
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	//삭제 버튼 클릭했을 때
	$(".cdeletebtn").on("click", function(){
		alert("삭제되었습니다")
		formObj.attr("action", "/hiphople/community/delete"); 
		//action=myapp/board/remove =post방식
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	//목록 버튼 클릭했을 때
	$(".clistbtn").on("click", function(){
		formObj.attr("action", "/hiphople/community/list");
		formObj.attr("method", "get");
		formObj.submit();
	});
	
});