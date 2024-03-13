<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 목록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/common/header.jsp"/>
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
		<!--본문 영역 -->
		<div class="col-md-9">
			<div class="container">
				<h1>게시글</h1>
				<p>목록</p>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>번호</th>
							<th>제목</th>
							<th>닉네임</th>
							<th>작성시간</th>
							<th>조회수</th>		     
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${postList}" var="post">
							<tr>
								<td>${post.po_num}</td>
								<td>${post.po_title}</td>
								<td>${post.po_me_id}</td>
								<td>${post.po_date}</td>
								<td>${post.po_view}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="<c:url value="/post/insert"/>" class="btn btn-outline-danger">글 등록</a>
			</div>
		</div>
	</div>
</div>
</body>
</html>