<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="../resources/css/reset.css"/>
<link rel="stylesheet" type="text/css" href="../resources/css/write.css"/>
</head>
<body>
	
	<div class="container">
	
	<h1>글쓰기</h1>

	<form role="form" action="/hiphople/interview/insert" method="post">
	<table>
		<tr>
		  	<td class="title">작성자</td> 
		 	<td><input type="text" name="writer"/></td> 
		</tr>
		
		<tr>
		 	<td class="title">제목 :</td> 
		 	<td><input type="text" name="title"/></td>
		</tr>
		 
		<tr>
		 	<td class="title">내용 : </td> 
		 	<td><textarea rows="" cols="" name="content" ></textarea></td>
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