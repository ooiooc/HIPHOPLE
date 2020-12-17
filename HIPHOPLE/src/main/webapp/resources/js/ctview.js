/**
 * 
 */

$(document).ready(function(){
	var formObj = $("form[role='form']"); // 
	
	console.log(formObj);
	
	//수정 버튼 클릭했을 때
	$("#contModbtn").on("click", function(){
		formObj.attr("action", "/hiphople/contents/update");
		//attr안에 값이 하나면 getter, 값이 두 개  들어가면 setter
		//action=myapp/board/mod =get방식
		formObj.attr("method", "get");
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
	$("#contListbtn").on("click", function(){
		formObj.attr("action", "/hiphople/contents/list");
		//action=myapp/board/list = 
		formObj.attr("method", "get");
		formObj.submit();
	});
	
	//bno값을 저장하는 변수
	var bno = $("#bno").val()
		alert(bno);
		console.log(bno);	
	
	//attachList에 대한 처리
	$.getJSON("/hiphople/contents/getAttachlist", {bno:bno}, function(arr){
		console.log(arr);		
		
		var str = "";
		
		$(arr).each(function(i, attach){ //arr[i]에 있는 값을 attach에 넣는 것을 반복
			
			var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid +"_"+ attach.fileName);

			//파일 타입에 따라 이미지 여부 확인
			if(attach.fileType){ //image type
				var sfileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid +"_"+ attach.fileName);
				str+= "<li><img src='/hiphople/display?fileName=" + fileCallPath +"'></li>";
			
			}else{ //other type
				str+= "<li><a href='/hiphople/download?fileName="+ fileCallPath +"'>"+ attach.fileName + "</a></li>";			
				
			}
			
		})
		
		$(".uploadResult ul").html(str);
	})

});//final end