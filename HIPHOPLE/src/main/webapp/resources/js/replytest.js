

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
		
		//method 방식이 get인 ajax시작($.getJSON)
		//function은 data를 controller에게 주기위해 필요._.
		//$.getJSON(서버 URL,[,데이터][,성공])
		//$() 괄호 안에 들어가는 것은 선택자, 

		$.getJSON("/hiphople/replies/all/" + bno + "/" + page, function(data){
	
			console.log(data);
			var str="";
			
			$(data.list).each(function(){
				str +="<li data-rno='" + this.rno + "'class='replyLi'>"
				+ this.rno + "(댓글번호): " +  "작성자:" + this.replyer +  "내용:" + this.replytext + "<button class='replymodbtn'>수정</button></li>";
			});
			
			
			/*
			$(data.list).each(
			function(){
				str +="<div data-rno='" + this.rno + "'class='replyLi'>" + "<div class='replyer'>" + this.replyer + "</div>" + this.replytext + "<div class='replymod'><button class='replymodify'>수정</button></div></div>";
			});
			*/
			
			/*
			$(data.list).each(
			function(){
				str +="<div data-rno='" + this.rno + "'class='replyLi'>";
				str +="<div class='replyer'>" + this.rno+this.replyer+"</div>"; 
				str +="<div class>" + this.replytext + "</div>"; 
				str +="<div class='replymod'><button class='replymodify'>수정</button></div></div>";
			});
			*/
			
			//댓글 페이징
			console.log("댓글 전체수 =" + data.replycnt);
			
			//댓글 총 카운트 가져오기
			var recnt=data.replycnt;
			$("#recnt").html("댓글 ( " + recnt + " )");
			
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
	$("#replybtn").on("click", function(){
		var replyer = $("#newReplyWriter").val(); //댓글 작성자
		var replytext = $("#newReplyText").val(); //댓글 내용
		
	//댓글쓰기 ajax
	$.ajax({
		type : "post",
		url : "/hiphople/replies",
		headers : { //json 타입으로 데이터 넘길 때는 headers 삽입(json 타입 선언)해주기
			"Content-Type":"application/json",
			"X-HTTP-Method-Override":"POST"},
		dataType: "text",
		data : JSON.stringify({bno : bno, replyer : replyer, replytext : replytext}),
		success : function(result){
				
				if(result == "SUCCESS"){
					
					alert("댓글 등록완료");
					getAllList(page); //get 함수호출	
				}
				//,	errore:function(err){		
			}
		})//end 댓글 쓰기 ajax
		
	})//end 댓글쓰기 버튼 클릭 이벤트
	
	
		//댓글 수정버튼 클릭하면 댓글 수정창 오픈
		$("#replies").on("click", ".replyLi button", function(e){
			
			e.preventDefault();
			//기본 세팅 이벤트 삭제
			
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
				url: "/hiphople/replies/" + rno,
				headers: {
					"Content-Type":"application/json",
					"X-HTTP-Method-Override":"DELETE"},
				dataType: "text",
				success: function(result){
					console.log("result :" + result);
					if(result == "SUCCESS"){
						alert("댓글 삭제완료");
						$("#modDiv").hide("slow");
						getAllList(page);						
					}
				}
			})
	
		})//삭제 버튼 클릭 끝
			
		//댓글 수정창에서 수정버튼을 클릭했을때
		$("#replyModBtn").on("click", function(){
			var rno = $(".modal-title").html(); 	//rno값 가져오기
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
						getAllList(page);						
					}
				}
			})//수정 작업 끝
		})	
			//닫기 버튼 눌렀을때
			$("#closeBtn").on("click", function(){
				
			$("#modDiv").hide("slow"); 
	})
	
})//end document

