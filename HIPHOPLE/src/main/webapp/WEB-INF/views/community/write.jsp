<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<% pageContext.setAttribute("replaceChar", "\n"); %>
<!-- security taglib 사용 선언 -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community – HIPHOPLE</title>
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
<!-- include summernote css/js-->
<script src="../resources/js/summernote/summernote.js"></script>
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"/>
<!-- YoutubePopup css/js -->
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/YouTubePopUp/YouTubePopUp.css"/>
<script src="../resources/js/YouTubePopUp/YouTubePopUp.jquery.js"></script>
<script src="../resources/js/YouTubePopUp/jquery-1.12.1.min.js"></script> -->
</head>
<body>	
	<%@include file="../include/header2.jsp"%>
	<div class="comwrap">
	<h1 class="community_title">COMMUNITY</h1>
	<!-- summernote -->
	<form role="form" method="post" action="/hiphople/community/insertComm">
	<div class="comm_writewrap">
		<input class="cwriter" type="text" name="writer" value="${member.username}" readonly="readonly"/>
		<div class="comm_titlebox">
			<input class="ctitle" type="text" name="title"  placeholder="제목을 입력해 주세요"/>
  		</div>
  		<div class="comm_contentbox">
  			<textarea id="cmcontent" name="content"></textarea>
  		</div>
  		<div class="combtnbox">
  		<div class="categoryopt"><span class="cateopt">CATEGORY&nbsp;</span>
			<select class="select" name="category" size="1">
		 		<optgroup label="Category">		
		 		<option value="music">음악</option>
		 		<option value="review">리뷰</option>		 		
		 		<option value="lyrics">가사해석</option>
		 		<option value="artwork">그림/아트웍</option>
		 		<option value="fboard">일반</option>
		 		<option value="notice" disabled>공지</option>
		 		</optgroup>
		 	</select>
		</div>
  		
  			<input class="cowritebtn" id="subBtn" type="submit" value="WRITE"/>
		</div>
	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	</div>
</body>
</html>