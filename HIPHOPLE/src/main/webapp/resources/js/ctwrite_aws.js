

$(document).ready(function(){
	
	// 파일 업로드 정규식 검사
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$"); //정규식(해당 종류의 파일은 업로드 할 수 없도록 처리)
	var maxSize = 5242880; //파일 사이즈(5MB) 1204(MB) * 1024(MB) * 5 
	
	function checkExtension(fileName, fileSize){
		
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과")
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}

	
	// 선택자를 이용해서 폼 태그를 선택하여 formObj변수에 저장
	// $("form[role='form']") form태그의 role 속성이 form인 것을 선택하기 
	var formObj = $("form[role='form']")
	
	$('input[type="file"]').change(function(){
		
		var inputFile = $('input[name="file"]');
		var files = inputFile[0].files;
		var formData = new FormData();
		
		console.log(formData);
		
		for(var i=0; i<files.length; i++){
			
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			// 컨트롤러에서 받는 이름과 동일하게 작성
			formData.append("awsfile",files[i]);
		}
		
		// 파일 업로드 ajax
		$.ajax({
			url:"/hiphople/uploadS3",
			data: formData,
			dataType: "json",
			// processData와 contentType은 파일 업로드 시 false가 되어야 한다
			processData: false,
			// contentType : 기본값은 true, application/x-www-form-urlencoded 타입
        	// multipart/form-data 방식으로 전송하기 위해 false
			contentType: false,
			type: "POST",
			success: function(data){
				//alert("업로드 완료")
				console.log(data);
				showUploadFile(data); //첨부파일 출력 메소드 호출
			}
		})// ajax 끝  
	})
	
	
	//업로드 파일 출력
	function showUploadFile(uploadResultArr){
				
		var str = "";
			
		//data는 배열 for문과 같은 반복문을 이용하여 0~배열 끝까지 화면에 출력(each)
		$(uploadResultArr).each(function(i, obj){
			var fileCallPath = obj.uploadPath + "/" + obj.uuid +"_"+ obj.fileName;
			console.log(fileCallPath);
				
			//이미지파일이 아니면(image-false)
			if(!obj.image){	
				/*str+="<li><a href='/hiphople/download?fileName="+ fileCallPath +"'>" + "<img src='resources/image/attach.png'>" + obj.fileName + "</a></li>";*/
				str+="<li><a href='/hiphople/download?fileName="+ fileCallPath +"'>" + "<i class='fas fa-paperclip'></i>" + obj.fileName + "</a></li>";
					
			}else{
			//이미지파일이면(image:true) - display 웹에 이미지 출력
					
				str+= "<li class='thumimg'  data-fileName='"+ obj.fileName +"' data-uuid='"+ obj.uuid +"' data-uploadpath='"+ obj.uploadPath +"' data-fileType='"+ obj.image +"'>"
					+ "<a href='"+fileCallPath+"' target='_blank'><img src='"  + fileCallPath +"'></a></br>"
					+ "<span class='deleteimg' data-file='"+ obj.fileName +"' data-uuid='"+ obj.uuid +"' data-type='image'>[이미지삭제]<span></li>";	
					//span 태그에 data-file, data-type 정보 담기
				}
			})
			$(".uploadResult ul").append(str);	
		}
		
	
	// 이미지 삭제
	$(".uploadResult").on("click",".deleteimg", function(e){
		
		var fileName = $(this).data("file") // 파일명
		var uuid = $(this).data("uuid")	// uuid
		var type = $(this).data("type") // 이미지 타입
		
		var closeImg = $(this).closest("li");
		
		//alert(fileName)
		//alert(type)
	
		//파일 종류가 이미지일 때 삭제하도록 1.파일이름 / 2. 이미지 파일 여부 값
		$.ajax({
			url:"/hiphople/deleteS3",
			data: {fileName: fileName, uuid:uuid, type:type}, //파일(경로 url + 파일명), 이미지타입
			dataType: "text",
			type: "POST",
			success: function(data){
					alert("삭제되었습니다.");
					closeImg.remove(); // 화면의 파일 표시 영역 삭제
					//console.log(data);
					},
			error: function(error, textStatus){ 
				alert("삭제 실패");
				console.log(error);
				console.log(textStatus);
				//textStatus 오류 유형 확인
				}
		}) // ajax 끝
	})	// 삭제 클릭 이벤트 끝
	
	
	// 글쓰기 버튼을 클릭하면 이벤트 start
	// input 태그 중에서 type 속성이 submit과 같은 것을 선택
	// 게시글 입력/수정 submit 처리시에 첨부파일 정보도 함께 처리
	$("input[type='submit']").click(function(e){
		
		e.preventDefault();
		alert("글쓰기 전송");
		
		var fileName=$("#fileName").val();
		var uploadPath=$("#uploadPath").val();
		var str="";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj=$(obj);
			console.log(jobj);
			
			str+= "<input type='text' id='fileName' name='attachList["+ i +"].fileName' value='"+ jobj.data("filename") +"'/>";
			str+= "<input type='text' id='uuid' name='attachList["+ i +"].uuid' value='"+ jobj.data("uuid") +"'/>";
			str+= "<input type='text' id='uploadPath' name='attachList["+ i +"].uploadPath' value='"+ jobj.data("uploadpath") +"'/>";
			str+= "<input type='text' name='attachList["+ i +"].fileType' value='"+ jobj.data("filetype") +"'/>";
			
		})
		//formObj에 str을 추가(append)하여 submit
		formObj.append(str).submit();
		
		//$(".uploadResult1").html(str);
	
	})	//글쓰기 버튼을 클릭하면 이벤트 끝
	
})	// document 끝