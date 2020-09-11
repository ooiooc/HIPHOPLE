<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>파일 업로드 하기 위한 ajax</title>

<script type="text/javascript" src="resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="resources/js/uploadajax.js"></script></head>
<link rel="stylesheet" type="text/css" href="resources/css/uploadajax.css"/>
<%@ include file="../include/header.jsp"%>
</head>

<body>

	<h1>파일 업로드 하기 위한 ajax</h1>

	
	<!-- 파일 업로드 drag&drop -->
	<div class="fileDrop">파일 업로드 Drag&Drop 영역</div>
	
	<!-- 파일 업로드 drag&drop 결과 이미지 list -->
	<div class="uploadResult">
	<ul>
	</ul>
	</div>
	
</body>
</html>