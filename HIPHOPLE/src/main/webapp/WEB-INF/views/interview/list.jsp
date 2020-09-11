<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!-- fn 함수 이용하여 줄바꿈, 공백, 개행 replace 처리 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<%-- <%@include file="../include/header.jsp"%> --%>
<style type="text/css">

/* .content_wrap{
	display: grid;
  	width: 800px;
  	height: fit-content;
  	grid-template-columns: repeat(2, 1fr);
  	grid-column-gap: 5px;
  	grid-row-gap: 5px;
  	text-align: center;
  	border: 1px solid #000;
} */

h1{
	letter-spacing: -1px;
}

.wrapper{
  	display: grid;
  	width: 800px;
  	height: fit-content;
  	grid-template-columns: repeat(3, 1fr);
  	grid-column-gap: 5px;
  	gap:20px;
  	margin: 0 auto; /* 가운데정렬 */
  	/* grid-auto-rows: minmax(100px, auto); */
}

.content{
	background: #e2b9b3;
	width: 300px;
	height: auto;
	text-align: center;border: 1px solid #000;
}

/* article img */
.article{
	width: 100%;
	height: 240px;
	bottom: 0;
	/* background: #e2b9b3; */
	background: #f9f9f9;
	border: 1px solid #000;
	text-align: center;
}

.a_title{
	width: 100%;
	flex-direction: row;
	border: 1px solid #000;
}

.a_writer{
	width: 100%;
	flex-direction: row;
	border: 1px solid #000;
}
</style>


</head>
<body>

	<h1>featured interview</h1>
	
	<div class="wrapper">
	
		<c:forEach items="${list}" var="article">
		<!-- content1 -->
		<div class="content"><!-- position:relative 지정해주고 아래 자식 클래스에 position:absolute -->
			<div class="article" style="background-image: url('../resources/image/${article.url}');background-size: cover; background-position: center center;">
			</div>
			<div class="a_title"> 
			${fn:replace(article.title, replaceChar, "<br/>")}
			</div>
			<div class="a_writer" style="font-size: 12px;"><p style="font-style: italic; font-size: 12px">by</p> ${article.writer} / ${article.regdate}</div>
		</div>
		</c:forEach>
		
		<!-- 페이징 -->
		<%-- <div class="pagenumCount" style="text-align: center; padding: 10px;" >
		<c:if test="${pageMaker.prev}">
		<a href="/hiphople/interview/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
		</c:if>
			
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		 <a href="/hiphople/interview/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
		</c:forEach>
		
		<c:if test="${pageMaker.next}">
		<a href="/hiphople/interview/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
		</c:if>
		</div> --%>
		
	</div>
	
</body>
</html>