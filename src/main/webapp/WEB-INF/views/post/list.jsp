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
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">

	body{
		margin:0;
		padding:0;
		
	}
	.cf:after{
		display: block;
		content: "";
		clear: both;
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
	.table{text-align: center;}
	.w-30{width: 30%}
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
				<h5>${board.bo_name}</h5>
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
						<c:choose>
							<c:when test="${postList.size() != 0}">
								<c:forEach items="${postList}" var="post">
									<c:url value="/post/detail" var="url">
										<c:param name="num">${post.po_num}</c:param>
										<c:param name="bo_num">${post.po_bo_num}</c:param>
									</c:url>
									<tr onClick="location.href='${url}'" style="cursor: pointer;">
									<!-- 말머리 이름 출력 -->
										<c:if test="${post.po_pt_num == 1}">
											<td>${post.po_num}</td>
										</c:if>
										<c:if test="${post.po_pt_num != 1}">
											<c:forEach items="${ptList}" var="postType">
												<c:if test="${post.po_pt_num == postType.pt_num}">
													<td style="font-weight: bold;">[${postType.pt_name}]</td>
												</c:if>
											</c:forEach>
										</c:if>
										<td>${post.po_title}</td>
										<td>${post.po_me_name}</td>
										<td class="date">${post.po_date}</td>
										<td>${post.po_view}</td>
									</tr>	
								</c:forEach>	
							</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" style="font-weight: bold; text-align:center; font-size: 24px;">게시글이 없습니다</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</tbody>
					</table>
					<div class="cf">
						<c:if test="${bo_num != -1}">
							<a href='<c:url value="/post/insert?num=${bo_num}"/>' class="btn btn-outline-success float-start">글 등록</a>
						</c:if>
						<ul class="pagination pagination-sm justify-content-center">
							<c:if test="${pm.prev}">
								<li class="page-item">
									<c:url var="prevUrl" value="/post/list">
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
					</div>
					<hr>
					<form action="<c:url value="/post/list"/>" class="mb-3 mt-3" method="get">
						<div class="input-group">
							<select name="type" class="form-control w-30">
								<option value="all"<c:if test='${pm.cri.type == "all"}'>selected</c:if>>전체</option>
								<option value="title"<c:if test='${pm.cri.type == "title"}'>selected</c:if>>제목</option>
								<option value="name" <c:if test='${pm.cri.type == "name"}'>selected</c:if>>작성자</option>
							</select>
							<input type="text" class="form-control w-50" placeholder="검색어" name="search" value="${pm.cri.search}">
							<input type="hidden" name="bo_num" value="${bo_num}">
							<button  class="btn btn-outline-warning w-auto">검색</button>
						</div>
					</form>
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
	      var year = date.getFullYear();
	      var month = ('0' + (date.getMonth() + 1)).slice(-2);
	      var day = ('0' + date.getDate()).slice(-2);

	      var hours = ('0' + date.getHours()).slice(-2); 
	      var minutes = ('0' + date.getMinutes()).slice(-2);
	      
	      var dateString = year + '-' + month  + '-' + day+' '+hours+':'+minutes;
	      return dateString;
	}
</script>
</body>
</html>