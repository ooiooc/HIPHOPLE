<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!-- fn 함수 이용하여 줄바꿈, 공백, 개행 replace 처리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/ajaxtest.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style type="text/css">

.content{
	background: #F5F1EA;
	width: 300px;
	height: 300px;
	position: relative;
}

.article{
	width: 100%;
	height: 100px;
	bottom: 0;
	position: absolute;
	text-align: center;
	background: #e2b9b3;
}

h1{
	text-align:center;
	letter-spacing: -1px;
	font-weight: normal;
	
}

p{
	font-size: 14px;
}


.article_box{
	width: 900px;
	margin: 0 auto;
	border: 1px solid #000;
}

.article_title{
	border-bottom: 2px solid #000;
	width: 100%;
	margin: 40px auto;
}

.article_text{
	background: #f9f9f9;
	width: 100%;
	height:600px;
	margin: 100px auto;
}

/* about writer */
.article_writer{
	width: 100%;
	height: 100px;
	text-align: center;
}

/* button area */
.buttonList{
	width: 900px;
	height: auto;
	margin: 20px auto;
	border: 1px solid #000;
	padding: 10px;
	text-align: center;
}

.article_btn{
	border-radius: 8px 8px;
	width: 100px;
	height: 36px;
	font-size: 16px;
	border: 1px solid #000;
}

/* 댓글 */
/* 전체영역 */
.replies_wrap{
	width: 900px;
	margin: 20px auto;
	/* background: pink; */
}

/* 댓글 목록 */
.repliesList{
	width: 100%;
	
	background: #f9f9f9;
	/* border: 1px solid #000; */
}

/* 댓글 타이틀 */
.repliesList p{
	height: auto;
	font-size: 18px;
	padding: 0 10px;
	/* border-bottom: 1px solid #000; */

}

#replies{
	padding:10px 10px;
	border: 1px solid #000;
}

/* 댓글 작성란 */
.replyForm{
	height: auto;
	/* border: 1px solid #000; */
	justify-content: space-between;
	
}

/* 작성자 */
.reply_writer{
	width: 100px;
	text-align:center;
	padding: 10px 10px;
	/* border: 1px solid #000;	 */
}

.reply_writerbox{
	text-align:center;
	width: 80px;
	height: 30px;
	font-size: 16px;
	border-radius: 8px 8px;
	border: 1px solid #000;	
}

.reply_text{
	width:100%;
	padding: 0 10px;
	text-align: left;
	border: 1px solid #000;
}

/* 댓글 textarea */
.reply_textbox{
	vertical-align:middle;
	width:100%;
	height: 80px;
	padding: 10px 10px;
	margin: 10px auto;
	border: 0;
}

/* 댓글 작성 버튼 영역 */
.replySumbit{
	width: 100%;
	/* border: 1px solid #000; */
	/* align-items: flex-end; */
	padding: 10px 10px;
	text-align: right;
}

/* 댓글 작성버튼 */
#replybtn{
	width: 60px;
	/* height:30px; */
	font-size: 16px;
	color:#fff;
	padding:6px 6px;
	border-radius: 8px 8px;
	background: #000;
	border: 0;
}

/* 댓글 페이징 */
.replyPagebox{
	/* background: wheat; */
	text-align: center;
	/* border: 1px solid #000; */
	display: flex;
}

#replyPage{
	display: block;
	justify-content: center;
	margin: 0 auto;
	/* border: 1px solid #000; */
	display:block;
	flex-direction:row;
}


/*  */


</style>
<%@include file="../include/header2.jsp"%>
</head>
<body>
	
	<form role="form" >
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	<div class="wrap">
	<input type="text" name="bno" id="bno" value="${view.bno}">
		<div class="article_box">
			<div class="article_title">
				<h1>category: interview</h1><!-- category -->
				
			</div>
			<div class="article_text">
				<p style="font: bold;">
				${fn:replace(view.content, replaceChar, "<br/>")}
				</p>
			</div>
			<div class="article_writer">
			${view.writer} | 사람과 공간, 그리고 그들에 깃든 이야기를 보고 들어 글을 쓴다. 언젠가 충분히 아름다운 것을 만들고 싶다.
			<br>
			${view.regdate} / 조회수 ${view.viewcnt}
			</div>
			
		</div><!-- article box -->
			<!-- article 목록 수정 버튼 -->
			<div class="buttonList">
				<button type="button" class="article_btn" onclick="location.href='/hiphople/interview/list'">LIST</button>&emsp;
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
				<button type="button" class="article_btn">수정</button>
				</sec:authorize>
			</div>
		
	
		<!-- 댓글 -->
		<!-- 전체댓글 보기 -->
		<div class="replies_wrap">
			<div class="repliesList">
				<p id="recnt"></p>
				<ul id="replies">
				
				</ul>
				
				<!-- 댓글 수정창 -->
				<div id="modDiv">
					<div class="modal-title"></div>
					<div><input type="text" id="replytext"></div>
					<div>
						<button type="button" id="replyModBtn">수정</button>
						<button type="button" id="replyDelBtn">삭제</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div>	
				
			</div><!-- 댓글 리스트 -->
			
			<!-- 댓글 페이징 -->
			<div class="replyPagebox">
				<ul id="replyPage"></ul>
				
			</div>
			
			<!-- 댓글 작성란 -->	
			<div class="replyForm">
					<div class="reply_writer"><input class="reply_writerbox" id="newReplyWriter" type="text" placeholder="작성자" ></div>
					<div class="reply_text">
					<textarea class="reply_textbox" id="newReplyText" cols="60" rows="10" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					
					<div class="replySumbit"><button type="submit" id="replybtn">등록</button></div>
				</div>
		</div>
	</div><!-- wrap -->
	</form>
	
	<%@include file="../include/footer.jsp"%>
</body>
</html>

