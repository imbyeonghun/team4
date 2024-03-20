<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
	
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- jquery validtaion -->
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/jquery.validate.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/jquery-validation@1.19.5/dist/additional-methods.min.js"></script>

</head>
<body>
	<!-- header 영역 -->
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	<div class="container-fluid">
		<div class="row">
			<!-- 3단길이의 첫번째 열 -->
			<div class="col-md-3">
				<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-9 container">
				<h1>내 정보 수정</h1>
				<form action="<c:url value="/mypage/update"/>" method="post" class="updateBox">
					<div>
						<label for="pw">비밀번호</label>
						<input type=password id="pw" name="pw" value="">
						<div id="pw-error" class="error" ></div>
					</div>
					<div>
						<label for="name">닉네임</label>
						<input type="text" id="nickName" name="nickName" value="">
						<div id="nickName-error" class="error" ></div>
					</div>
					<div>
						<label for="email">이메일</label>
						<input type="text" id="email" name="email" value="">
						<div id="email-error" class="error" ></div>
					</div>
					<button class="btn btn-outline-success">내 정보 수정</button>
				</form>
			</div>
		</div>
	</div>
<script type="text/javascript">
	$(document).on("submit",".updateBox",function(){
		$('.error').text("");

		//비밀번호 : 빈 문자열 및 정규표현식 체크
		let regexPw = /^[a-zA-Z0-9,.!@]{10,20}$/;
		if($('input[name = pw]').val() != ''){
			if(!regexPw.test($('input[name = pw]').val())){
			$('#pw-error').text("* 비밀번호: 10~20자의 영문 대소문자, 숫자, 특수 문자(,.!@)만 사용 가능합니다.");
			return false;
			}
		}
	})
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".updateBox").submit(function() {
			$('.error').text("");

			let regexNickName =  /^[\w\Wㄱ-ㅎㅏ-ㅣ가-힣]{3,12}$/;
			if($('input[name = nickName]').val() == ''){
				return true;
			}
			if(!regexNickName.test($('input[name = nickName]').val())){
				$('#nickName-error').text("* 닉네임: 3~12자만 사용가능합니다.");
				return false;
			}else{
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
		})
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".updateBox").submit(function() {
			$('.error').text("");

			let regexEmail = /^[a-z0-9\.\-_]+@([a-z0-9\-]+\.)+[a-z]{2,6}$/;
			if($('input[name = email]').val() == ''){
				return true;
			}
			if(!regexEmail.test($('input[name = email]').val())){
				$('#email-error').text("* 올바른 이메일 형식이 아닙니다.");
				return false;
			}
			
			if(!flag){
				return false;
			}
			
		})
	});
</script>
</body>
</html>