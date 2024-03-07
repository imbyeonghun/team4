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
		.container>*{
			padding: 10px;
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
				<table class="table">
					<tr>
						<th>닉네임(아이디) : ${user.me_id}</th>
						<th>등급명 : 등급명 변수</th>
						<th>가입일 : 가입일 변수</th>
						<th>방문횟수 : 횟수 변수</th>
						<th>게시글 수 : <a href="<c:url value=""/>">개수를 가지는 변수</a>개</th>
						<th>댓글 수 : <a href="<c:url value=""/>">개수를 가지는 변수</a>개</th>
						<c:if test="user == admin">
							<a href="<c:url value=""/>">카페 관리</a>
						</c:if>
					</tr>
				</table><br>
				<button type="button"><a href="<c:url value="/mypage/update"/>">내 정보 수정</a></button>
				<button type="button"><a href="<c:url value=""/>">카페탈퇴하기</a></button>
			</div>
		</div>
	</div>
</body>
</html>