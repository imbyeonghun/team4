<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<title>내 댓글 정보</title>
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
			<div class="col-md-9 container mt-5">
				<h1>총 작성 댓글 수 : ${commentCount}</h1>
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>[게시글 이름]</th>
							<th>댓글 내용</th>
							<th>작성 시간</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${commentList}" var="list">
							<tr>
								<td>[${list.postTitle}]</td>
								<td>
									<a href="<c:url value="/post/detail?num=${list.cm_po_num}"/>">${list.cm_content}</a>
								</td>
								<td>${list.cm_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
</html>