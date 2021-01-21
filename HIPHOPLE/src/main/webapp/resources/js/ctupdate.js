/**
 * 
 */


$(document).ready(function(){
	var formObj = $("form[role='form']"); // 
	
	console.log(formObj);
	
	//수정 버튼 클릭했을 때
	$(".modifybtn").on("click", function(){
		formObj.attr("action", "/hiphople/contents/update.do");
		alert("수정되었습니다.")
		//attr안에 값이 하나면 getter, 값이 두 개  들어가면 setter
		//action=myapp/board/mod =get방식
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	//삭제 버튼 클릭했을 때
	$(".deletebtn").on("click", function(){
		alert("삭제되었습니다")
		formObj.attr("action", "/hiphople/contents/delete"); 
		//action=myapp/board/remove =post방식
		formObj.attr("method", "post");
		formObj.submit();
	});
	
	//목록 버튼 클릭했을 때
	$(".listbtn").on("click", function(){
		formObj.attr("action", "/hiphople/contents/list");
		//action=myapp/board/list = 
		formObj.attr("method", "get");
		formObj.submit();
	});
	
});