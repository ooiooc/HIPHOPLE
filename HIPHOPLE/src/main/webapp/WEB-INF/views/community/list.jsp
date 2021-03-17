<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- fn 함수 이용하여 줄바꿈, 공백, 개행 replace 처리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="comwrap">
	<h1 class="community_title">COMMUNITY</h1>
	<ul class="comlist">		
		<li class="comsubtitle"><a href="/hiphople/community/list">ALL</a></li>
		<li class="comsubtitle"><a href="/hiphople/community/list?type=F&category=music">음악</a></li>
		<li class="comsubtitle"><a href="/hiphople/community/list?type=F&category=review">리뷰</a></li>
		<li class="comsubtitle"><a href="/hiphople/community/list?type=F&category=lyrics">가사해석</a></li>
		<li class="comsubtitle"><a href="/hiphople/community/list?type=F&category=artwork">그림아트웍</a></li>
		<li class="comsubtitle"><a href="/hiphople/community/list?type=F&category=fboard">일반</a></li>
	</ul>
	<table class="combox">
		<tr class="comtr">
			<th>번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일</th>
			<th>조회수</th>
		</tr>
		<c:if test='${list.isEmpty()}'>
		<tr>
			<td colspan="5"><p class="nolist">작성된 게시글이 없습니다.</td>
		</tr>
		</c:if>
		<c:forEach items="${list}" var="comm">
		<tr class="comtr">
			<td>${comm.bno}</td>
			<td><a href="/hiphople/community/view?bno=${comm.bno}&pageNum=${pageMaker.cri.pageNum}">${comm.title}</a></td>
			<td>${comm.writer}</td>
			<td>
			<fmt:parseDate var="writeDate" value="${comm.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
			<fmt:formatDate value="${writeDate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
			</td>
			<td>${comm.viewcnt}</td>
		</tr>
		</c:forEach>
		
		<sec:authorize access="isAuthenticated()">
		<tr>
			<td colspan="5"><!-- 내가 작성한 글 보기-->
			
			<button type="button" class="allmypost" onclick="location.href='/hiphople/community/list?type=W&keyword=${mypost}'">내가 쓴 글</button>
 			
 			</td>
		</tr>

		<tr>
			<td colspan="5"><!-- <input type="submit" value="글쓰기" class="btn-register"> -->
			<!-- a 태그는 get 방식으로 처리 -->
			<button type="button" class="cmwrite" onclick="location.href='/hiphople/community/write'">WRITE</button>
			</td>
		</tr>
		</sec:authorize>
	</table>
	
	<!-- 페이징 pagenumCount-->
	<div class="comm_pgnum" style="text-align: center; padding: 10px;" >
	<c:if test="${pageMaker.prev}">
	<a href="/hiphople/community/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
	</c:if>
		
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	 <a href="/hiphople/community/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
	</c:forEach>
	
	<c:if test="${pageMaker.next}">
	<a href="/hiphople/community/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
	</c:if>
	</div>
	
	<!-- community 검색 -->
	<form action="/hiphople/community/list" method="get">
	<div class="cmsearch" style="text-align: center;">
	<select class="cmsearchbar" name="type"><!-- 내가 검색창에서 선택한 옵션과 검색어를 남겨주기 위해서 아래와 같이 추가 (selected) -->
		<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
		<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
		<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
		<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 + 내용</option>
		<option value="CW" <c:out value="${pageMaker.cri.type eq 'CW'? 'selected':''}"/>>내용 + 작성자</option>
		<option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>제목 + 내용 + 작성자</option>
	</select>
	
	<input type="text" class="cmsearchip" name="keyword" placeholder="검색어를 입력해주세요" value="${pageMaker.cri.keyword}">
	<button type="submit" class="cmsearchbtn">검색</button>
	</div>
	</form>
	</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>