<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말머리 등록</title>
 <script src="//code.jquery.com/jquery-3.6.1.js"></script>
 <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
</head>
<body>
	<div class="header">
    	<jsp:include page = "/WEB-INF/views/header.jsp"/>
  	</div>
	<div class="container">
		<div class="input-group mb-3 mt-3">
			<input type="text" class="form-control" id="ptName" placeholder="말머리 입력" name="ptName">
			<div class="input-group-append">
				<button class="btn btn-outline-info" type="button" id="insertPostType">말머리 등록</button>
			</div>
		</div>
		<div class="main mt-5 pb-5 text-center">
	      	<table class="table">
				<thead class="table-info">
					<tr>
	       				<th class="w-50">말머리</th>
	      				<th class="w-25"></th>
	      				<th class="w-25"></th>
	     			</tr>
				</thead>
				<tbody>
			
				</tbody>
			</table>
   		 </div>
   		  <!-- 페이지 -->
   		<div class="comment-pagination mt-3">
			<ul class="pagination justify-content-center">
				  				
			</ul>
		</div>
	</div>
	<div class="modal" id="myModal">
	  <form class="modal-dialog modal-dialog-centered" method="post" id="updatePostType">
	    <div class="modal-content">
	      <div class="modal-header">
	         <label for="update" class="w-25 ">말머리 수정</label>
	         <button type="button" class="btn-close m-2" data-bs-dismiss="modal"></button>
	      </div>
	      <div class="modal-body">
	        <input type="text" placeholder="말머리 명" name="update" class="form-control">
	      </div>
	      <div class="modal-footer">
	        <button type="submit" class="btn btn-outline-secondary" data-bs-dismiss="modal">수정</button>
	      </div>
	    </div>
	  </form>
	</div>
	<script type="text/javascript">
	
	let cri={
		page:1
	}
	
	//말머리 추가
	$("#insertPostType").click(function(){
		let ptName=$("#ptName").val();
		$.ajax({
			url : '<c:url value="/manager/postType/insert"/>',
			method : 'post',
			data : {
				ptName
			},
			success : function(data){
				if(data == "ok"){
					alert("말머리를 추가했습니다.");
					$("#ptName").val('');
					printPostType(cri)
				}else{
					alert("말머리를 추가하지 못했습니다.");
				}
			}, 
			error : function(a,b,c){
				
			}
		});
	});
	
	//수정버튼 입력
	$(document).on("click","#btn-update",function(){
		  let num=$(this).data('num');
		  $("#updatePostType").attr("action",`<c:url value="/manager/postType/update?num=\${num}" />`);
	});
	
	
	
	//삭제버튼 입력
	$(document).on("click","#btn-delete",function(){
		let num = $(this).data("num");
		$.ajax({
			url : '<c:url value="/manager/postType/delete" />',
			method : 'post',
			data : {
				num
			},
			success : function(data){
				console.log(data);
				if(data == 'ok'){
					alert("말머리를 삭제했습니다.");
					printPostType(cri);
				}else{
					alert("말머리를 삭제하지 못했습니다.");
				}
			}, 
			error : function(a,b,c){
				
			}
		});
	});
	
	
	//말머리 출력
	function printPostType(cri){
		 $.ajax({
				url : '<c:url value="/manager/postType/list"/>',
				method : "post",
				data : cri
				,
				success : function(data){
					let str='';
					for(postType of data.list){
						str+=
						`
						<tr class="line mt-2">
			       			<td class="bold">\${postType.pt_name}</td>
			        		<td data-num="\${postType.pt_num}" id="btn-update"
			        			data-bs-toggle="modal" data-bs-target="#myModal"
		          				class="click ">수정</td>
		         			<td data-num="\${postType.pt_num}" id="btn-delete"
		         				class="click">삭제</td>		
			      		</tr>
						`;
					}
					$('.main>table>tbody').html(str);
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
				error : function(a, b, c){
					
				}
			});
	}
	
	printPostType(cri);
	</script>
</body>
</html>