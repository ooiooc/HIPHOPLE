<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<!-- <script type="text/javascript" src="../resources/js/ctlist.js"></script> -->
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="contslistwrap">
	<h1 class="contitle">CONTENTS</h1>
	<%-- <c:forEach items="${list}" var="article"> --%>
	<ul class="contlist">
		<li class="consubtitle"><a href="/hiphople/contents/list">ALL</a></li>
		<li class="consubtitle"><a href="/hiphople/contents/list?type=F&category=interview">INTERVIEW</a></li>
		<li class="consubtitle"><a href="/hiphople/contents/list?type=F&category=news">NEWS</a></li>
		<li class="consubtitle"><a href="/hiphople/contents/list?type=F&category=world%20news">WORLD NEWS</a></li>
		<li class="consubtitle"><a href="/hiphople/contents/list?type=F&category=feature">FEARTURE</a></li>
		<li class="consubtitle"><a href="/hiphople/contents/list?type=F&category=le%20tv">LE&nbsp;TV</a></li>
	</ul>
		<div>
			<div class="contslist">
				<c:forEach items="${list}" var="article">
				<!-- content1 -->
				<div class="gridconts">
					<div id="contsimg">
					 	<!-- bno -->
					 	<%-- <input id="bno" type="hidden" value="${article.bno}"/> --%>
						<a href="/hiphople/contents/view?bno=${article.bno}&pageNum=${pageMaker.cri.pageNum}">
							<!-- <ul>
							</ul> -->
						<img  src="../resources/upload/${article.uploadPath}/${article.uuid}_${article.fileName}" alt=""/>
						<%-- <img  src="../resources/image/contents/${article.contsimg}" alt="대표이미지"/> --%>
						</a> 
						<%-- <img src="<c:url value='../resources/upload/${article.uploadPath}/${article.uuid}_${article.fileName}' />"/></a> --%>
						
					</div>
					<div class="context">
						<p class="contcate">${article.category}</p>
						<span class="conttitle"><a href="/hiphople/contents/view?bno=${article.bno}&pageNum=${pageMaker.cri.pageNum}">${article.title}</a></span>
					</div>
				</div>
				</c:forEach>
			</div>
		</div>
		<sec:authorize access="hasAuthority('ROLE_ADMIN')"> 
			<div class="article_write"><button class="writebtn"  onclick="location.href='/hiphople/contents/write'">WRITE</button></div>
		</sec:authorize>
		<!--  
		<div class="pageno">
			
	
			<div class="pagenumCount" style="text-align: center; padding: 10px;" >
			<c:if test="${pageMaker.prev}">
			<a href="/hiphople/contents/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
			</c:if>
				
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			 <a href="/hiphople/contents/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<a href="/hiphople/contents/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
			</c:if>
			</div>
		</div>-->
	</div><!-- end contslistwrap -->
	<%-- <c:forEach items="${contents}" var="cont">
	${cont.uploadPath}/${cont.fileName}
	</c:forEach> --%>
	<%@include file="../include/footer.jsp"%>
</body>
</html>