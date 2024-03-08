<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

</head>
<body>
	<div class="panel panel-info">
		<div class="panel-heading">
			<h3 class="panel-title">CAFE Title</h3>
		</div>
		<!-- 메뉴목록 -->
			<li>카페정보</li>
		<ul class="list-group">
			<li class="list-group-item">
				<ul><a  href="#" > 카페정보</a></ul>
				<ul>회원 수</ul>
				<ul>게시글 수</ul>
			</li>
			<button class="btn btn-outline-success">로그인</button>
			<button class="btn btn-outline-success">회원가입</button>
		</ul>
		
		<!-- 카테고리 및 게시판 리스트 -->
		<a  href="#" > 전체 글 보기</a>
		<ul class="list-group">
			<li class="list-group-item">카테고리1
				<ul><a class="list-group" href='<c:url value="/post/list"/>' > 게시판1</a></ul>
				<ul><a href="#" > 게시판2</a></ul>
			</li>
		</ul>
	</div>
</body>
</html>