<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<title>로그인 페이지</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@ include file="../include/menu.jsp" %>
	<section class="content">
		<h2 class="title">로그인</h2>
		<div class="login_frm_box">
			<form action="${path}/member/loginPro.do" method="post" id="login_frm" class="form">
				<ul class="form_group">
					<li class="login_row">
						<input type="text" class="form-control" name="userid" id="userid" placeholder="아이디를 입력하세요">
					</li> 
					<li class="login_row">
						<input type="password" id="passwd" name="passwd" class="reg-control" maxlength="20" required />
			            <!-- <input type="hidden" name="passwd" value=""> -->
					</li> 
					<li class="login_row">
						<input type="submit" class="btn btn-primary" value="로그인" id="login_submit" />
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
						<button type="button" class="btn btn-primary" onclick="location.href='/member/reg.do'">회원가입</button>
					</li>
				</ul>
			</form>
	        <script src="${path}/include/js/crypto-js.min.js"></script>
	        <script>
	        function cription(f) {
	            var CryptoJS = CryptoJS;
	        	var data = f.passwds.value;
	            // Encrypt
	            var ciphertext = CryptoJS.AES.encrypt(JSON.stringify(data), '456').toString();
	            f.passwd.value = ciphertext;
	            
	            // Decrypt
	            var bytes  = CryptoJS.AES.decrypt(ciphertext, '456');
	            var decryptedData = JSON.parse(bytes.toString(CryptoJS.enc.Utf8));
	            console.log(decryptedData); 
	            
	            f.submit();
	        }
	        </script>
		</div>
	</section>
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>
