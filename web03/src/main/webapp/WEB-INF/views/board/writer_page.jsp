<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 쓰기</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
<div class="wrap">
    <%@ include file="../include/menu.jsp" %>
    <div class="content">
	    <h2 class="title">글 쓰기</h2>
	    <form name="bdto" method="post" action="${path}/board/insert.do">
	        <div>제목<input name="title" id="title" size="80" placeholder="글 제목 입력"></div>
	        <div>내용<textarea name="content" id="content" rows="8" cols="80" placeholder="글 내용 입력"></textarea></div>
	        <div>이름<input name="writer" id="writer" placeholder="이름 입력"></div>
	        <div style="width:650px; text-align:center;">
	            <input type="submit" value="확인">
	        </div>
	    </form>
	</div>
   	<%@ include file="../include/footer.jsp" %>
</div>    
</body>
</html>