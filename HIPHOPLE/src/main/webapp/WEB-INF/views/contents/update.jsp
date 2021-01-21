<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Contents – HIPHOPLE</title>
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script>
<script type="text/javascript" src="../resources/js/ctupdate.js"></script>
<script type="text/javascript" src="../resources/js/write.js"></script>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/update.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	
	<h1 class="catetitle">CONTENTS</h1>
	<form action="/hiphop/contents/update.do" method="post" role="form"> <!-- modify controller로 이동 -->
	<table class="updatetb" border="1">
		<tr>
			<td class="tbset" colspan="2" class="bnoArea">
			<!-- 페이지 번호 -->
			<input type="text" class="pgnum" name="bno" id="bno" value="${update.bno}">
			<input type="text" class="pgnum" name="pageNum" style="display: none;" value="${cri.pageNum}" readonly="readonly"><br>
			</td>
		</tr>
		<tr>
			<td class="tbset"  colspan="2"><label class="updatelb"><input type="text" class="posttitle" name="title" value="${update.title}"></label></td>
		</tr>
		<tr> 
			<td class="tbset" ><label class="updatelb">작성자</label></td>
			<td class="tbset" >${update.writer}</td>
		</tr>
		<tr>	
			<td class="tbset" ><label class="updatelb">작성일</label></td>
			<td class="tbset" >${update.regdate}</td>
		</tr>
		<tr>
			<td class="tbset" ><label class="updatelb">내용</label></td>
			<td class="tbset" ><textarea class="notextbox" rows="" cols="" name="content">${update.content}</textarea></td>
		</tr>
		<tr>
			<td class="tbsetbtn"  colspan="2">
			<!-- <input type="submit" value="글 수정"> -->
			<button type="button" class="modifybtn">수정</button>
			<button type="button" class="deletebtn">삭제</button>
			<button type="button" class="listbtn">목록</button>
			</td>
		</tr>
		<!-- 업로드란 -->
		<tr>
			<td id="tbset" colspan="2" class="fileUpload">
				<h4 class="imglist">이미지 업로드</h4>
				<input class="uplodeFile" type="file" name="file" multiple />
			</td>
		</tr>
		<tr>
			<td id="tbset"  colspan="2" class="uploadResult" style="text-align: center;">
				<h4 class="imglist">이미지 목록</h4>
				<ul></ul>
			</td>
		</tr>
		
		<!-- 파일 업로드 영역 -->
	<!-- <div class="fileUpload" style="text-align: center;">파일 업로드 영역<br>
	<input class="uplodeFile" type="file" name="file" multiple />
	</div> -->
	
	<!-- 파일 업로드 결과 확인-->
	<!-- <div class="uploadResult">파일 업로드 목록
	<ul>
	
	</ul>
	</div>-->
		
		<!-- <tr>
			<td class="tbset"  colspan="2" class="uploadResult">
				<input class="uplodeFile" type="file" name="file" multiple></td>
		</tr> -->
		
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