<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	
	<ul>
		<li><a href="/hiphople/">홈으로 가기</a></li>
	<c:if test="${login == null}">	
		<li><a href="/hiphople/member/signup">회원가입</a></li>
		<li><a href="/hiphople/member/login">로그인</a></li>
	</c:if>
	</ul>
	
	<div>
		<c:if test="${login != null}">		
		${login.username}님 안녕하세요.	
		<a href="/hiphople/member/logout">로그아웃</a>
		</c:if>
	</div>
	<hr>
	
	<!-- 카테고리 박스 : 공지사항 -->
	<div class="category_notice" style="width:100px; 1px solid #000;">
		<div class="cate_title"><span>공지사항</span></div>
	</div><!--  -->
	
	<table border="1" style="text-align:center">
		<tr>
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<!-- 타이틀란은 반복 x -->
		
		<c:forEach items="${list}" var="notice"> <!-- 한 건씩 불러들여서 처리 -->
		
		<tr>
			<td>${notice.bno}</td>
			<td><a href="/hiphople/notice/view?bno=${notice.bno}&pageNum=${pageMaker.cri.pageNum}">${notice.title}</a></td>
			<td>${notice.writer}</td>
			<td>
			<fmt:parseDate var="writeDate" value="${notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			<fmt:formatDate value="${writeDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
			</td>
			<td>${notice.viewcnt}</td>
		</tr>
		</c:forEach>
		
	<%-- 	<c:if test="${login != null}">	 --%>	
		<tr>
			<td colspan="5"><!-- <input type="submit" value="글쓰기" class="btn-register"> -->
			<!-- a 태그는 get 방식으로 처리 -->
			<button><a href="/hiphople/notice/write">글쓰기</a></button>
			</td>
		</tr>
	<%-- 	</c:if> --%>
	</table>
	
	<!-- 페이징 -->
	<div class="pagenumCount" style="text-align: center; padding: 10px;" >
	<c:if test="${pageMaker.prev}">
	<a href="/hiphople/notice/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
	</c:if>
		
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	 <a href="/hiphople/notice/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
	</c:forEach>
	
	<c:if test="${pageMaker.next}">
	<a href="/hiphople/notice/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
	</c:if>
	</div>
	
	<!-- 공지사항 검색 -->
	<form action="/hiphople/notice/list" method="get">
	<div class="search" style="text-align: center;">
	<select name="type"><!-- 내가 검색창에서 선택한 옵션과 검색어를 남겨주기 위해서 아래와 같이 추가 (selected) -->
		<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
		<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
		<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
		<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 + 내용</option>
		<option value="CW" <c:out value="${pageMaker.cri.type eq 'CW'? 'selected':''}"/>>내용 + 작성자</option>
		<option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>제목 + 내용 + 작성자</option>
	</select>
	
	<input type="text" name="keyword" placeholder="검색어를 입력하세요" value="${pageMaker.cri.keyword}">
	<button type="submit">검색</button>
	</div>
	</form>
	
	
</body>
</html>