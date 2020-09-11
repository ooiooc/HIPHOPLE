<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/update.js"></script></head>
<link rel="stylesheet" type="text/css" href="../resources/css/update.css"/>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">

</head>
<body>
	
	
	<h1>글 수정 페이지</h1>
	<form action="/hiphop/notice/update" method="post" role="form"> <!-- modify controller로 이동 -->
	<table border="1" style="width:400; text-align:center ">
		<tr>
			<td colspan="2" class="bnoArea">
			<!-- 페이지 번호 -->
			<input type="text" name="pageNum" value="${cri.pageNum}" readonly="readonly"><br>
			
			<span></span><input type="text" name="bno" id="bno" value="${update.bno}"></td>
		</tr>
		<tr>
			<td colspan="2"><input type="text" name="title" value="${update.title}"></td>
			
		</tr>
		
		<tr> 
			<td>작성자</td>
			<td>${update.writer}</td>
		</tr>
		
		<tr>	
			<td>작성일</td>
			<td>${update.regdate}</td>
		</tr>
		
		<tr>
			<td>내용</td>
			<td><textarea rows="" cols="" name="content" >${update.content}</textarea></td>
		</tr>
		
		<tr>
			<td colspan="2">
			<!-- <input type="submit" value="글 수정"> -->
			<button type="button" class="btn-warning">수정</button>
			<button type="button" class="btn-danger">삭제</button>
			<button type="button" class="btn-primary">목록</button>
			</td>
		</tr>
		
		<!-- 업로드란 -->
		<tr>
			<td colspan="2" class="uploadResult">
			<h4>이미지 업로드 목록</h4>
				<ul></ul>
			</td>
		</tr>
		
		<!-- 댓글 설정 -->
		<!-- 작성댓글 보이는 공간 -->
		<!-- 
		<tr>
			<td colspan="2">
			<ul id="replies">
			</ul>
			</td>
		</tr> -->
		
		<!-- 댓글 작성란 -->
		<!-- 
		<tr>
			<td>
			작성자 <input type="text" name="replyer" id="newReplyWriter"><br>
			댓글내용 <input type="text" name="replytext" id="newReplyText"></td>
			
			<td><button id="replyAddBtn">댓글 등록</button></td>
			
		</tr>
		
		<tr>
			<td colspan="2">
			<ul id="replyPage">
			</ul></td>
		</tr> -->
	</table>	
	
	<!-- 파일 업로드 영역 -->
	<!-- <div class="fileUpload" style="text-align: center;">파일 업로드 영역<br>
	<input class="uplodeFile" type="file" name="file" multiple />
	</div> -->
	
	<!-- 파일 업로드 결과 확인-->
	<!-- <div class="uploadResult">파일 업로드 목록
	<ul>
	
	</ul>
	</div>-->

	</form>

	
</body>
</html>