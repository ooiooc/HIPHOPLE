<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- jstl(fmt)로 날짜 포맷에 맞게 출력 -->    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세페이지</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/view.js"></script></head>

<link rel="stylesheet" type="text/css" href="../resources/css/view.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>

	
	<h1>상세페이지</h1>
	
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
	
	<input type="hidden" name="pageNum" value="${cri.pageNum}">

	<table border="1" width="400">
		<tr>
			<td colspan="4" class="bnoArea">
			<span></span><input type="text" name="bno" id="bno" value="${view.bno}"></td>
		</tr>
		<tr>
			<td colspan="4">${view.title}</td>
		</tr>
		
		<tr> 
			<td>작성자</td>
			<td>${view.writer}</td>
			<td>조회수</td>
			<td>${view.viewcnt}</td>
		</tr>
		
		<tr>	
			<td>작성일</td>
			<td colspan="3">
			<fmt:parseDate var="writeDate" value="${view.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			<fmt:formatDate value="${writeDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate></td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td colspan="3">${view.content}</td>
		</tr>
		
		<tr style="text-align: center;">
			<td colspan="4">
			<c:if test="${login != null}">	
			<button type="button" class="btn-warning">수정</button>
			<button type="button" class="btn-danger">삭제</button>
			</c:if>
			<button type="button" class="btn-primary">목록</button>
			</td>
		</tr>
	
		
		<!-- 업로드 영역 -->
		<tr>
			<td colspan="4" class="uploadResult">
			<h4 style="text-align: center;">파일 업로드 목록</h4>
				<ul></ul>
			</td>
		</tr>
		
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
	</table>	
	</form>
</body>
</html>