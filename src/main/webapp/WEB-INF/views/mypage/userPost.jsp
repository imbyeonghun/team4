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

<style type="text/css">
	body{
		margin:0;
		padding:0;
		
	}
	#wrap{
		width:1100px;
		position : relative;
		min-height:100vh; margin: auto;
		margin-top: 50px;
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

	.container{
		width:800px;
	}
</style>

</head>
<body>
	<!-- header 영역 -->
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	<div class="container-fluid" id='wrap'>
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
									<c:url var="url" value="/post/detail">
										<c:param name="num" value="${post.po_num}"/>
										<c:param name="bo_num" value="${post.po_bo_num}"/>
									</c:url>
									<a href="${url}">${post.po_title}[${post.commentCount}]</a>
								</td>
								<td class="date">${post.po_date}</td>
								<td>${post.po_view}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<form action="<c:url value="/mypage/userPost"/>" class="mb-3 mt-3">
					<div class="input-group">
						<div class="form-control">전체</div>
					    <input type="text" class="form-control" placeholder="검색어" name="search">
					    <button class="btn btn-outline-warning">검색</button>
					</div>
				</form>
				<ul class="pagination justify-content-center">
					
					<c:if test="${pm.prev}">
						<c:url var="prevUrl" value="/mypage/userPost">
							<c:param name="search" value="${pm.cri.search}"/>
							<c:param name="page" value="${pm.startPage-1}"/>
						</c:url>
					    <li class="page-item">
					    	<a class="page-link" href="${prevUrl}">이전</a>
					    </li>
				    </c:if>
					<c:forEach begin="${pm.startPage}" end="${pm.endPage}" var="i">
					   <li class="page-item <c:if test="${pm.cri.page == i}">active</c:if>">
					   		<c:url var="page" value="/mypage/userPost">
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${i}"/>
						    </c:url>
					   		<a class="page-link" href="${page}">${i}</a>
					   </li>
				   </c:forEach>
				   <c:if test="${pm.next}">
					   <li class="page-item">
						   <c:url var="nextUrl" value="/mypage/userPost">
								<c:param name="search" value="${pm.cri.search}"/>
								<c:param name="page" value="${pm.endPage+1}"/>
						   </c:url>
					   		<a class="page-link" href="${nextUrl}">다음</a>
					   </li>
				   </c:if>
				</ul>
			</div>
		</div>
		<!-- footer 영역 -->
		<footer>
			<br>
			<hr
				style="border-width: 1px 0 0 0; border-style: solid; border-color: #bbb;">
			<a style="color: #7dafd4;">Team Project - Team4</a> <br> <a
				style="color: #7dafd4;">CAFE</a>
		</footer>
	</div>
<script type="text/javascript">
	let dateTag = document.querySelectorAll(".date");
	for (const tag of dateTag) {
		let asd = tag.innerText;
		let date = toStringFormatting(asd);
		tag.innerText = date;
	}
	
	function toStringFormatting(source){
		  let replaced_source = source.replace('KST', '');
	      var  date = new Date(replaced_source);
	      const year = date.getFullYear();
	      const month = leftPad(date.getMonth() + 1);
	      const day = leftPad(date.getDate());
	      return [year, month, day].join('-');
	}

	function leftPad(value){
		if (Number(value) >= 10) {
			return value;
		}
		return "0" + value;
	}
</script>
</body>
</html>