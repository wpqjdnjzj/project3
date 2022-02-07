<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<title>Home</title>
	<%@ include file="include/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@ include file="include/menu.jsp" %>
	<div class="content" style="min-height:100vh">
	<h1>
		Main Page  
	</h1>
	
	<P>  The time on the server is ${serverTime}. </P>
	</div>
	<%@ include file="include/footer.jsp" %>
</div>
</body>
</html>
