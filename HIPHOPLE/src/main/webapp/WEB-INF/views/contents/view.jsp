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
<script type="text/javascript" src="../resources/js/reply.js"></script>
<link rel="stylesheet" type="text/css" href="../resources/css/view.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<form role="form">
	<div class="contentswrap">
		<div class="contsbox">
			<div class="article_title">
			<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<!-- bno -->
				<input type="text" name="bno" id="bno" value="${view.bno}">
				<div style="width: 140px; margin:0 auto; padding: 2px 2px; text-align: center; background: #999999;">
				<h3 style="letter-spacing: 2px; font-weight: 400; font-size: 16px; color: #E9E9E9; text-align: center;">${view.category}</h3>
				</div>
				<h1 style="letter-spacing: 2px; font-weight: 500; font-size: 30px; color: #999999;">${view.title}</h1><!-- category -->
			</div>
			
			<div class="article_text">
				<p style="font: bold;">
				${fn:replace(view.content, replaceChar, "<br/>")}
				</p>
			</div>
			<div class="article_writer">
			<fmt:parseDate var="writeDate" value="${view.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			<fmt:formatDate value="${writeDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>&emsp;/&emsp;조회 수 ${view.viewcnt}
			</div>
			
		</div><!-- article box -->
			<!-- article 목록 수정 버튼 -->
			<div class="buttonList">
				<button type="button" class="article_btn" onclick="location.href='/hiphople/contents/list'">목록</button>&emsp;
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
				<button type="button" class="article_btn">수정</button>
				</sec:authorize>
			</div>
		
		<!-- 댓글 -->
		<!-- 전체댓글 보기 -->
		<div class="replies_wrap">
			<!-- 댓글 리스트 -->
			<div class="repliesList">
				<!-- 총 댓글 수 -->
				<p id="recnt" style="font-weight: 400; font-size: 17px; letter-spacing: 1px;"></p>
				<!-- 작성된 댓글 리스트 -->
				<!-- <ul id="replies">	
				</ul> -->
				<div id="replies">
				</div>
				
				<!-- 댓글 수정창 -->
				<div id="modDiv">
					<div class="modal-title"></div>
					<!-- <div id="replywriter">작성자<input type="text" id="rewriter"> -->
					<div class="retext">
					<textarea cols="60" rows="10" id="replytext" class="replymodtext"></textarea></div> 
					<div class="modDivbtn">
						<button type="button" id="replyModBtn">수정</button>
						<button type="button" id="replyDelBtn">삭제</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div><!-- 수정창 끝 -->
			</div><!-- 댓글 리스트 -->
			
			<!-- 댓글 페이징 -->
			<div class="replyPagebox">
				<ul id="replyPage">
				</ul>
			</div>
			
			<!-- 댓글 작성란 -->	
			<div class="replyForm">
					<div class="reply_writer">
					<input class="reply_writerbox" id="newReplyWriter" type="hidden" value="${user}"></div>
					<div class="reply_text">
					<textarea class="reply_textbox" id="newReplyText" cols="60" rows="10" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					
					<div class="replySumbit"><button type="submit" id="replybtn">등록</button></div>
			</div>
		</div><!-- end 댓글 -->
	</div><!-- wrap -->
	</form>
	
	<%@include file="../include/footer.jsp"%>
</body>
</html>

