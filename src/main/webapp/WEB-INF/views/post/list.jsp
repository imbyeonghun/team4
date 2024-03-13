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
								<td>
									<a href="<c:url value="/post/detail?poNum=${post.po_num}"/>">${post.po_title}</a>
								</td>
								<td>${post.po_me_id}</td>
								<td>${post.po_date}</td>
								<td>${post.po_view}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<a href="<c:url value="/post/insert?num=${bo_num}"/>" class="btn btn-outline-danger">글 등록</a>
			</div>
		</div>

		</div>
	
	</div>
</div>
</body>
</html>