<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/header.jsp"/>
<div class="container-fluid">
	<div class="row">
		<!-- 3단길이의 첫번째 열 -->
		<div class="col-md-3">
			<h1>게시판 임시</h1>
			<p>게시판</p>
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
				<h1>게시글 등록</h1>
				<p>작성</p>
				<div class="container">
					<form action="<c:url value="/post/insert"/>" method="post">
						<h1>게시글 등록</h1>
						<div class="mb-3 mt-3">
				   			<label for="community" class="form-label">게시판:</label>
				   			<select class="form-control" id="community" name="community">
				   				<c:forEach items="${list}" var="community">
				   					<option value="${community.co_num}">${community.co_name}</option>
				   				</c:forEach>
				   			</select>
				 		</div>
						<div class="mb-3 mt-3">
				   			<label for="title" class="form-label">제목:</label>
				   			<input type="text" class="form-control" id="title" placeholder="제목" name="title">
				 		</div>
				 		<div class="mb-3 mt-3">
				   			<label for="writer" class="form-label">작성자:</label>
				   			<input type="text" class="form-control" id="writer" name="writer" value="${user.me_id}">
				 		</div>
				 		<div class="mb-3 mt-3">
				   			<label for="content" class="form-label">내용:</label>
				   			<textarea rows="10" class="form-control" id="content" name="content" placeholder="내용"></textarea>
				 		</div>
				 		<button class="btn btn-outline-warning col-12">글 등록</button>
					</form>
				</div>
				
			</div>
		</div>
	</div>
</div>
</body>
</html>