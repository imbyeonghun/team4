<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>본인 확인</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
	<header>
		<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
	</header>
	<div class="container">
		<h1>본인 확인</h1>
		<form action="<c:url value="/mypage/check"/>" method="post">
			<div>
				<label for="checkPw">비밀번호</label>
				<input type="password" id="checkPw" name="checkPw" placeholder="비밀번호를 입력하세요">
			</div>
			<span>
		    	아이디 또는 비밀번호가 잘못되었습니다. 
		    	로그인 실패 5회 시 계정이 정지됩니다. (현재 로그인 실패 횟수 : ${user.me_fail}회)
		    </span>
		    <button type="submit">본인확인</button>
	    </form>
	</div>
</body>
</html>