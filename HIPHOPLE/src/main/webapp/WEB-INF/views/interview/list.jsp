<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Interview – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<h1 class="interview_title">INTERVIEW</h1>
	<h4 style="font-weight: 300; letter-spacing: 1px; font-size: 15px; text-align: center;">
	사진 업로드..
	</h4>
	<div class="atcwrapper">
		
<!-- 		<h1 class="interview_title">featured interview <p class="interview_stitle">featured interview</p></h1>
 --> 
		<c:forEach items="${list}" var="article">
		<!-- content1 -->
		<div class="content"><!-- position:relative 지정해주고 아래 자식 클래스에 position:absolute -->
			<div class="article" style="background-image: url('../resources/image/${article.url}');background-size: cover; background-position: center center;">
			</div>
			<div class="a_box">
				<div class="a_title"><a href="/hiphople/interview/view?bno=${article.bno}">${article.title}</a> 
				<div class="a_writer" style="font-size: 12px;"><span class="a_bywriter">by</span> ${article.writer} / ${article.regdate}</div>
				</div>
			</div>
		</div>
		</c:forEach>
		<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
		<div class="article_write"><button class="writebtn"  onclick="location.href='/hiphople/interview/write'">WRITE</button></div>
		</sec:authorize>
	</div>
	
		<!-- 페이징 -->
		<div class="pagenumCount" style="text-align: center; padding: 10px;" >
		<c:if test="${pageMaker.prev}">
		<a href="/hiphople/interview/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
		</c:if>
			
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		 <a href="/hiphople/interview/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
		<a href="/hiphople/interview/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
		</c:if>
		</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>