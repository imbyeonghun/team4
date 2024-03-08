<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
		.container{
			border: 1px solid black;
		}
</style>
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
				<h1>내 정보</h1>
				<div>
					<label for="id">닉네임(아이디)</label>
					<input type="text" id="id" name="id" value="${user.me_name}" readonly>
				</div>
				<div>
					<label for="grade">등급명</label>
					<input type="text" id="grade" name="grade" value="${user.me_gr_name}" readonly>
				</div>
				<div>
					<label for="date">가입일</label>
					<input type="date" id="date" name="date" value="${user.me_date}" readonly>
				</div>
				<div>
					<label for="count">방문횟수</label>
					<input type="text" id="count" name="count" value="${user.me_loginCount}" readonly>
				</div>
				<div>
					게시글 수 : <a href="#" id="board">${user.me_bo_num}</a>  |  
					댓 글 수 : <a href="#">${user.me_bo_num}</a>
				</div>
				<c:if test="${user.me_gr_name == admin}">
					<div>
						<label for="count">방문횟수</label>
						<input type="text" id="count" name="count" value="" readonly>
					</div>
				</c:if>
				<a href="<c:url value="/mypage/update"/>">내 정보 수정</a>
				<a href="<c:url value="#"/>">카페탈퇴하기</a>
			</div>
		</div>
	</div>
</body>
</html>