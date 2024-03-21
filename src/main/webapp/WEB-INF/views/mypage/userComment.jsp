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
								<td>[${list.post.po_title}]</td>
								<td>
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${list.cm_num}"/>
										<c:param name="bo_num" value="${list.cm_bo_num}"/>
									</c:url>
									<a href="${url}">${list.cm_content}</a>
								</td>
								<td>${list.cm_date}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="<c:url value="/mypage/userComment"/>" class="mb-3 mt-3">
					<div class="input-group">
						<div class="form-control">전체</div>
					    <input type="text" class="form-control" placeholder="검색어" name="search">
					    <button class="btn btn-outline-warning">검색</button>
					</div>
				</form>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<c:url var="prevUrl" value="/mypage/userComment">
							<c:param name="search" value="${pm.cri.search}"/>
							<c:param name="page" value="${pm.startPage-1}"/>
						</c:url>
					    <li class="page-item">
					    	<a class="page-link" href="${prevUrl}">이전</a>
					    </li>
				    </c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					   <li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
					   		<c:url var="page" value="/mypage/userComment">
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${i}"/>
						    </c:url>
					   		<a class="page-link" href="${page}">${i}</a>
					   </li>
				   </c:forEach>
				   <c:if test="${pm.next}">
					   <li class="page-item">
						   <c:url var="nextUrl" value="/mypage/userComment">
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${pm.endPage+1}"/>
						   </c:url>
					   		<a class="page-link" href="${nextUrl}">다음</a>
					   </li>
				   </c:if>
				</ul>
			</div>
		</div>
	</div>
</body>
</html>