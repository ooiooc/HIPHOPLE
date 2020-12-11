<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Community – HIPHOPLE</title>
<!-- js -->
<script type="text/javascript" src="../resources/js/jquery-3.5.1.js"></script></head>
<script type="text/javascript" src="../resources/js/cmupdate.js"></script></head>
<script type="text/javascript" src="../resources/js/write.js"></script></head>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/update.css"/>
<!-- include summernote css/js-->
<script src="../resources/js/summernote/summernote.js"></script>
<script src="../resources/js/summernote/summernote-lite.js"></script>
<script src="../resources/js/summernote/lang/summernote-ko-KR.js"></script>
<link rel="stylesheet" href="../resources/css/summernote/summernote-lite.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="comupdatewrap">
	<h1 class="catetitle">COMMUNITY</h1>
	<form action="/hiphop/community/update.do" method="post" role="form">
	<table class="comupdatetb" border="1">
		<tr class="comtr">
			<td class="cmtbset" colspan="2" class="bnoArea">
			<!-- 페이지 번호 -->
			<input type="text" class="pgnum" name="bno" id="bno" value="${update.bno}" readonly="readonly">
			<input type="text" class="pgnum" name="pageNum" style="display: none;" value="${cri.pageNum}" readonly="readonly"><br>
			</td>
		</tr>
		<tr class="comtr">
			<td class="cmtbset"  colspan="2"><label class="updatelb"><input type="text" class="posttitle" name="title" value="${update.title}"></label></td>
		</tr>
		<tr  class="comtr"> 
			<td class="cmtbset" ><label class="updatelb">작성자</label></td>
			<td class="cmtbset" ><span class="cmwriter">${update.writer}</span></td>
		</tr>
		<tr class="comtr">	
			<td class="cmtbset" ><label class="updatelb">작성일</label></td>
			<td class="tbset" ><span class="cmdate">${update.regdate}</span></td>
		</tr>
		<tr>	
			<td class="cmtbset" ><label class="updatelb">CATEGORY</label></td>
			<td >
			<select name="category" size="1">
		 		<optgroup label="Category">		
		 		<option value="음악">음악</option>
		 		<option value="리뷰">리뷰</option>		 		
		 		<option value="가사해석">가사해석</option>
		 		<option value="인증/후기">인증/후기</option>
		 		<option value="그림/아트웍">그림/아트웍</option>
		 		<option value="일반">일반</option>
		 		<option value="공지" disabled>공지</option>
		 		</optgroup>
		 	</select>
			</td>
		</tr>
		<tr>
			<td colspan="2">
			<textarea id="cmcontent" class="cmtextbox" rows="" cols="" id="comm_content" name="content">${update.content}</textarea></td>
		</tr>
		<tr>
			<td class="tbsetbtn"  colspan="2">
			<!-- <input type="submit" value="글 수정"> -->
			<button type="button" class="cmodifybtn">수정</button>
			<button type="button" class="cdeletebtn">삭제</button>
			<button type="button" class="clistbtn">목록</button>
			</td>
		</tr>
		<!-- 업로드란 -->
		<tr>
			<td id="cmtbset" colspan="2" class="fileUpload">
				<h4 class="imglist">이미지 업로드</h4>
				<input class="uplodeFile" type="file" name="file" multiple />
			</td>
		</tr>
		<tr>
			<td id="cmtbset"  colspan="2" class="uploadResult" style="text-align: center;">
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
	</div>
</body>
</html>