/**
 * 
 */

//document 선택자, ready 이벤트
$(document).ready(function(){
// 댓글 전체 리스트(페이징 처리 된 것)
	var bnoValue = $("#bno").val(); //id가 bno인 것 선택
	var bno = bnoValue; //게시판 번호
	var page = 1; //페이지 번호
	
	
	// ↓ 함수를 실행하기 위해서는 호출을 해주어야 한다.
	
	getAllList(page);			//getAllList 함수 호출
		
	function getAllList(page){	//getAllList 함수 선언
		
		$("#modDiv").hide();
		
		
		//method 방식이 get인 ajax시작($.getJSON)
		//function은 data를 controller에게 주기위해 필요._.
		//$.getJSON(서버 URL,[,데이터][,성공])
		//$() 괄호 안에 들어가는 것은 선택자, 

		$.getJSON("/myapp/replies/all/" + bno + "/" + page, function(data){
	
			console.log(data);
			var str="";
		$(data.list).each(
			function(){
				str +="<li data-rno='" + this.rno + "'class='replyLi'>"
				+ this.rno + ":" + this.replytext + "<button>수정</button></li>";
			
			});
			
			
			//댓글 페이징
			console.log("댓글 전체수 =" + data.replycnt)
			
			//endNum
			var endNum = Math.ceil(page/10.0)*10;
			var startNum = endNum - 9;
			var prev = startNum > 1;
			var next = false;
			
			if(endNum*10 >= data.replycnt){
				endNum = Math.ceil(data.replycnt/10.0);
			}
			if(endNum*10 < data.replycnt){
				next = true;
			}
			
			var pagestr="";
			
			//페이징 이전
			if(prev){
				pagestr+= "<li><a href='"+(startNum-1)+"'>이전</a></li>";
			}
			
			for(var i=startNum; i<=endNum; i++){
				var active=page==i?"active":"";
				pagestr += "<li class='page-item"+active+"'><a href='"+i+"'>"+i+"</a></li>";
			}
			
			//페이징 다음
			if(next){
				pagestr+= "<li><a href='"+(endNum+1)+"'>다음</a></li>";
			}
			
		$("#replyPage").html(pagestr);
	
		$("#replies").html(str);	
	
		})
	}//end of getAllList 

	
	//
	$("#replyPage").on("click","li a", function(e){
		e.preventDefault();//이벤트취소
		var targetPageNum=$(this).attr("href");
		page = targetPageNum;
		
		getAllList(page);
	})//
	

	//댓글 등록
	$("#replyAddBtn").on("click", function(){
	
		var replyer = $("#newReplyWriter").val(); //작성자 값 가져오기
		var replytext = $("#newReplyText").val(); //댓글내용 값 가져오기
	
	//댓글쓰기 ajax
	$.ajax({
		type : "post",
		url : "/myapp/replies",
		headers : { //json 타입으로 데이터 넘길 때는 headers 삽입(json 타입 선언)해주기
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		
		dataType: "text",
		data : JSON.stringify({bno : bno, replyer : replyer, replytext : replytext}),
		success : function(result){
				
				if(result == "SUCCESS"){
					
					alert("등록 되었습니다");
					getAllList(page); //get 함수호출	
					
				}
				//,	errore:function(err){		
			}
		
		})//end of 댓글 쓰기 ajax
		

	})//end of 댓글쓰기 버튼 클릭 이벤트
	
		//댓글 수정버튼을 클릭했을 때
		$("#replies").on("click", ".replyLi button", function(e){
			
			e.preventDefault();
			//기본적인 이벤트 빼버리는 것
			
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			
			var replytext = reply.text();//reply.html은 button 태그까지 같이 들고온다
		
			//alert(rno + ":" + replytext);
			$(".modal-title").html(rno);
		
			$("#replytext").val(replytext);
		
			$("#modDiv").show("slow");
			
			
		})//end of 수정 버튼 클릭이벤트
		
		//삭제버튼 클릭했을때
		$("#replyDelBtn").on("click", function(){
			var rno = $(".modal-title").html(); //rno값 가져오기
			
			
			$.ajax({
				type: "delete",
				url: "/myapp/replies/" + rno,
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"},
				dataType: "text",
				success: function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("삭제되었습니다");
						$("#modDiv").hide("slow");
						getAllList(page);						
					}
				}
			})
	
		})//삭제 버튼 클릭 끝
			
		//수정버튼을 클릭했을때
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html(); 	//rno값 가져오기
			var replytext = $("#replytext").val(); //댓글내용 가져오기
			
			$.ajax({
				type: "put",
				url: "/myapp/replies/" + rno,
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({replytext:replytext}),
				dataType: "text",
				success: function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("수정되었습니다");
						$("#modDiv").show(); //모달 창 보여주기
						getAllList(page);						
					}
				}
			})//수정 작업 끝
		})	
			//닫기 버튼 눌렀을때
			$("#closeBtn").on("click", function(){
				
			$("#modDiv").hide("slow"); 
	})
	
})
