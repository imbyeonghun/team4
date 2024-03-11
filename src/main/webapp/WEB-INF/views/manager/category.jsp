<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>카테고리 관리</title>
   <script src="//code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
  <div class="container">
    <!-- 헤더부분 -->
    <div class="insertCategory">
        <input type="text" placeholder="카테고리 이름을 입력" id="addCategory">
        <button type="button" id="insertCategory">카테고리 등록</button> 
    </div>  
    <div class="main">
    	
    </div>
    <div class="pagination">
      <!-- 페이지 넘기기 -->
    </div>
    <div class="update-box hidden">
      <form  method="post" id="updateCategory" accept-charset="utf-8">
        <label for="update">카테고리 수정</label>
        <input type="text" placeholder="카테고리명" name="update">
        <button type="submit">수정</button>
      </form>
    </div>
  </div>
<script type="text/javascript">
//수정 버튼 클릭시 이벤트
$(document).on("click","#btn-update",function(){
  let num=$(this).data('num');
  $("#updateCategory").attr("action",`<c:url value="/manager/category/update?num=\${num}" />`);
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
		data : {
			
		},
		success : function(data){
			let str='';
				
			for(category of data.list){
				str+=
				`
			      <div class="line">
				      <div class="co-name">\${category.co_name }</div>
				      <div class="action">
				        <div data-num="\${category.co_num }" id="btn-update">수정</div>
				        <div data-num="\${category.co_num }" id="btn-delete">삭제</div>
				      </div>
			      </div>
			     `;
			}
			$(".main").html(str);	
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