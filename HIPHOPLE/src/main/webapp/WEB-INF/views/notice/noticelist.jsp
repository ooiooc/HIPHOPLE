<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<style type="text/css">


.notice_area{
	width: 100%;
	height: auto;
}

.notice_title{
	width: 800px;
	text-align:center;
	border-top: 1px solid #000;
	border-bottom: 1px solid #000;
	margin: 26px auto;
	
}

.notice_list{
	width: 800px;
	margin: 14px auto;
	display: block;
	text-align: center;
	border-top: 1px solid #000;	
	border-bottom: 1px solid #000;
	
}

.n_content{
	padding: 6px;
	
}

.n_title{
	font-weight: bold;
	font-size: 18px;
}
.n_date{
	color:#E3E4E0;
	font-size: 14px;
}
</style>
</head>
<body>

	<div class="notice_area">
		<div class="notice_title"><h1>공지사항</h1></div>
			<c:forEach items="${list}" var="notice"> 
			<ul class="notice_list">
				<li class="n_content">
					<div class="n_title"><a href="/hiphople/notice/view?bno=${notice.bno}&pageNum=${pageMaker.cri.pageNum}">${notice.title}</a></div>
					<div class="n_date"><fmt:parseDate var="writeDate" value="${notice.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
					<fmt:formatDate value="${writeDate}" pattern="yyyy년 M월 d일"></fmt:formatDate></div>
				</li>
			</ul>
			</c:forEach>
	</div><!-- notice overall -->
	
	<!-- 페이징 -->
	<div class="pagenumCount" style="text-align: center; padding: 10px;" >
	<c:if test="${pageMaker.prev}">
	<a href="/hiphople/notice/noticelist?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
	</c:if>
		
	<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
	 <a href="/hiphople/notice/noticelist?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
	</c:forEach>
	
	<c:if test="${pageMaker.next}">
	<a href="/hiphople/notice/noticelist?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
	</c:if>
	</div>
	
</body>
</html>