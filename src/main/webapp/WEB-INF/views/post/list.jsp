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

<style type="text/css">

	body{
		margin:0;
		padding:0;
		
	}
	#wrap{
		width:1100px;
		position : relative;
		min-height:100vh; margin: auto;
		margin-top: 20px;
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: absolute;
		text-align: center;
	}
	section{
		padding-bottom : 110px;	/*footer의  height와 동일*/
	}
</style>

</head>
<body>
<jsp:include page = "/WEB-INF/views/header.jsp"/>

<div class="container-fluid" id='wrap'>
	<section>
	<div class="row">
		<!-- 사이드 바 영역 -->
		<div class="col-md-3">
			<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
		</div>
		<!-- 9단길이의 첫번째 열 -->
		<div class="col-md-9">
			<div class="container">
				<h1>${board.bo_name}</h1>
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
							<!-- c:choose로 될거같음 말머리 뜨게 -->
								<td>${post.po_num}</td>
								<td>
									<c:url value="/post/detail" var="url">
										<c:param name="num">${post.po_num}</c:param>
										<c:param name="bo_num">${post.po_bo_num}</c:param>
									</c:url>
									<a href="${url}">${post.po_title}</a>
								</td>
								<td>${post.po_me_name}</td>
								<td>${post.po_date}</td>
								<td>${post.po_view}</td>
							</tr>	
						</c:forEach>	
							
					</tbody>
				</table>
				<form action="<c:url value="/post/list"/>" class="mb-3 mt-3">
					<div class="input-group">
						<select name="type" class="form-control">
							<option value="all"<c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
							<option value="po_title"<c:if test='${pm.cri.type == "po_title"}'>selected</c:if>>제목</option>
							<option value="po_me_name"<c:if test='${pm.cri.type == "po_me_name"}'>selected</c:if>>작성자</option>
						</select>
						<input type="text" class="form-control" placeholder="검색어" name="search" value="${pm.cri.search}">
						<span class="btn btn-outline-warning">검색</span>
					</div>
				</form>
				<ul class="pagination justify-content-center">
					<c:if test="${pm.prev}">
						<li class="page-item">
							<c:url var="prevUrl" value="/post/list/">
								<c:param name="bo_num" value="${bo_num}"/>
								<c:param name="type" value="${pm.cri.type}"/>
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${pm.startPage-1}"/>
							</c:url>
							<a class="page-link" href="${prevUrl}">이전</a>
						</li>
					</c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
						<li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
							<c:url var="page" value="/post/list">
								<c:param name="bo_num" value="${bo_num}"/>
								<c:param name="type" value="${pm.cri.type}"/>
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${i}"/>
							</c:url>
							<a class="page-link" href="${page}">${i}</a>
						</li>
					</c:forEach>
					<c:if test="${pm.next}">
						<li class="page-item">
							<c:url var="nextUrl" value="/post/list">
								<c:param name="bo_num" value="${bo_num}"/>
								<c:param name="type" value="${pm.cri.type}"/>
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${pm.endPage+1}"/>
							</c:url>
							<a class="page-link" href="${nextUrl}">다음</a>
						</li>
					</c:if>
				</ul>
				<a href='<c:url value="/post/insert?num=${bo_num}"/>' class="btn btn-outline-danger">글 등록</a>
			</div>
		</div>
	
	</div>
	</section>
	<!-- footer 영역 -->
	<footer>
	<br>
	<hr style="border-width:1px 0 0 0; border-style:solid; border-color:#bbb;">
	<a style="color: #7dafd4;">Team Project - Team4</a>
	<br>
	<a style="color: #7dafd4;">CAFE</a>
	</footer>
</div>
</body>
</html>