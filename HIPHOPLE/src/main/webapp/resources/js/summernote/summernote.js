
/* summernote 에디터 로딩 */
$(document).ready(function() {
	
	//summernote 속성 변경
	$('#cmcontent').summernote({
		  //width: 700,
		  height: 300,                 // 에디터 높이
		  minHeight: null,             // 최소 높이
		  maxHeight: null,             // 최대 높이
		  focus: true,                  // 에디터 로딩후 포커스를 맞출지 여부
		  lang: "ko-KR",					// 한글 설정
		  placeholder: 'write here!', //placeholder 설정
		  //font-weight: 400,
		  //font-size: 14,
		  //letter-spacing:1px,
		  tabsize: 2	    
	});//
	
	//새 글 작성하기
	//폼에 빈 칸 없이 작성하도록 확인
	function goWrite(frm) {
		var title = frm.title.value;
		//var writer = frm.writer.value;
		var content = frm.content.value;
		
		if (title.trim() == ''){
			alert("제목을 입력해주세요");
			return false;
		}
		//if (writer.trim() == ''){
			//alert("작성자를 입력해주세요");
			//return false;
		//}
		if (content.trim() == ''){
			alert("내용을 입력해주세요");
			return false;
		}
		frm.submit();
	}//
	
	
});//end document