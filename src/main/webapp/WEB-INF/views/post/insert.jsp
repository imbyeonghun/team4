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
		<!-- 사이드 바 영역 -->
		<div class="col-md-3">
			<h1>첫번째 열의 제목</h1>
			<p>첫번째 열의 본문</p>
			<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
		</div>
		<!-- 9단길이의 첫번째 열 -->
		<div class="col-md-9">
			<div class="col-md-9">
				<div class="container">
					<h1>게시글 등록</h1>
					<p>작성</p>
					<div class="container">
						<form action="<c:url value="/post/insert"/>" method="post">
							<h1>게시글 등록</h1>
							<div class="mb-3 mt-3">
					   			<label for="cafe" class="form-label">게시판:</label>
					   			<select class="form-control" id="cafe" name="cafe">
					   				<c:forEach items="${list}" var="cafe">
					   					<option value="${cafe.bo_num}">${cafe.bo_name}</option>
					   				</c:forEach>
					   			</select>
					 		</div>
							<div class="mb-3 mt-3">
					   			<label for="title" class="form-label">제목:</label>
					   			<input type="text" class="form-control" id="title" placeholder="제목" name="title">
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="writer" class="form-label">작성자:</label>
					   			<input type="text" class="form-control" id="writer" name="writer" value="${user.me_name}">
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
</div>
</body>
</html>