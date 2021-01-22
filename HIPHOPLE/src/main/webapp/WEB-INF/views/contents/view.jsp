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
<title>Contents – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/reply.js"></script>
<script type="text/javascript" src="../resources/js/ctview.js"></script></head>
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
				<!-- bno -->
				<input type="text" name="bno" id="bno" value="${view.bno}">
				<input type="hidden" name="pageNum" value="${cri.pageNum}">
				<div style="width: 140px; margin:0 auto; padding: 2px 2px; text-align: center; background: #999999;">
				<h3 style="letter-spacing: 2px; font-weight: 400; font-size: 16px; color: #E9E9E9; text-align: center;">${view.category}</h3>
				</div>
				<h1 style="letter-spacing: 2px; font-weight: 500; font-size: 30px; color: #999999;">${view.title}</h1><!-- category -->
			</div>
			<div class="article_writer" style="letter-spacing: 1px; font-weight: 400;color:#999999; text-align: right; padding-right: 10px;">
			<fmt:parseDate var="writeDate" value="${view.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			<fmt:formatDate value="${writeDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>&emsp;/&emsp;${view.viewcnt} views
			</div>
			<div class="contsimg">
				<ul>
				</ul>
			</div>
			<div class="article_text">
				<p class="contstext">
				${fn:replace(view.content, replaceChar, "<br/>")}
				</p>
			</div>
			
			
		<!-- 업로드 영역 -->
			
		</div><!-- article box -->
			<!-- article 목록 수정 버튼 -->
			<div class="buttonList">
				<button type="button" class="article_btn" id="contListbtn">목록</button>&emsp;
				<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
				<button type="button" class="article_btn" id="contModbtn">수정</button>&emsp;
				<button type="button" class="article_btn" id="contDelbtn">삭제</button>
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
				
				<div id="replies" class="noreply">
				</div>
				
				
				<!-- 댓글 수정창 --><!-- 로그인 아이디와 댓글 아이디가 일치하면 수정창 출력 -->
				<%-- <sec:authentication property="principal.username" var="currentUser"/>
				<c:if test= "${currentUser == replyid}"> --%>
				<div id="modDiv">
					<div class="modal-title"></div>
					<!-- <div id="replywriter">작성자<input type="text" id="rewriter"></div> -->
					<div class="retext">
					<textarea cols="60" rows="10" id="replytext" class="replymodtext"></textarea></div> 
					<div class="modDivbtn">
						<button type="button" id="replyModBtn">수정</button>
						<button type="button" id="replyDelBtn">삭제</button>
						<button type="button" id="closeBtn">닫기</button>
					</div>
				</div><!-- 수정창 끝 -->
				<%-- </c:if>  --%>	
			</div><!-- 댓글 리스트 -->
			
			<!-- 댓글 페이징 -->
			<div class="replyPagebox">
				<ul id="replyPage">
				</ul>
			</div>
			
			<!-- 댓글 작성란 -->	
			<div class="replyForm">
				<div class="reply_writer">
				<!-- 댓글 작성자 이름/아이디 -->
				<input class="reply_writerbox" id="newReplyUserid" type="hidden" value="${userid}"></div>
				<input class="reply_writerbox" id="newReplyWriter" type="hidden" value="${writer}"></div>
				
					<!-- 회원 댓글창 -->
					<sec:authorize access="isAuthenticated()">
					
					<div class="reply_text">
					<textarea class="reply_textbox" id="newReplyText" cols="60" rows="10" placeholder="댓글을 입력해주세요"></textarea>
					</div>
					<div class="replySumbit"><button type="submit" id="replybtn">등록</button></div>
					
					</sec:authorize>
					
					<!-- 비회원 댓글창 -->
					<sec:authorize access="!isAuthenticated()">
					<div class="reply_text">
					<a href="/hiphople/member/signin">
					<textarea class="reply_textbox" id="newReplyText" cols="60" rows="10" placeholder="" >댓글 쓰기 권한이 없습니다. 로그인 하시겠습니까?</textarea>
					</a>
					</div>
					<div class="replySumbit"><button type="submit" id="replybtn" disabled="disabled">등록</button></div>
					</sec:authorize>
			</div>
			
		</div><!-- end 댓글 -->
	</div><!-- wrap -->
	</form>
	
	<%@include file="../include/footer.jsp"%>
</body>
</html>

