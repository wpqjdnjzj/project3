<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원목록</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@ include file="../include/menu.jsp" %>
	<h2>회원목록</h2>
	<input type="button" value="회원등록" onclick="location.href='${path}/member/join.do'">
	<table border="1" width="700px">
	    <tr>
	        <th>아이디</th>
	        <th>이름</th>
	        <th>이메일</th>
	        <th>가입일자</th>
	    </tr>
	    <c:forEach var="row" items="${list}"> 
	    <tr>
	        <td>${row.userid}</td>
	        <td>
	        <a href="${path}/member/view.do?userid=${row.userid}">${row.name}</a>
	        </td>
	        <td>${row.email}</td>
	        <td><fmt:formatDate value="${row.regdate}" pattern="yyyy-MM-dd HH:mm:ss" /> </td>
	    </tr>
	    </c:forEach>    
	</table>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>