<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 수정</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
				<form action="" method="post">
					<div>
						<label for="pw">비밀번호</label>
						<input type="text" id="pw" name="pw" value="">
					</div>
					<div>
						<label for="name">닉네임</label>
						<input type="text" id="name" name="name" value="">
					</div>
					<div>
						<label for="email">이메일</label>
						<input type="text" id="email" name="email" value="">
					</div>
					<button type="submit">내 정보 수정</button>
				</form>
			</div>
		</div>
	</div>
</body>
</html>