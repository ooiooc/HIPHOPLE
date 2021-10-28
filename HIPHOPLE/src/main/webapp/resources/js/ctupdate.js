/**
 * 
 */

$(document).ready(function(){
	var formObj = $("form[role='form']"); // 
	
	console.log(formObj);
	/* 
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
	*/
	//bno값을 저장하는 변수
	var bno = $("#bno").val()
		alert(bno);
		console.log(bno);	
	/* 
	//기존 attach 리스트 불러오기
	$.getJSON("/hiphople/contents/getAttachlist", {bno:bno}, function(arr){
		console.log(arr);		
		
		var str = "";
		
		$(arr).each(function(i, attach){ //arr[i]에 있는 값을 attach에 넣는 것을 반복
			
			var fileCallPath = encodeURIComponent(attach.uploadPath + "/" + attach.uuid +"_"+ attach.fileName);

			//파일 타입에 따라 이미지 여부 확인
			// encodeURIComponent 특정 문자를 유니코드 형식으로 변환
			if(attach.fileType){ //image type
				var sfileCallPath = encodeURIComponent(attach.uploadPath + "/s_" + attach.uuid +"_"+ attach.fileName);
				str+= "<li><img src='/hiphople/display?fileName=" + sfileCallPath +"'><img class='deleteicon' src='/hiphople/resources/image/icon/trash.svg'></li>";
			
			}else{ //other type
				str+= "<li><a href='/hiphople/download?fileName="+ sfileCallPath +"'>"+ attach.fileName + "</a><img class='deleteicon' src='/hiphople/resources/image/icon/trash.svg'></li>";			
				
			}
			
		})
		
		$(".uploadResult ul").html(str);
	})// 기존 이미지 불러오기 끝
	 */

	//이미지 추가
	//파일 업로드 정규식 검사
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
	}//추가 끝
		
	
	$("input[type='file']").change(function(e){
 
	var formData = new FormData();  //폼 태그에 대응되는 객체
    var inputFile = $("input[name='file']");
    var files = inputFile[0].files;
   
	console.log(formData);


    // formData 에 file 추가
    for (var i = 0; i < files.length; i++) {
       if (!checkExtension(files[i].name, files[i].size)) {
          return false;
       }
       formData.append("file", files[i]);
    }
   
   
    $.ajax({
      url: '/hiphople/uploadAjax',
      processData: false,
      contentType: false,
      data: formData,
      type: 'POST',
      dataType: 'json',  
      success: function(result){
		 alert("업로드 완료")	
         console.log(result); 
         showUploadResult(result);  //업로드 결과 처리 함수
      }
   });
   
});
	
	
	//업로드 파일 출력
	function showUploadFile(uploadResultArr){
			
		if (!uploadResultArr || uploadResultArr.length == 0) {return;}
   
   		//var uploadUL = $(".uploadResult ul");	
		var str = "";
			
	//data는 배열 for문과 같은 반복문을 이용하여 0~배열 끝까지 화면에 출력(each)
		$(uploadResultArr).each(function(i, obj){
		
			var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid +"_"+ obj.fileName);
				
			if(!obj.image){	
			
				str+="<li><a href='/hiphople/download?fileName="+ fileCallPath +"'>" + "<i class='fas fa-paperclip'></i>" + obj.fileName + "</a></li>";
					
			}else{ //image type
			
				str+= "<li class='thumimg'  data-fileName='"+ obj.fileName +"' data-uuid='"+ obj.uuid +"' data-uploadpath='"+ obj.uploadPath +"' data-fileType='"+ obj.image +"'>"
					+ "<img class='deleteicon' src='/hiphople/display?fileName=" + fileCallPath +"'>"
					+ "<span class='deleteimg' data-file='"+ fileCallPath +"' data-type='image'><img class='deleteicon'  src='/hiphople/resources/image/icon/trash.svg'><span>" +"</li>";	
				}
					
			})
			
			$(".uploadResult ul").append(str);
		}

	//첨부파일 삭제
	$(".uploadResult").on("click", ".deleteicon", function(e){
  	console.log("delete file");
   	if(confirm("선택하신 파일을 삭제하시겠습니까?")) {
    	var targetLi = $(this).closest("li");
      	targetLi.remove();
   		}
	});//이미지 삭제 끝
	
	//새로 추가한 파일로 수정하려면
		//글쓰기 버튼을 클릭하면 이벤트 start
	//input 태그 중에서 type 속성이 submit과 같은 것을 선택
	// 게시글 입력/수정 submit 처리시에 첨부파일 정보도 함께 처리
	$(".modifybtn").click(function(e){
		
		e.preventDefault();
		alert("글쓰기 전송");
		
		//alert("글쓰기 성공");
		
		var str="";
		$(".uploadResult ul li").each(function(i,obj){
			var jobj=$(obj);
			console.log(jobj);
			
			str+= "<input type='text' name='attachList["+ i +"].fileName' value='"+ jobj.data("filename") +"'/>";
			str+= "<input type='text' name='attachList["+ i +"].uuid' value='"+ jobj.data("uuid") +"'/>";
			str+= "<input type='text' name='attachList["+ i +"].uploadPath' value='"+ jobj.data("uploadpath") +"'/>";
			str+= "<input type='text' name='attachList["+ i +"].fileType' value='"+ jobj.data("filetype") +"'/>";
			
		})
		//formObj에 str을 추가(append)하여 submit
		formObj.append(str).submit();
		//$(".uploadResult1").html(str);
	
	})//글쓰기 버튼을 클릭하면 이벤트 end
});