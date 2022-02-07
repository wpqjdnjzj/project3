<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<title>글쓰기</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
<div class="wrap">
    <%@ include file="../include/menu.jsp" %>
    <div class="content">
	    <h2 class="title">글쓰기</h2>
	    <a href="${path}/board/writer_page">글쓰기</a>
	    <form name="updateform" method="POST" action="${path}/board/update.do">
	        <div>글번호</div>
	        <div><input name="bno" value="${data.bno}" type="text" readonly="readonly"/></div>
	        <div>작성자</div>
	        <div><input name="writer" value="${data.writer}" type="text" readonly="readonly"/></div>
	        <div>게시글제목 : </div>
	        <div><input name="title" value="${data.title}" type="text"/></div>
	        <div>게시글내용 : </div>
	        <div><textarea name="content" rows="5" cols="50">${data.content}</textarea></div>
	        <div>조회수</div>
	        <div><input name="viewcnt" value="${data.viewcnt}" type="text" readonly="readonly"/></div>
	        <div>작성일자</div>
	        <div><fmt:formatDate value="${data.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /></div>
	        <div>
	            <input type="submit" value="글수정"/>
	            <input type="reset" value="리셋"/>
	        </div>
	    </form>
	 </div>
   	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>