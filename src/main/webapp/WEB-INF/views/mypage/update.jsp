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

<style type="text/css">
	body{
		margin:0;
		padding:0;
		position: static;
	}
	#wrap{
		width:1100px;
		position : relative;
		min-height:100vh; margin: auto;
		margin-top: 50px;
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: absolute;
		text-align: center;
	}
	section{
		padding-bottom : 110px;	/*footer의  height와 동일*/
	}
	.btnBox, .updateBox{
		text-align: center;
		width: 600px;
	}
	.updateBox{
		margin-left: 100px;
	}
	.box{
		width: 600px;
	}
	.btnBox>button{
		width: 300px;
	}
	[]
	.error{
		color: red; font-size: 12px;
	}
</style>
</head>
<body>
	<!-- header 영역 -->
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	<div class="container-fluid" id='wrap'>
		<div class="row">
			<!-- 3단길이의 첫번째 열 -->
			<div class="col-md-3">
				<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-8">
				<div class="container">
				<h1 style="text-align: center;" class="mt-5">내 정보 수정</h1>
				<form action="<c:url value="/mypage/update"/>" method="post" class="updateBox">
					<div class="form-floating mt-3 mb-3 box">
						<input type="password" class="form-control" id="pw" name="pw" value="" placeholder="Enter password">
						<label for="pw">비밀번호</label>
						<div id="pw-error" class="errorPw" style="color: red; font-size: 12px;"></div>
					</div>
					<div class="form-floating mt-3 mb-3 box">
						<input type="text" class="form-control" id="nickName" name="nickName" value=""  placeholder="Enter password">
						<label for="name">닉네임</label>
						<div id="nickName-error" class="errorNick" style="color: red; font-size: 12px;"></div>
					</div>
					<div class="form-floating mt-3 mb-3 box">
						<input type="text" class="form-control" id="email" name="email" value=""  placeholder="Enter password">
						<label for="email">이메일</label>
						<div id="email-error" class="errorEmail" style="color: red; font-size: 12px;"></div>
					</div>
					<div class="btnBox">
						<button class="btn btn-outline-success">내 정보 수정</button>
					</div>
				</form>
			</div>
			</div>
		</div>
		
		<!-- footer 영역 -->
	<footer>
	<br>
	<hr style="border-width:1px 0 0 0; border-style:solid; border-color:#bbb;">
	<a style="color: #7dafd4;">Team Project - Team4</a>
	<br>
	<a style="color: #7dafd4;">CAFE</a>
	</footer>
	</div>
<script type="text/javascript">
	$(document).ready(function(){
		$(".updateBox").submit(function() {
			$('.errorPw').text("");
	
			//비밀번호 : 빈 문자열 및 정규표현식 체크
			let regexPw = /^[a-zA-Z0-9,.!@]{10,20}$/;
			if($('input[name = pw]').val() != ''){
				if(!regexPw.test($('input[name = pw]').val())){
				$('#pw-error').text("* 비밀번호: 10~20자의 영문 대소문자, 숫자, 특수 문자(,.!@)만 사용 가능합니다.");
				return false;
				}
			}
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function(){
		$(".updateBox").submit(function() {
			$('.errorNick').text("");

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
			$('.errorEmail').text("");

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