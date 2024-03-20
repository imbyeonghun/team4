<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.1.js"></script>

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
  width: 300px;
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
  min-width: 65px;
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

#error {
	color: red; font-size: 12px;
}

</style>
</head>
<body>
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>

	<div id="container">
	<!-- action="<c:url value="/user/login"/>"  -->
	<form action="<c:url value="/user/login"/>" method="post"  id="loginBox">
			<div id="loginBoxTitle">로그인</div>
			<div id="inputBox">
				<div class="input-form-box">
					<span>아이디 </span><input type="text" name="id" class="form-control">
				</div>
				<div class="input-form-box">
					<span>비밀번호 </span><input type="password" name="pw" class="form-control">
				</div>
				<div class="input-form-box">
					<div id = "error"></div>
				</div>
				<div class="button-login-box">
					<button type="submit" class="btn btn-primary btn-xs btn-login" style="width: 100%">로그인</button>
				</div>
			</div>
		</div>
	</form>


	<!-- 로그인 성공 및 실패 -->
	<script type="text/javascript">
	$(document).ready(function(){
		$("#loginBox").submit(function() {
			$('#error').text("");
			//빈 문자열 체크
			if($('input[name = id]').val() == ''){
				$('#error').text("* 아이디를 입력하세요.");
				return false;
			}else if($('input[name = pw]').val() == ''){
				$('#error').text("* 비밀번호를 입력하세요.");
				return false;
			}
		})	//submit end
	}); //ready end
	
	
	
	
	
	</script>

</body>
</html>