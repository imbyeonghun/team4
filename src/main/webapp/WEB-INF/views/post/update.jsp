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
					<div class="container">
						<form action="<c:url value="/post/update"/>" method="post">
							<h1>게시글 수정</h1>
							<input type="hidden" name="num" value="${post.po_num}">
							<input type="hidden" name="bo_num" value="${post.po_bo_num}">
							<div class="mb-3 mt-3">
								<label for="board" class="form-label">게시판:</label>
								<input type="text" class="form-control" id="title" name="board" readonly="readonly" value="${post.po_bo_name}">
							</div>
							<div class="mb-3 mt-3">
					   			<label for="title" class="form-label">제목:</label>
					   			<input type="text" class="form-control" id="title" name="title" value="${post.po_title}">
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="writer" class="form-label">작성자:</label>
					   			<input type="text" class="form-control" id="writer" name="writer" readonly="readonly" value="${user.me_name}">
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="content" class="form-label">내용:</label>
					   			<textarea rows="10" class="form-control" id="content" name="content">${post.po_content}</textarea>
					 		</div>
					 		<button type="submit" class="btn btn-outline-warning col-12">수정</button>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</body>
</html>