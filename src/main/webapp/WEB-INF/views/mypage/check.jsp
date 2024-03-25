<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 확인</title>


<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	html, body {
		height: 100%;
		background: #ffffff;
	}
	.container {
		display: flex;
		flex-direction: row;
		justify-content: center;
		align-items: center;
		height: 70%;
	}
	.checkBox{
		width: 400px;
	}
	button{
		width: 400px;
	}
	.error{
		color: red; font-size: 12px;
	}
</style>
</head>
<body>
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	<div class="container">
		<form action="<c:url value="/mypage/check"/>" method="post" class="checkBox">
			<h1 style="text-align: center;">본인 확인</h1>
			<div class="form-floating mt-3 mb-3">
				<input type="password" class="form-control" id="pwd" placeholder="Enter password" name="checkPw">
				<label for="pwd">비밀번호</label>
				<span class="error">(현재 실패 횟수 : ${user.me_fail}회)</span>
			</div>
		    <button type="submit" class="btn btn-outline-success">본인확인</button>
	    </form>
	</div>
</body>
</html>