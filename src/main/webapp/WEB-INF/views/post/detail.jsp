<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세조회</title>
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
					<form action="<c:url value="/post/detail"/>" method="post">
						<h1>게시글 등록</h1>
						<div class="mb-3 mt-3">
				   			<label for="title" class="form-label">제목:</label>
				   			<input type="text" class="form-control" readonly="readonly" value="${post.po_title}">
				 		</div>
				 		<div class="mb-3 mt-3">
				   			<label for="writer" class="form-label">작성자:</label>
				   			<input type="text" class="form-control" readonly="readonly" value="${post.po_me_id}" >
				 		</div>
				 		<div class="mb-3 mt-3">
				   			<label for="content" class="form-label">내용:</label>
				   			<textarea rows="10" class="form-control" readonly="readonly" value="${post.po_content}"></textarea>
				 		</div>
				 		<div class="mb-3 mt-3">
				   			<label for="writer" class="form-label">조회수:</label>
				   			<input type="text" class="form-control" readonly="readonly" value="${post.po_view}" >
				 		</div>
					</form>
					<a href="<c:url value="/post/list"/>" class="btn btn-outline-primary">목록으로</a>
					<c:if test="${post.po_id == user.me_id}">
						<a href="<c:url value="/post/delete?num=${post.bo_num}"/>"class="btn btn-outline-danger">삭제</a>
						<a href="<c:url value="/post/update?num=${post.bo_num}"/>"class="btn btn-outline-danger">수정</a>
					</c:if>
				</div>
			</div>
		</div>
		</div>
	</div>
</div>
</body>
</html>