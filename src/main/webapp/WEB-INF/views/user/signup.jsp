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
	  height: 100%;
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

</style>
</head>
<body>
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	
	<div id="container">
		<form action="<c:url value="/user/signup"/>" method="post" id="loginBox">
			<div id="loginBoxTitle">회원가입</div>
			<div id="inputBox">
				<div class="input-form-box">
					<span>아이디 </span><input type="text" name="id" class="form-control">
				</div>
				<div class="input-form-box">
					<span>비밀번호 </span><input type="password" name="pw" class="form-control">
				</div>
				<div class="input-form-box">
					<span>비밀번호 확인 </span><input type="password" name="pw2" class="form-control">
				</div>
				<div class="input-form-box">
					<span>닉네임 </span><input type="text" name="nickName" class="form-control">
				</div>
				<div class="input-form-box">
					<span>이메일 </span><input type="email" name="email" class="form-control">
				</div>
				<div class="input-form-box">
					<div id = "error">에러메세지(추후 추가예정)</div>
				</div>
				<div class="button-login-box">
					<button class="btn btn-primary btn-xs btn-member-signup" style="width: 100%">회원가입</button>
				</div>
			</div>
		</form>
	</div>



<script src="//code.jquery.com/jquery-3.4.1.js"></script>
<!-- 회원가입 버튼 이벤트 -->
<script type="text/javascript">
/*
	let flag = false;
	$(".btn-member-signup").click(function(){
		//아이디 중복 검사
		
		let id = $("[name=id]").val();
		fetch(`<c:url value="/id/check"/>?id=\${id}`)
		.then(response=>response.text())
		.then(data => {
			if(data == 'true'){
				alert("사용 가능한 아이디 입니다.");
				flag = true;
			}else{
				console.log(data);
				alert("이미 사용중인 아이디 입니다.");
			}
		
		//아이디 정규 표현식 검사
		
		//
		
	});	//회원가입 버튼 click function end
*/

	/* 아이디 중복 검사, 아이디 정규표현식 */


	/* 입력한 값이 숫자로된 문자열인지 아닌지 확인한는 예제 샘플코드*/
	/* (나중에 맞춰서 수정하기)
	let input = document.getElementById("input");
	input.onchange = function(){
		let text = this.value;
		let regex = /^\d+$/;	//정규표현식
		let error;
		//text가 정규표현식에 맞으면
		if(regex.test(text)){
			error = "숫자로만 되어 있습니다.";
		}else{
			error = "숫자가 아닌 문자가 있습니다."
		}
		let errorBox = document.getElementById("error");
		errorBox.innerText = error;
	}
	*/
</script>

</body>
</html>