<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 HOME</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- header 영역 -->
<header>
	<jsp:include page = "/WEB-INF/views/header.jsp"/>
</header>

<h1>카페 HOME</h1>

<div class="container-fluid">
	<div class="row">
		<!-- 3단길이의 첫번째 열 -->
		<div class="col-md-3">
			<h1>첫번째 열의 제목</h1>
			<p>첫번째 열의 본문</p>
			<div class="container">
				<ul class="navbar-nav">
					<li class="nav-item">
				 		<a class="nav-link" href="<c:url value="/post/list"/>"><h3>임시 게시판(1)</h3></a>
					</li>
				</ul>
			</div>
		</div>
		<!-- 9단길이의 첫번째 열 -->
		<div class="col-md-9">
			<div class="container">
				<h1>홈화면</h1>
				<p>홈</p>
			</div>
			<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
		</div>
		<!-- 9단길이의 첫번째 열 -->
		<div class="col-md-9">
			<h1>본문 페이지 영역</h1>
			<p>~~~~~~~</p>
		</div>
	</div>
</div>
</body>
</html>