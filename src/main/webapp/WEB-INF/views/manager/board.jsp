<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판관리</title>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
</head>
<body>
  <div class="header">
      <jsp:include page = "/WEB-INF/views/header.jsp"/>
  </div>
  <div class="container  mt-5 mb-4">
    <div class="select">
    	<select name="category" id="category" class="form-control">
    		<option value="0" <c:if test='${cri.coNum==0}' >selected</c:if>>카테고리 선택</option>
      		<c:forEach items="${categoryList}" var="category">
	        	<option value="${category.co_num}" <c:if test='${category.co_num==cri.coNum }' >selected</c:if>
	        	>${category.co_name}</option>
	        </c:forEach>
	    </select>
    </div>
    <div class="insertBoard  mt-3 mb-3 input-group">
      	<input type="text" placeholder="게시판 이름을 입력" id="addBoard"
      	class="col-9 form-control">
	  	<button type="button" id="insertBoard"
	  	class="col-3 btn btn-outline-secondary">게시판 등록</button>
    </div> 
    <div class="main mt-3 pb-5">
      	<table class="table">
			<thead class="table-secondary">
				<tr>
       				<th class="w-30">게시판</th>
      				<th class="w-30">제한 등급</th>
      				<th class="w-auto"></th>
      				<th class="w-auto"></th>
     			</tr>
			</thead>
			<tbody>
		
			</tbody>
		</table>
    </div>
    <div class="comment-pagination mt-3">
		<ul class="pagination justify-content-center">
			  				
		</ul>
	</div>
  </div>
  <div class="update-box w-75">
    <form  method="post" id="updateBoard" class="input-group">
      <label for="update" class="p-2 me-3">게시판 수정</label>
      <select name="grade" id="grade" class="form-control w-30">
    		<option value="null">등급 선택</option>
      		<c:forEach items="${gradeList}" var="grade">
	        	<option value="${grade.gr_name}" 
	        	>${grade.gr_name}</option> 
	        </c:forEach>
	   </select>
      <input type="text" placeholder="게시판 이름" name="update" class="form-control w-auto">
      <button type="submit" class="btn btn-outline-secondary">수정</button>
    </form>
    <button type="button" class="btn-close"></button>
  </div>
<script type="text/javascript">
let cri={
	page:1,
	coNum:0,
}
$(document).on("click","#btn-update", function(){
  let num=$(this).data('num');
  $("#updateBoard").attr("action",`<c:url value="/manager/board/update?num=\${num}" />`);
  $(".update-box").show();
});

$(".btn-close").click(function(){
	 $(".update-box").hide();
});

//카테고리 선택후 게시판 관리 기능
$("select[name=category]").change(function(){
	cri.coNum=$(this).val();  
    printBoard(cri);
 });
  
//게시판 등록 기능
$(document).on("click","#insertBoard", function(){
	if(cri.coNum==0){
		alert("카테고리를 선택해주세요");
		return;
	}
 	let boName=$('#addBoard').val();
 	let coNum=cri.coNum;
 	$.ajax({
		url : '<c:url value="/manager/board/insert" />',
		method : 'post',
		data : {
			coNum,
			boName
		},
		success : function(data){
			if(data == "ok"){
				alert("게시판을 추가했습니다.");
				printBoard(cri);
			}else{
				alert("게시판을 추가하지 못했습니다.");
			}
		}, 
		error : function(a,b,c){
			
		}
	});
});

//게시판 삭제
$(document).on("click","#btn-delete", function(){
	let num = $(this).data("num");
	$.ajax({
		url : '<c:url value="/manager/board/delete" />',
		method : 'post',
		data : {
			num
		},
		success : function(data){
			if(data == 'ok'){
				alert("게시판을 삭제했습니다.");
				printBoard(cri);
			}else{
				alert("게시판을 삭제하지 못했습니다.");
			}
		}, 
		error : function(a,b,c){
			
		}
	});
});

//게시판 리스트 출력
function printBoard(cri){
	 $.ajax({
			url : '<c:url value="/manager/board/list"/>',
			method : "post",
			data : cri
			,
			success : function(data){
				let str='';
				for(board of data.boardList){
					str+=
					`
					<tr class="line mt-2">
		       			<td>\${board.bo_name}</td>
		       			<td>\${board.bo_gr_name}</td>
		        		<td data-num="\${board.bo_num}" id="btn-update"
	          				class="click ">수정</td>
	         			<td data-num="\${board.bo_num}" id="btn-delete"
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
</script>
</body>
</html>