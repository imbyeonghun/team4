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
						<div class="box-comment input-group">
								<div class="col-3">아이디</div>
								<div class="col-3">
									<div>댓글 내용</div>
									<div class="btn-group">
										<button class="btn btn-outline-warning btn-comment-delete">수정</button>
										<button class="btn btn-outline-danger">삭제</button>
									</div>
								</div>
							</div>
						</div>
						<!-- 댓글 페이지네이션 -->
						<div class="box-comment-pagination">
						
						</div>
						<div class="comment-input-box">
							<textarea class="form-control textarea-comment"></textarea>
							<button class="btn btn-outline-success btn-comment-insert">댓글 등록</button>
						</div>
						<hr>
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
<script type="text/javascript">
let cri = {
		page : 1,
		poNum : '${post.po_num}'
}

displayCommentAndPagination(cri);

function displayCommentAndPagination(cri){
	$.ajax({
		url : '<c:url value="/comment/list"/>',
		method : 'get',
		data : cri,
		success : function(data){
			console.log(data)
			displayComment(data.coList);
		}
	});
}
function displayComment(commentList) {
	let str = '';
	if(commentList.length == 0){
		$(".box-comment-list").html('<h4>등록된 댓글이 없습니다.</h4>')
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
			<div class="col-12 cm_content">
				<span>\${comment.cm_content}</span>
			</div>
			\${btns}
		</div>
		`;
	}
	$(".input-group").html(str);
}
</script>
<script type="text/javascript">
$(".btn-comment-insert").click(function(){
	if(!checkLogin()){
		return;
	}
	let content = $(".textarea-comment").val();
	let po_num = '${post.po_num}'

	/*
	if(comment.cm_content.length == 0){
		alert('댓글 내용을 작성하세요.');
		return;
	}
		*/
	
	$.ajax({
		url : '<c:url value="/comment/insert"/>',
		method : 'post',
		data : {
			content, //content : content
			po_num //num : num
		},
		success : function(data){
			if(data == "ok"){
				alert("댓글을 등록했습니다.");
				cri.page = 1;
				getCommentList(cri);
				$(".comment-content").val("");
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
				getCommentList(cri);
			}else{
				alert("댓글을 삭제하지 못했습니다.")
			}
		},
		error : function(a, b, c){
			
		}
	});
});
</script>
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

$(document).on("click","btn-complete", function(){
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
				getCommentList(cri);
			}else{
				alert("댓글을 수정하지 못했습니다.");
			}
		}, 
		error : function(xhr, status, error){
			
		}
	});
})
</script>
</body>
</html>