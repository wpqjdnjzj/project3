<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>회원가입</title>
<%@ include file="../include/head.jsp" %>
</head>
<body>
<div class="wrap">
	<%@ include file="../include/menu.jsp" %>
	<section class="content">
		<h2>회원 가입 폼</h2>
	    <div class="reg_form_box">
	        <form method="post" action="/member/joinPro.do" class="form">
	        	<table class="table">
		        	<tbody>
			            <tr class="reg_row">
			                <th><label for="userid" class="reg-label">*아이디</label></th>
			                <td class="reg_input">
			                   <input type="text" id="userid" name="userid" class="reg-control" maxlength="13" required />
			               </td>
			           </tr>
			           <tr class="reg_row">
			               <th><label for="passwd" class="reg-label">*비밀번호</label></th>
			               <td class="reg_input">
			                   <input type="password" id="passwd" name="passwd" class="reg-control" maxlength="20" required />
			                   <!-- <input type="hidden" name="passwd" value=""> -->
			               </td>
			           </tr>
			           <tr class="reg_row">
			               <th><label for="userPwChk" class="reg-label">*비밀번호 확인 </label></th>
			               <td class="reg_input">
			                   ​<input type="password" id="userPwChk" name="passwds2" class="reg-control" maxlength="20" required />
			               </td>
			           </tr>
			           <tr class="reg_row">
			               <th><label for="name" class="reg-label">*이름</label></th>
			               <td class="reg_input">
			                    <input type="text" id="name" name="name" class="reg-control" maxlength="13" required />
			                </td>
			            </tr>
			            <tr class="reg_row">
			                <th><label for="email" class="reg-label">*이메일</label></th>
			                <td class="reg_input">
			                    <input type="text" id="email" name="email" class="reg-control" maxlength="50" />
			                </td>
			            </tr>
			            <tr class="reg_row">
			                <th><label for="phone" class="reg-label">*전화번호, '-' 입력 제외 </label></th>
			                <td class="reg_input">
			                    <input type="text" id="phone" name="phone" class="reg-control" maxlength="15" />
			                </td>
			            </tr>
			            <tr class="reg_row">
			                <th><label class="reg-label" id="birth">*생년월일</label></th>
			                <td class="reg_input">
			                    <input type="text" id="birth" name="birth" class="reg-control" maxlength="8" />
			                </td>
			            </tr>
			            <tr class="reg_row">
			                <td class="reg_btn_group" colspan="2">
			                    <input type="submit" class="btn btn-primary" id="reg_form_btn" value="회원가입" />
			                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			                    <input type="reset" class="btn btn-primary" id="reg_form_btn2" value="취소" />
			                </td>
			            </tr>
		            </tbody>
	            </table>
	        </form>
	        <script src="${path}/include/js/crypto-js.min.js"></script>
	        <script>
	        function cription(f) {
	            var CryptoJS = CryptoJS;
	        	var data = f.passwds.value;
	            // Encrypt
	            var ciphertext = CryptoJS.AES.encrypt(JSON.stringify(data), '456').toString();
	            f.passwd.value = ciphertext;
	            console.log(ciphertext);
	            f.submit();
	            return false;
	            // Decrypt
	            var bytes  = CryptoJS.AES.decrypt(ciphertext, '456');
	            var decryptedData = JSON.parse(bytes.toString(CryptoJS.enc.Utf8));
	          
	            console.log(decryptedData); 
	        }
	        </script>
	    </div>
	 </section>   
	<%@ include file="../include/footer.jsp" %>
</div>
</body>
</html>