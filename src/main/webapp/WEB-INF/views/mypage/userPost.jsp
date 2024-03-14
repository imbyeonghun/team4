<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 게시글 정보</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
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
				<h1>총 작성 게시글 수 : ${postCount}</h1>
				<hr>
				<table class="table table-hover">
					<thead>
						<tr>
							<th>[게시판 이름]</th>
							<th>제목[댓글 수]</th>
							<th>작성 시간</th>
							<th>조회수</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${postList}" var="post">
							<tr>
								<td>[${post.board.bo_name}]</td>
								<td>
									<a href="<c:url value="/post/detail?num=${post.po_num}"/>">${post.po_title}[${post.commentCount}]</a>
								</td>
								<td>${post.po_date}</td>
								<td>${post.po_view}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="<c:url value="/board/list"/>" class="mb-3 mt-3">
					<div class="input-group">
					    <select name="type" class="form-control">
				    		<option value="all" <c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
					    </select>
					    <input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
					    <button class="btn btn-outline-warning">검색</button>
					</div>
				</form>
				<ul class="pagination justify-content-center">
				    <li class="page-item"><a class="page-link" href="#">이전</a></li>
				    <li class="page-item"><a class="page-link" href="#">1</a></li>
				    <li class="page-item"><a class="page-link" href="#">다음</a></li>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>