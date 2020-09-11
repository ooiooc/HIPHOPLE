<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
<script type="text/javascript" src="../resources/js/write.js"></script></head>

</head>
<style>
/* *{
	font-family: 'Noto Sans KR', sans-serif;
	margin: 0;
	padding: 0;
} */
</style>
<body>
	
	<h1>업로드 테스트</h1>
	<form action="uploadForm" method="post" enctype="multipart/form-data">
	<table border="1" style="width: 500px; text-align: center;">
	
	<tr>
		<td>File</td>
		<td><input type="file" name="file" multiple />
		</td>
	</tr>
	
	<tr>
		<td colspan="2" style="text-align: center;"><input type="submit" value="업로드"/></td>
	</tr>
			   
	</table>
	</form>
	



</body>
</html>