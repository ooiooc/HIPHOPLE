<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- add js/css -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<!-- <script type="text/javascript" src="../resources/js/write.js"></script></head> -->
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/write.css"/> -->

<!-- include summernote css/js-->
<script src="../resources/js/summernote/summernote.js"></script>
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"/>

<!-- YoutubePopup css/js -->
<!-- <link rel="stylesheet" type="text/css" href="../resources/css/YouTubePopUp/YouTubePopUp.css"/>
<script src="../resources/js/YouTubePopUp/YouTubePopUp.jquery.js"></script>
<script src="../resources/js/YouTubePopUp/jquery-1.12.1.min.js"></script> -->

<style>
.comm_writewrap{
	width: 700px;
	height: auto;
	margin: 20px auto;
	/* border: 1px solid #000; */
}

.comm_titlebox{
	width: 100%;
	margin: 0 auto;
	margin-top: 10px;
	margin-bottom: 10px;
	/* border: 1px solid #000; */
}

/* 타이틀 input 속성 */
.c_writer, .c_title{
	width: 100%;
	padding: 10px;
	height:30px;
	font-size: 14px;
	/* border: 1px solid #000; */
	
}

.comm_contentbox{
	/* border: 1px solid #000; */
}

/* 글쓰기 게시판 버튼 영역 */
.comm_btnbox{
	text-align:center;
	width: 260px;
	display:flex;
	margin: 10px auto;
	justify-content: space-between;
	/* border: 1px solid #000; */
}

/* 글쓰기 게시판 버튼 속성 변경 */
.comm_btnbox input{
	font-size: 16px;
	width: 80px;
	height: 36px;
	background: #000;
	color: #fff;
	border-radius: 10px 10px;
	border: 0;
	/* border: 1px solid #000; */
}
</style>
</head>
<body>	
	<%@include file="../include/header2.jsp"%>

	<h1>community write</h1>
	
	<!-- summernote -->
	<form role="form" method="post" action="/hiphople/community/insertComm">
	<div class="comm_writewrap">
		<input class="c_writer" type="text" name="writer" placeholder="작성자"/>
		<div class="comm_titlebox">
  			
			<input class="c_title" type="text" name="title"  placeholder="제목을 입력해 주세요"/>
  		</div>
  		<div class="comm_contentbox">
  			<textarea id="comm_content" name="content"></textarea>
  		</div>
  		<div>Category
			<select name="category" size="1">
		 		<optgroup label="Category">		
		 		<option value="kr">국내</option>
		 		<option value="world">국외</option>		 		
		 		<option value="fashion">Fashion</option>
		 		<option value="mixtape">Mixtape</option>
		 		</optgroup>
		 	</select>
		</div>
  		<div class="comm_btnbox">
  			<input id="subBtn" type="submit" value="글쓰기"/>
  			<input type="reset" value="취소" />
			<input type="button" value="목록" onclick="location.href='/hiphople/community/list'">
		</div>

	</div>
	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
	</form>
	<hr>
	
</body>
</html>