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
			<div class="col-md-9">
				<div class="container">
					<div class="container">
					
							<h1>${post.po_bo_name}</h1>
							<div class="mb-3 mt-3">
					   			<label for="title" class="form-label">제목</label>
					   			<input type="text" class="form-control" readonly="readonly" value="${post.po_title}">
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="writer" class="form-label">작성자</label>
					   			<input type="text" class="form-control" readonly="readonly" value="${post.po_me_name}" >
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="writer" class="form-label">조회수</label>
					   			<input type="text" class="form-control" readonly="readonly" value="${post.po_view}" >
					 		</div>
					 		<div class="mb-3 mt-3">
					   			<label for="content" class="form-label">내용</label>
					   			<textarea rows="10" class="form-control" readonly="readonly">${post.po_content}</textarea>
					 		</div>
							<h2>댓글</h2>
							<div class="box-comment-list">
								<!-- 댓글 보여주는 박스 -->
								<div class="comment-list">
									<div class="box-comment input-group">
										<div class="col-3">아이디</div>
										<div class="col-3">
											<div>댓글 내용</div>
											<div class="btn-group">
												<button class="btn btn-outline-warning btn-comment-update">수정</button>
												<button class="btn btn-outline-danger btn-comment-delete">삭제</button>
											</div>
										</div>
									</div>
								</div>
								<!-- 댓글 페이지네이션 -->
								<div class="box-comment-pagination">
									<ul class="pagination justify-content-center">
										<li class="page-item">
											<a class="page-link" href="javascript:void(0);">이전</a>
										</li>
										<li class="page-item active">
											<a class="page-link" href="javascript:void(0);">i</a>
										</li>
										<li class="page-item">
											<a class="page-link" href="javascript:void(0);">다음</a>
										</li>
									</ul>
								</div>
							<hr>
							<div class="comment-input-box">
								<textarea class="form-control textarea-comment"></textarea>
								<button class="btn btn-outline-success btn-comment-insert">댓글 등록</button>
							</div>
						</div>
							
						<a href="<c:url value="/post/list?bo_num=${post.po_bo_num}"/>" class="btn btn-outline-primary">목록으로</a>
						<c:if test="${post.po_me_id == user.me_id}">
							<a href="<c:url value="/post/delete?num=${post.po_num}"/>"class="btn btn-outline-danger">삭제</a>
							<c:url value="/post/update" var="url">
								<c:param name="num">${post.po_num}</c:param>
								<c:param name="bo_num">${post.po_bo_num}</c:param>
							</c:url>
							<a href="${url}" class="btn btn-outline-danger">수정</a>
						</c:if>
					</div>
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
	
	<!-- 댓글 등록 -->
	<script type="text/javascript">
	$(".btn-comment-insert").click(function(){
		if(!checkLogin()){
			return;
		}
		
		let content = $(".textarea-comment").val();
		let po_num = '${post.po_num}'
		
		$.ajax({
			url : '<c:url value="/comment/insert"/>',
			method : 'post',
			data : {
				content,
				po_num
			},
			success : function(data){
				if(data == "ok"){
					alert("댓글을 등록했습니다.");
					cri.page = 1;
					displayCommentAndPagination(cri);
					$(".textarea-comment").val("");
				}else{
					alert("댓글을 등록하지 못했습니다.");
				}
			}, 
			error : function(a, b, c){
				
			}
		});
	});
	
	function checkLogin(){
		if('${user.me_id}' != ''){
			return true;
		}
		if(confirm("로그인이 필요한 기능입니다. \n로그인 페이지로 이동하겠습니까?")){
			location.href = '<c:url value="/user/login"/>';
		}
		return false;
	}
	</script>
	
	<!-- 댓글 출력 -->
	<script type="text/javascript">
	let cri = {
			page : 1,
			poNum : '${post.po_num}'
	}
	
	function displayCommentAndPagination(cri){
		$.ajax({
			url : '<c:url value="/comment/list"/>',
			method : 'get',
			data : cri,
			success : function(data){
				displayComment(data.coList);
				displayCommentPagination(JSON.parse(data.pm));
			}
		});
	}
	
	displayCommentAndPagination(cri);
	
	function displayComment(commentList) {
		let str = '';
		if(commentList.length == 0){
			$(".comment-list").html('<h4>등록된 댓글이 없습니다.</h4>')
			return;
		}
		
		for(comment of commentList){
			let btns = '';
			if('${user.me_id}' == comment.cm_me_id){
				btns +=
				`
				<div class="btn-comment-group">
					<button class="btn btn-outline-warning btn-comment-update" data-num="\${comment.cm_num}">수정</button>
					<button class="btn btn-outline-danger btn-comment-delete" data-num="\${comment.cm_num}">삭제</button>
				</div>
				`;
			}
			str +=
			`
			<div class="box-comment input-group">
				<div class="col-3">\${comment.cm_me_id}</div>
				<div class="col-3 cm_content"><span>\${comment.cm_content}</span></div>
				\${btns}
			</div>
			`;
		}
		$(".comment-list").html(str);
	}
	function displayCommentPagination(pm){
		let pmStr = "";
		if(pm.prev){
			pmStr += 
			`
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
			</li>
			`;
		}
		for(i = pm.startPage; i<=pm.endPage; i++){
			let active = pm.cri.page == i ? "active" : "";
			pmStr +=
			`
			<li class="page-item \${active}">
				<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
			</li>
			`;
		}
		if(pm.next){
			pmStr += 
			`
			<li class="page-item">
				<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
			</li>
			`;
		}
		$(".box-comment-pagination>ul").html(pmStr);
		
	}
	
	$(document).on("click",".box-comment-pagination .page-link", function(){
		cri.page = $(this).data("page");
		displayCommentAndPagination(cri);
	});
	</script>
	
	
	
	<!-- 댓글 삭제 -->
	<script type="text/javascript">
	$(document).on("click",".btn-comment-delete", function(){
		
		let num = $(this).data("num");
		
		$.ajax({
			url: '<c:url value="/comment/delete"/>',
			method : 'post',
			data : {
				num
			},
			success : function(data){
				console.log(data);
				if(data == 'ok'){
					alert("댓글을 삭제했습니다.");
					displayCommentAndPagination(cri);
				}else{
					alert("댓글을 삭제하지 못했습니다.")
				}
			},
			error : function(a, b, c){
				
			}
		});
	});
	//주석추가
	</script>
	
	<!-- 댓글 수정 -->
	<script type="text/javascript">
	$(document).on("click",".btn-comment-update", function(){
		initComment();
		$(this).parents(".input-group").find(".cm_content").hide();
		let comment = $(this).parents(".input-group").find(".cm_content").text();
		let textarea =
			`
			<textarea class="form-control com-input">\${comment}</textarea>
			`
		$(this).parents(".input-group").find(".cm_content").after(textarea);
			
		$(this).parent().hide();
		let num = $(this).data("num");
		let btn =
			`
			<button class="btn btn-outline-success btn-complete" data-num="\${num}">수정완료</button>
			`
		$(this).parent().after(btn);
	});
	function initComment() {
		$(".cm_content").show();
		$(".btn-comment-group").show();
		$(".com-input").remove();
		$(".btn-complete").remove();
	}
	
	$(document).on("click",".btn-complete", function(){
		let num = $(this).data("num");
		let content = $(".com-input").val();
		$.ajax({
			url : '<c:url value="/comment/update"/>',
			method : 'post',
			data : {
				num, //num : num,
				content //content : content
			},
			success : function(data){
				if(data == "ok"){
					alert("댓글을 수정했습니다.");
					displayCommentAndPagination(cri);
				}else{
					alert("댓글을 수정하지 못했습니다.");
				}
			}, 
			error : function(xhr, status, error){
				
			}
		});
	})
	</script>
</div>
</body>
</html>