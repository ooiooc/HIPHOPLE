<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice – HIPHOPLE</title>
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/write.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.13.1/css/all.css" integrity="sha384-xxzQGERXS00kBmZW/6qxqJPyxW3UR0BPsL4c8ILaIWXva5kFi7TxkIIaMiKtqV1Q" crossorigin="anonymous">
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	
	<div class="container">
	
	<h1 class="notice_title">CREATE NEW NOTICE</h1>

	<form role="form" action="/hiphople/notice/insert" method="post">
	<table>
		<%-- <tr>
		  	<td class="title">작성자</td> 
		 	<td><input type="text" name="writer" value="${login.username}"/></td> 
		</tr> --%>
		
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