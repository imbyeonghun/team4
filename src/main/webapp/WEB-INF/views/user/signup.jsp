<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<!-- jquery validtaion -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

<style type="text/css">

	html, body {
	  height: 100%; 
	  background: #ffffff;
	}

	#container {

	   display: flex; 
	  flex-direction: row;
	  justify-content: center;
	  align-items: center;
	  height: 70%;
	}
	
	#loginBox {
	  width: 450px;
	  text-align: center;
	  background-color: #ffffff;
	}
	.input-form-box {
	  border: 0px solid #ff0000;
	  display: flex;
	  margin-bottom: 5px;
	}
	.input-form-box > span {
	  display: block;
	  text-align: left;
	  padding-top: 5px;
	  min-width: 120px;
	}
	.button-login-box {
	  margin: 10px 0;
	}
	#loginBoxTitle {
	  color:#000000;
	  font-weight: bold;
	  font-size: 32px;
	  text-transform: uppercase;
	  padding: 5px;
	  margin-bottom: 20px;
	  background: linear-gradient(to right, #270a09, #8ca6ce);
	  -webkit-background-clip: text;
	  -webkit-text-fill-color: transparent;
	}
	#inputBox {
	  margin: 10px;
	}
	
	#inputBox button {
	  padding: 3px 5px;
	}
	.error {
		color: red; font-size: 12px; text-align: right; margin-bottom: 5px;
	}

</style>
</head>
<body>
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	
	<div id="container">
		<form action="<c:url value="/user/signup"/>" method="post" id="loginBox" class="signupBox">
			<div id="loginBoxTitle">회원가입</div>
			<div id="inputBox">
				<div class="input-form-box">
					<span>아이디 </span><input type="text" name="id" id="id" class="form-control">
				</div>
					<div id = "id-error" class="error" ></div>
				<div class="input-form-box">
					<span>비밀번호 </span><input type="password" name="pw" id="pw" class="form-control">
				</div>
					<div id = "pw-error" class="error" ></div>
				<div class="input-form-box">
					<span>비밀번호 확인 </span><input type="password" name="pw2" id="pw2" class="form-control">
				</div>
					<div id = "pw2-error" class="error" ></div>
				<div class="input-form-box">
					<span>닉네임 </span><input type="text" name="nickName" id="nickName" class="form-control">
				</div>
					<div id = "nickName-error" class="error" ></div>
				<div class="input-form-box">
					<span>이메일 </span><input type="text" name="email" id="email" class="form-control">
				</div>
					<div id = "email-error" class="error" ></div>
				<div class="button-login-box">
					<button class="btn btn-primary btn-xs btn-member-signup" id="btnSingn" style="width: 100%">회원가입</button>
				</div>
			</div>
		</form>
	</div>




<script src="//code.jquery.com/jquery-3.6.1.js"></script>

	<!-- 회원가입 시 유효성 검사 -->
	<script type="text/javascript">
		$(document).ready(function(){
			$(".signupBox").submit(function() {
				$('.error').text("");

				let flag = true;
				
				//아이디 : 빈 문자열 및 정규표현식 체크
				let regexId = /^[a-zA-Z0-9]{8,20}$/; // /^\d+$/
				if($('input[name = id]').val() == ''){
					$('#id-error').text("* 아이디: 필수 정보입니다.");
					return false;
				}else if(!regexId.test($('input[name = id]').val())){
					$('#id-error').text("* 아이디: 8~20자의 영문 대소문자, 숫자만 사용 가능합니다.");
					return false;
				}else{
					//아이디 중복체크
					
						let id = $("[name=id]").val();
						fetch(`<c:url value="/user/id/check"/>?id=\${id}`)
						.then(response=>response.text())
						.then(data => {
							if(data == 'true'){
								$('#id-error').text('사용가능한 아이디입니다.');
								flag = true;
							}
							else{
								$('#id-error').text('중복된 아이디입니다. 다른 아이디를 입력해주세요.');
								return false;
							}
						})
						.catch(error => console.error("Error : ", error));
					
				}
				
				
				//비밀번호 : 빈 문자열 및 정규표현식 체크
				let regexPw = /^[a-zA-Z0-9,.!@]{10,20}$/;
				if($('input[name = pw]').val() == ''){
					$('#pw-error').text("* 비밀번호: 필수 정보입니다.");
					return false;
				}else if(!regexPw.test($('input[name = pw]').val())){
					$('#pw-error').text("* 비밀번호: 10~20자의 영문 대소문자, 숫자, 특수 문자(,.!@)만 사용 가능합니다.");
					return false;
				}
				
				//비번확인 : 빈 문자열 및 정규표현식 체크
				if($('input[name = pw2]').val() == ''){
					$('#pw2-error').text("* 비밀번호 확인: 필수 정보입니다.");
					return false;
				}else if($('input[name = pw]').val() != $('input[name = pw2]').val()){
					$('#pw2-error').text("* 비밀번호와 일치하지 않습니다.");
					return false;
				}

				//닉네임 : 빈 문자열 및 정규표현식 체크
				let regexNickName =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{3,12}$/;
				if($('input[name = nickName]').val() == ''){
					$('#nickName-error').text("* 닉네임: 필수 정보입니다.");
					return false;
				}else if(!regexNickName.test($('input[name = nickName]').val())){
					$('#nickName-error').text("* 닉네임: 3~12자만 사용가능합니다.");
					return false;
				}else{
					//닉네임 중복체크
						let nickName = $("[name=nickName]").val();
						fetch(`<c:url value="/user/nickName/check"/>?nickName=\${nickName}`)
						.then(response=>response.text())
						.then(data => {
							if(data == 'true'){
								$('#nickName-error').text('사용가능한 닉네임입니다.');
								flag = true;
							}
							else{
								$('#nickName-error').text('중복된 닉네임입니다. 다른 닉네임을 입력해주세요.');
								flag = false;
								return false;
							}
						})
						.catch(error => console.error("Error : ", error));
				}
				
				//이메일 : 빈 문자열 및 정규표현식 체크
				let regexEmail = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
				if($('input[name = email]').val() == ''){
					$('#email-error').text("* 이메일: 필수 정보입니다.");
					return false;
				}else if(!regexEmail.test($('input[name = email]').val())){
					$('#email-error').text("* 올바른 이메일 형식이 아닙니다.");
					return false;
				}
				
				if(!flag){
					return false;
				}
				
			})	//submit end
		}); //ready end
		
	</script>

</body>
</html>