<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- jstl(fmt)로 날짜 포맷에 맞게 출력 -->  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/view.js"></script></head>
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/view.css"/> -->
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

<style type="text/css">

/* notice overall */
.notice_wrap{
	width: 100%;
	height: auto;
	/* border: 1px solid #000; */
	margin-bottom: 50px; /* 아래 여백 */
}

/* 공지사항 카테고리 타이틀 */
.notice_title{
	width: 800px;
	text-align:center;
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
	margin: 26px auto;
}

/* 공지사항 박스 */
.notice_box{
	width: 800px;
	margin: 14px auto;
	display: block;
	text-align: center;
	border-top: 1px solid #000;	
	border-bottom: 1px solid #000;
}

n_titlebox{
	border: 1px solid #000;
}

/* 공지사항 타이틀*/
.n_title{
	width:auto;
	font-weight: bold;
	font-size: 18px;
}

/* 공지사항 작성일*/
.n_date{
	color:#E3E4E0;
	font-size: 14px;
}

/* 공지사항 컨텐츠 전체영역 */
.notice_content{
	width: 800px;
	margin: 0 auto;
	/* border: 1px solid #000; */
}

/* 공지사항 내용 */
.n_content{
	width: 100%;
	height: 500px;
	padding: 40px;
	border: 1px solid #fff;
	background: #E3E4E0;
}

/* 공지사항 파일 업로드 */
.uploadResult{
	text-align: center;
	margin-top: 16px;
	border-top: 1px solid #000;	
	border-bottom: 1px solid #000;
	/* border: 1px solid #000; */
}

/* 공지사항 버튼 영역*/
.notice_btn{
	margin: 30px auto;
	text-align: center;
	/* border: 1px solid #000; */
}

/* 목록 수정 삭제 버튼 크기 설정 */
.btn-warning, .btn-danger, .btn-primary{
	width: 60px;
	padding: 8px 8px;
	color:#fff;
	font-size: 15px;
	background: #000;
	border-radius: 10px 10px;
	border: 1px solid #fff;
}

</style>
</head>

<body>

	<!-- 
	<div id="modDiv">
		<div class="modal-title"></div>
		<div><input type="text" id="replytext"></div>
		<div>
			<button type="button" id="replyModBtn">수정</button>
			<button type="button" id="replyDelBtn">삭제</button>
			<button type="button" id="closeBtn">닫기</button>
		</div>
	</div>	 -->
	
	<form role="form">
	<input type="hidden" name="bno" id="bno" value="${view.bno}">
	<input type="hidden" name="pageNum" value="${cri.pageNum}">
	
	<div class="notice_wrap">
		<div class="notice_title"><h1>공지사항</h1></div>		
			<ul class="notice_box">
				<li class="n_titlebox">
					<div class="n_title">${view.title}</div>
					<div class="n_date"><fmt:parseDate var="writeDate" value="${view.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
					<fmt:formatDate value="${writeDate}" pattern="yyyy년 M월 d일"></fmt:formatDate></div>
				</li>
			</ul> <!-- notice list -->
		
		<div class="notice_content">
			<!-- 공지사항 내용 -->
			<div class="n_content">${view.content}</div>
			
			<!-- 업로드 영역 -->
			<div class="uploadResult">
				<h4>파일 업로드 목록</h4>
				<ul>
				</ul>
			</div>
			<!-- 목록 수정 삭제 버튼 영역 -->
			<div class="notice_btn">
				<c:if test="${login != null}">	
				<button type="button" class="btn-warning">수정</button>
				<button type="button" class="btn-danger">삭제</button>
				</c:if>
				<button type="button" class="btn-primary">목록</button>
			</div>
		</div><!-- notice content 끝 -->
		
		
		<!-- 댓글 설정 -->
		<!-- 작성댓글 보이는 공간 -->
		<!-- 
		<tr>
			<td colspan="2">
			<ul id="replies">
			</ul>
			</td>
		</tr> -->
		
		<!-- 댓글 작성란 -->
		<!-- 
		<tr>
			<td>
			작성자 <input type="text" name="replyer" id="newReplyWriter"><br>
			댓글내용 <input type="text" name="replytext" id="newReplyText"></td>
			
			<td><button id="replyAddBtn">댓글 등록</button></td>
			
		</tr>
		
		<tr>
			<td colspan="2">
			<ul id="replyPage">
			</ul></td>
		</tr> -->
	</div><!-- notice overall -->
	</form>
</body>
</html>