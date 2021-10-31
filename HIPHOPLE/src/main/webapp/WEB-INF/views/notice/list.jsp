<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice – HIPHOPLE</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="notice_area">
		<div class="notice_title"><h1 class="catenotice">NOTICE</h1></div>
			<c:forEach items="${list}" var="notice"> 
			<ul class="notice_list">
				<li class="n_content">
					<div class="n_title"><a href="/hiphople/notice/view?bno=${notice.bno}&pageNum=${pageMaker.cri.pageNum}">${notice.title}</a></div>
					<div class="n_date"><fmt:parseDate var="writeDate" value="${notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
					<fmt:formatDate value="${writeDate}" pattern="yyyy년 M월 d일"></fmt:formatDate></div>
				</li>
			</ul>
			</c:forEach>

			<!-- 관리자 글쓰기 허용 -->
			<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
			<div class="notice_write"><button class="writebtn"  onclick="location.href='/hiphople/notice/write'">WRITE</button></div>
			</sec:authorize> 
	</div><!-- notice overall -->
	
	<!-- 공지사항 페이징 -->
	<div class="pagenumCount" id="noticepg" style="text-align: center; padding: 10px;" >
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
	
	<%@include file="../include/footer.jsp"%>
</body>
</html>