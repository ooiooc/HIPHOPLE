<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %><!-- jstl(fmt)로 날짜 포맷에 맞게 출력 -->  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- fn 함수 이용하여 줄바꿈, 공백, 개행 replace 처리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/view.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/view.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	
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
		<div class="notice_title"><h1 class="catetitle">COMMUNITY</h1></div>		
			<ul class="notice_box">
				<li class="n_titlebox">
					<div class="n_title">${view.title}</div>
					<div class="n_date"><fmt:parseDate var="writeDate" value="${view.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
					<fmt:formatDate value="${writeDate}" pattern="yyyy년 M월 d일"></fmt:formatDate></div>
				</li>
			</ul> <!-- notice list -->
		
		<div class="notice_content">
			<!--  내용 -->
			<div class="n_content">
			${fn:replace(view.content, replaceChar, "<br/>")}
			</div>
			
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
	
	<%@include file="../include/footer.jsp"%>
</body>
</html>