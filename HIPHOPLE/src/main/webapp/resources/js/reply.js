

//document 선택자, ready 이벤트
$(document).ready(function(){
// 댓글 전체 리스트(페이징 처리 된 것)
	var bnoValue = $("#bno").val(); //id가 bno인 것 선택
	var bno = bnoValue; //게시판 번호
	var page = 1; //페이지 번호
	
	getAllList(page);			//getAllList 함수 호출
		
	//전체 댓글 불러오기
	function getAllList(page){	//getAllList 함수 선언
		
		$("#modDiv").hide(); // 댓글 수정창 숨기기
		var str="";
		//method 방식이 get인 ajax시작($.getJSON)
		//function은 data를 controller에게 주기위해 필요._.
		//$.getJSON(서버 URL,[,데이터][,성공])
		//$() 괄호 안에 들어가는 것은 선택자, 
		
		

	
		$.getJSON("/hiphople/replies/all/" + bno + "/" + page, function(data){
	
			console.log(data);
			//var str="";
			var recnt=data.replycnt;
			$("#recnt").html("댓글 ( " + recnt + " )");
			/*
			$(data.list).each(
			function(){
				str +="<li data-rno='" + this.rno + "'class='replyLi'>"
				+ "<p class='replyer'>" + this.replyer + "</p>"+  "<p class='replytext'>" + this.replytext + "</p>"+ "<button type='button'>수정</button></li>";
			});
			*/
			
			/*
			$(data.list).each(
			function(){
				str +="<div data-rno='" + this.rno + "'class='replyLi'>" + "<div class='replyer'>" + this.replyer + "</div>" + this.replytext + "<div class='replymod'><button class='replymodify'>수정</button></div></div>";
			});
			*/
		if(recnt == 0){
				str = "<p id='noreply'>등록된 댓글이 없습니다.</p>";
				$("#replies").html(str);
			
			}else{
			
			$(data.list).each(function(){
				str +="<div data-rno='" + this.rno + "'class='replyLi'>"
				+"<p class='replyer'>"+ this.replyer
				+"<span class='replydate'>" + this.regdate + "</span></p>"
				+"<p class='replyid'>"+ this.replyid +"</p>"
				+"<p class='replytext'>" + this.replytext + "</p>"
				+"<a class='replymodify'>수정</a></div>";
			});
			
			
			//댓글 페이징
			console.log("댓글 전체수 =" + data.replycnt);
			
			//댓글 총 카운트 가져오기
			//var recnt=data.replycnt;
			//$("#recnt").html("댓글 ( " + recnt + " )");
			
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
			
		//페이징 영역	
		$("#replyPage").html(pagestr);
		
		//댓글 리스트
		$("#replies").html(str);	
		}
	}) // json
	//alert("댓글리스트 불러오기")
}//end 댓글리스트 getAllList 

	
		$("#replyPage").on("click","li a", function(e){
			e.preventDefault();//이벤트취소
			
			var targetPageNum=$(this).attr("href");
			page = targetPageNum;
			
			getAllList(page);
		})//
	

		//댓글 등록
			$("#replybtn").on("click", function(){
				var replyid = $("#newReplyUserid").val(); //댓글 작성자 아이디
				var replyer = $("#newReplyWriter").val(); //댓글 작성자
				var replytext = $("#newReplyText").val(); //댓글 내용
			
		//댓글 작성 ajax
		$.ajax({
			type : "post",
			url : "/hiphople/replies",
			headers : { //json 타입으로 데이터 넘길 때는 headers 삽입(json 타입 선언)해주기
				"Content-Type":"application/json",
				"X-HTTP-Method-Override":"POST"},
			dataType: "text",
			data : JSON.stringify({bno : bno, replyer : replyer, replyid : replyid, replytext : replytext}),
			success : function(result){
					
					if(result == "SUCCESS"){
						
						alert("댓글이 등록되었습니다.");
						getAllList(page); //get 함수호출	
					}
					//,	errore:function(err){		
				}
			})//end 댓글 쓰기 ajax
			
		})//end 댓글쓰기 버튼 클릭 이벤트
	
	
		// 댓글 수정버튼 클릭 -> 댓글 수정창 오픈
		$("#replies").on("click", ".replyLi a", function(e){
			
			e.preventDefault();
			//이벤트 삭제
			
			//var reply = $(this).parent();
			//var rno = reply.attr("data-rno");
			//var replytext = reply.text();//reply.html은 button 태그까지 같이 들고온다
			
			var reply = $(this).parent();
			var rno = reply.attr("data-rno");
			var replyer = reply.find(".replyer").text(); 
			var replyid = reply.find(".replyid").text(); 
			var replytext = reply.find(".replytext").text(); 
			var newreplyid = $("#newReplyUserid").val();
			
			// 현재 접속 중인 아이디와 댓글 작성 아이디와 일치할 경우 수정창 보이기
			if(newreplyid == replyid){
				alert("현재 세션 접속 중인 아이디와 댓글 아이디가 일치합니다.");
				//alert(rno + ":" + replytext + " [작성자]"+ replyer+" [작성자 아이디]" + replyid);
			
				// 기존의 댓글 불러오기
				$(".modal-title").val(rno); 
				$("#replyid").val(replyid); 
				$("#replytext").val(replytext); 
				//$(".modal-title").html(rno);
				///$("#replyer").val(replyer);
	
				$("#modDiv").show("slow"); //수정창 보이기
			}
			
		})//end 수정 버튼 클릭이벤트
		
		// 댓글 삭제
		$("#replyDelBtn").on("click", function(){
			
			if(confirm("댓글을 삭제하시겠습니까?")){
			//댓글번호
			//var rno = $(".modal-title").html(); //rno값 가져오기
			var rno = $(this).parent().parent().find(".modal-title").val();
			
			$.ajax({
				type: "delete",
				url: "/hiphople/replies/" + rno,
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"},
				dataType: "text",
				success: function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("댓글 삭제완료");
						$("#modDiv").hide("slow"); //수정창 숨기기
						getAllList(page);						
					}
				}
			})//ajax
		}
		
		})//삭제 버튼 클릭 끝
			
		// 댓글 수정 put
		$("#replyModBtn").on("click", function(){

			// 댓글 선택자 
			var reply = $(this).parent().parent(); // 댓글번호 var reply_no = reply.find("#reply_no").val(); // 수정한 댓글내용 var reply_text = reply.find("#reply_text").val();
			var rno = reply.find(".modal-title").val();
			//var rno = $(".modal-title").html(); 	//rno값 가져오기
			var replytext = $("#replytext").val(); //댓글내용 가져오기
			
			$.ajax({
				type: "put",
				url: "/hiphople/replies/" + rno,
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"PUT"},
				data:JSON.stringify({replytext:replytext}),
				dataType: "text",
				success: function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("댓글 수정완료");
						$("#modDiv").show(); //모달 창 보여주기
						getAllList(page);	// 댓글 목록 갱신					
					}
				}
			})//수정 작업 끝
		})	
			
			// 댓글 수정창 닫기
			$("#closeBtn").on("click", function(){
			$("#modDiv").hide("slow"); 
	})
	
})//end document
