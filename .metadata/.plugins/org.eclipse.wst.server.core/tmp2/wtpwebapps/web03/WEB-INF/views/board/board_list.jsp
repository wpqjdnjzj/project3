<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>게시판 목록</title>
<%@ include file="../include/head.jsp" %>
<style>
.blank { clear:both; float:none; width:100%; height:60px; } 
</style>
</head>
<body>
<div class="container">
	<%@ include file="../include/menu.jsp" %>
	<h2 class="title">공지사항 목록</h2>
	<c:if test="${member.userid == 'admin'}">
		<a href="${path}/board/writer_page">글쓰기</a>
	</c:if>	
	<table class="table" id="data">
		<thead>
			<tr>
				<th>번호</th>
				<th>제목</th>
				<th>글쓴이</th>
				<th>작성일자</th>
				<th>조회수</th>
			</tr>
		</thead>
		<tbody>	
			<c:forEach var="row" items="${list}">
			<tr>
				<td>${row.bno}</td>
				<td><a href="${path}/board/read.do?bno=${row.bno}">${row.title}</a></td>
				<td>${row.writer}</td>
				<td>
					<fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" />
				</td>
				<td>${row.viewcnt}</td>
			</tr>
			</c:forEach>
		</tbody>
	</table>
	<script>
	$(function(){
		$("#data").DataTable();		//#dataTable는 반드시 table 태그일 것.
	});
	</script>
	<div class="blank"></div>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>