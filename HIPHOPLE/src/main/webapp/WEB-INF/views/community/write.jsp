<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/write.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
</head>
<body>	

	<div class="container">
	<h1>커뮤니티 게시판</h1>
	<form role="form" action="/hiphople/community/insert" method="post">
	<table border="1" style="width: 700px;">
		<tr>
		  	<td class="title">작성자</td> 
		 	<td><input type="text" name="writer" value="${login.username}" readonly/></td> 
		</tr>
		
		<tr>
		 	<td class="title">제목 :</td> 
		 	<td><input type="text" name="title"/></td>
		</tr>
		 
		<tr>
		 	<td class="title">내용 : </td> 
		 	<td><textarea rows="" cols="" name="content"></textarea></td>
		 </tr>	
		  
		<tr class="writeBtn">
		 	<td colspan="2">
			<input type="submit" value="글쓰기"/></td>
		</tr>
	</table>
 	</form>
    
    <!-- 파일 업로드 영역 -->
    <div class="fileUpload" style="text-align: center;">파일 업로드 영역<br>
	<input class="uplodeFile" type="file" name="file" multiple />
	</div>
	
	
    <!-- 파일 업로드 결과 확인-->
	<div class="uploadResult">
	<ul>
	
	</ul>
	</div>
	
	</div><!-- container -->
</body>
</html>