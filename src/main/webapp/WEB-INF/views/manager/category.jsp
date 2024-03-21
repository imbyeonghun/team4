<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>카테고리 관리</title>
   <script src="//code.jquery.com/jquery-3.6.1.js"></script>
   <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
</head>
<body>
  <div class="header">
  	<jsp:include page = "/WEB-INF/views/header.jsp"/>
  </div>
  <div class="container mt-5 mb-4">
    <div class="insertCategory input-group">
        <input type="text" placeholder="카테고리 이름을 입력" id="addCategory"
        class="col-9 form-control">
        <button type="button" id="insertCategory"
        class="col-3 btn btn-outline-secondary">카테고리 등록</button> 
    </div>  
    <div class="line mt-4">카테고리 목록</div>
    <div class="main mt-3 pb-5">
    	
    </div>
    <!-- 페이지 -->
  	<div class="comment-pagination mt-3">
		<ul class="pagination justify-content-center">
			  				
		</ul>
	</div>
  </div>
 <div class="update-box w-75">
      <form  method="post" id="updateCategory" class="input-group">
        <label for="update" class="w-25 ">카테고리 수정</label>
        <input type="text" placeholder="카테고리명" name="update" class="form-control">
        <button type="submit" class="btn btn-outline-secondary">수정</button>
      </form>
      <button type="button" class="btn-close"></button>
  </div>
<script type="text/javascript">
let cri={
		page:1
	}

//수정 버튼 클릭시 이벤트
$(document).on("click","#btn-update",function(){
  let num=$(this).data('num');
  $("#updateCategory").attr("action",`<c:url value="/manager/category/update?num=\${num}" />`);
  $(".update-box").show();
});

$(".btn-close").click(function(){
	 $(".update-box").hide();
});

//카테고리 추가 이벤트
$("#insertCategory").click(function(){
	let coName=$("#addCategory").val();
	$.ajax({
		url : '<c:url value="/manager/category/insert" />',
		method : 'post',
		data : {
			coName
		},
		success : function(data){
			if(data == "ok"){
				alert("카테고리를 추가했습니다.");
				$("#addCategory").val('');
				printCategory();
			}else{
				alert("카테고리를 추가하지 못했습니다.");
			}
		}, 
		error : function(a,b,c){
			
		}
	});
});

//카테고리 목록 출력
function printCategory(){
	$.ajax({
		url : '<c:url value="/manager/category/select" />',
		method : 'post',
		data : cri,
		success : function(data){
			let str='';
				
			for(category of data.list){
				str+=
				`
			      <div class="line mt-2">
				      <div class="co-name left">\${category.co_name }</div>
				      <div class="right">
				        <div data-num="\${category.co_num }" id="btn-update"
				        	class="click left">수정</div>
				        <div data-num="\${category.co_num }" id="btn-delete"
				        	class="click right">삭제</div>
				      </div>
			      </div>
			     `;
			}
			$(".main").html(str);	
			let pm = JSON.parse(data.pm);
			let pmStr = "";
			//이전 버튼 활성화 여부
			if(pm.prev){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
				</li>
				`;
			}
			//숫자 페이지
			for(i = pm.startPage; i<= pm.endPage; i++){
				let active = pm.cri.page == i ? "active" :"";
				pmStr += `
				<li class="page-item \${active}">
					<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
				</li>
				`
			}
			//다음 버튼 활성화 여부
			if(pm.next){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
				</li>
				`;
			}
			$(".comment-pagination>ul").html(pmStr);
		}, 
		error : function(a,b,c){
			
		}
	});
}

//카테고리 삭제 기능
$(document).on("click","#btn-delete",function(){
	let num = $(this).data("num");
	$.ajax({
		url : '<c:url value="/manager/category/delete" />',
		method : 'post',
		data : {
			num
		},
		success : function(data){
			console.log(data);
			if(data == 'ok'){
				alert("카테고리를 삭제했습니다.");
				printCategory();
			}else{
				alert("카테고리를 삭제하지 못했습니다.");
			}
		}, 
		error : function(a,b,c){
			
		}
	});
});

printCategory();
</script>
</body>
</html>