<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 HOME</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	body{
		margin:0;
		padding:0;
		position: static;
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

</style>

</head>
<body>
<!-- header 영역 -->
<header>
	<jsp:include page = "/WEB-INF/views/header.jsp"/>
</header>



<div class="container-fluid" id='wrap'>
	<section>
	<div class="row">
		<!-- 사이드 바 영역 -->
		<div class="col-md-3">
			<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
		</div>
		<!-- 9단길이의 첫번째 열 -->
		<div class="col-md-6">
			<div class="container">

				<!-- 카페홈 대문 -->
				<div id="demo" class="carousel slide mb-3"  style="width: 700px; " data-bs-ride="carousel">
					<!-- Indicators/dots -->
					<div class="carousel-indicators" >
						<button type="button" data-bs-target="#demo"
							data-bs-slide-to="0" class="active"></button>
						<button type="button" data-bs-target="#demo"
							data-bs-slide-to="1"></button>
						<button type="button" data-bs-target="#demo"
							data-bs-slide-to="2"></button>
					</div>

					<!-- The slideshow/carousel -->
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img
								src="https://gongu.copyright.or.kr/gongu/wrt/cmmn/wrtFileImageView.do?wrtSn=9046601&filePath=L2Rpc2sxL25ld2RhdGEvMjAxNC8yMS9DTFM2L2FzYWRhbFBob3RvXzI0MTRfMjAxNDA0MTY=&thumbAt=Y&thumbSe=b_tbumb&wrtTy=10004"
								alt="Los Angeles" class="d-block" style="width: 100%; height: 400px;">
						</div>
						<div class="carousel-item">
							<img 
								src="https://img.freepik.com/free-photo/cute-puppy-sitting-in-grass-enjoying-nature-playful-beauty-generated-by-artificial-intelligence_188544-84973.jpg" 
								alt="New York" class="d-block" style="width: 100%; height: 400px;">
						</div>
						<div class="carousel-item">
							<img
								src="https://s3.marpple.co/files/u_2384778/2023/8/original/600f504727850b1954de0d3e405e1ef447b50c6c1.jpg"
								alt="Chicago" class="d-block" style="width: 100%; height: 400px;">
						</div>
						
					</div>
					<!-- Left and right controls/icons -->
					<button class="carousel-control-prev" type="button"
						data-bs-target="#demo" data-bs-slide="prev">
						<span class="carousel-control-prev-icon"></span>
					</button>
					<button class="carousel-control-next" type="button"
						data-bs-target="#demo" data-bs-slide="next">
						<span class="carousel-control-next-icon"></span>
					</button>
				</div>

				<!-- 최신글 목록(최신글 10개) -->
				<br>
				<h3 style="color: #7dafd4;">최신글 목록</h3>
				<hr style="width : 700px">
				<div class="new-PostList">
					<c:if test='${empty postList}'>
						<p>최신 등록된 게시글이 없습니다.</p>
					</c:if>
					<table class="table table-hover" style="width : 700px">
						<tbody>
							<c:forEach items="${postList}" var="post">
								<c:url value="/post/detail" var="url">
									<c:param name="num">${post.po_num}</c:param>
									<c:param name="bo_num">${post.po_bo_num}</c:param>
								</c:url> 
								<tr class="list" onClick="location.href='${url}'" style="cursor: pointer;">
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
						</tbody>
					</table>
				</div>
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

//라인 누르면 게시글 상세 페이지로 이동
$("#table").on("click", "tr", function () {
    alert("클릭");
 });

</script>
</body>
</html>