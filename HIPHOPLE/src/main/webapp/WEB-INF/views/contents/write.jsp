<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents – HIPHOPLE</title>
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/ctwrite.js"></script></head>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	
	<div class="contwrap">
	
	<h1 class="interview_title">CREATE A NEW POST</h1>

	<form role="form" action="/hiphople/contents/insert" enctype="multipart/form-data" method="post">
	<table class="cowritetb">
		<!-- <tr>
		  	<td class="title">작성자</td> 
		 	<td><input type="text" name="writer"/></td> 
		</tr> -->
		
		<tr>
		 	<td class="title">제목</td> 
		 	<td><input type="text" name="title"/></td>
		</tr>
		 
		<tr>
		 	<td class="title">Category</td> 
		 	<td><select name="category" size="1">
		 		<optgroup label="Category">		
		 		<option value="INTERVIEW">인터뷰</option>
		 		<option value="FEATURE">피처</option>		 		
		 		<option value="WORLD NEWS">국외뉴스</option>
		 		<option value="NEWS">국내뉴스</option>
		 		<option value="LE TV">비디오</option>
		 		</optgroup>
		 	</select></td>
		</tr>	
		
		<tr>
		 	<td class="title">내용</td> 
		 	<td><textarea rows="" cols="" name="content" ></textarea></td>
		</tr>	
		
		<tr>
		 	<td class="title">이미지</td> 
		 	<td><input type="file" name="file" multiple/></td>
		</tr>	
		  
		<tr class="contwritebtn">
		 	<td colspan="2">
			<input type="submit" value="등록"/></td>
		</tr>
	</table>
 	</form>
   
    <!-- 이미지 미리보기 -->
    <div class="fileUpload" style="text-align: center;">미리보기<br>
	<!-- <input class="uplodeFile" type="file" name="file" multiple /> -->
		<div class="uploadResult">
			<ul>
			</ul>
		</div>
	</div><!-- fileUpload 끝 -->
	</div><!-- container -->
</body>
</html>