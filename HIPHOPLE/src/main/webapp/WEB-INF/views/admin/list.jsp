<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%-- <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin – HIPHOPLE</title>
<!-- css -->
<link rel="stylesheet" type="text/css" href="../resources/css/list.css"/>
</head>
<body>
	<%@include file="../include/header2.jsp"%>
	<div class="comwrap">
		<h1 class="community_title">MEMBER INFO</h1>
		<table class="combox">
			<tr>
				<th class="adminth" colspan="6" style="" ><p>등록된 회원 수&nbsp;${total}명</p></th>
			</tr>
			<!-- 회원 검색 -->
			<tr>
				<td colspan="7" style="text-align: left;  padding-bottom: 20px;">
				<form action="/hiphople/admin/list" method="get">
				<select class="cmsearchbar" name="type"><!-- 내가 검색창에서 선택한 옵션과 검색어를 남겨주기 위해서 아래와 같이 추가 (selected) -->
					<option value="T" <c:out value="${pageMaker.cri.type eq 'T'? 'selected':''}"/>>제목</option>
					<option value="C" <c:out value="${pageMaker.cri.type eq 'C'? 'selected':''}"/>>내용</option>
					<option value="W" <c:out value="${pageMaker.cri.type eq 'W'? 'selected':''}"/>>작성자</option>
					<option value="TC" <c:out value="${pageMaker.cri.type eq 'TC'? 'selected':''}"/>>제목 + 내용</option>
					<option value="CW" <c:out value="${pageMaker.cri.type eq 'CW'? 'selected':''}"/>>내용 + 작성자</option>
					<option value="TCW"<c:out value="${pageMaker.cri.type eq 'TCW'? 'selected':''}"/>>제목 + 내용 + 작성자</option>
				</select>
				<input type="text" class="cmsearchip" name="keyword" placeholder="검색어를 입력해주세요" value="${pageMaker.cri.keyword}">
				<button type="submit" class="cmsearchbtn">검색</button>
				</form>
				</td>
			</tr>
		
			<tr class="admintr">
				<th>번호</th>
				<th>아이디</th>
				<th>이름</th>
				<th>이메일</th>
				<th>등록일</th>
				<th>인증여부</th>
				<th>구분</th>
			</tr>
			<c:if test='${list.isEmpty()}'>
			<tr>
				<td colspan="7"><p class="nolist">작성된 게시글이 없습니다.</td>
			</tr>
			</c:if>
			<c:forEach items="${list}" var="admin" varStatus="status">
			<tr class="comtr">
				<td>${status.count} </td>
				<td>${admin.userid}</td>
				<td>${admin.username}</td>
				<td>${admin.email}</td>
				<td><%-- ${admin.regdate} --%>
				<fmt:parseDate var="regdate" value="${admin.regdate}" pattern="yyyy-MM-dd HH:mm:ss"></fmt:parseDate>
				<fmt:formatDate value="${regdate}" pattern="yyyy년 MM월 dd일"></fmt:formatDate>
				</td>
				<c:if test="${admin.authstatus == 1}">
				<td><c:out value="인증완료" /></td>
				</c:if>
				<c:if test="${admin.authstatus == 0}">
				<td><c:out value="비활성" /></td>
				</c:if>
				<td></td>
			</tr>
			</c:forEach>
		</table>
		
			<!-- 페이징 pagenumCount-->
			<div class="comm_pgnum" style="text-align: center; padding: 10px;" >
			<c:if test="${pageMaker.prev}">
			<a href="/hiphople/admin/list?pageNum=${pageMaker.startPage-1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">이전</a>
			</c:if>
				
			<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			 <a href="/hiphople/admin/list?pageNum=${num}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">${num}</a>
			</c:forEach>
			
			<c:if test="${pageMaker.next}">
			<a href="/hiphople/admin/list?pageNum=${pageMaker.endPage+1}&type=${pageMaker.cri.type}&keyword=${pageMaker.cri.keyword}">다음</a>
			</c:if>
			
			</div>
	</div>
	<%-- <%@include file="../include/footer.jsp"%> --%>
</body>
</html>