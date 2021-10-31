

$(document).ready(function(){
	
	//bno값을 저장하는 변수
	var bno = $("#bno").val()
		//alert(bno);
		console.log(bno);	
	
	//attachList 이미지 업로드 파일 리스트 가져오기
	$.getJSON("/hiphople/contents/getAttachlist", {bno:bno}, function(arr){
		console.log(arr);		
		
		var str = "";
		
		$(arr).each(function(i, attach){ //arr[i]에 있는 값을 attach에 넣는 것을 반복
			
			var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid +"_"+ attach.fileName);

			//파일 타입에 따라 이미지 여부 확인
			// encodeURIComponent 특정 문자를 유니코드 형식으로 변환
			if(attach.fileType){ //image type
				var sfileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid +"_"+ attach.fileName);
				str+= "<img src='/hiphople/display?fileName=" + fileCallPath +"'>";
			
			}else{ //other type
				str+= "<a href='/hiphople/download?fileName="+ fileCallPath +"'>"+ attach.fileName + "</a>";			
				
			}
			
		})
		
		$("#contsimg ul").html(str);
	})
	
})//end