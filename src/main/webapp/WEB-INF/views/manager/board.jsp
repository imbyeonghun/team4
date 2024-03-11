<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시판관리</title>
   <script src="//code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
  <div class="container">
    <div class="header">
      <!-- 해드부분 -->
    </div>
    <div class="select">
    	<select name="category" id="category">
    		<option value="">카테고리 선택</option>
      		<c:forEach items="${categoryList}" var="category">
	        	<option value="${category.co_num }">${category.co_name }</option>
	        </c:forEach>
	    </select>
    </div>
    <div class="insertBoard">
        <input type="text" placeholder="게시판 이름을 입력" id="addBoard">
        <button type="button" id="insertBoard">게시판 등록</button>
    </div> 
    <div class="main">
      	
    </div>
    <div class="pagination">
      <!-- 페이지 넘기기 -->
    </div>
    <div class="update-box hidden">
      <form  method="post" id="updateBoard">
        <label for="update">게시판 수정</label>
        <input type="text" placeholder="게시판 이름" name="update">
        <button type="submit">수정</button>
      </form>
    </div>
  </div>
<script type="text/javascript">
let coNum;
$(document).on("click","#btn-update", function(){
  let num=$(this).data('num');
  $("#updateBoard").attr("action",`<c:url value="/manager/board/update?num=\${num}" />`);
});

//카테고리 선택후 게시판 관리 기능
$("select[name=category]").change(function(){
    coNum=$(this).val();  
    printBoard(coNum);
 });
  
//게시판 등록 기능
$(document).on("click","#insertBoard", function(){
	if(coNum==''){
		alert("카테고리를 선택해주세요");
		return;
	}
 	let boName=$('#addBoard').val();
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
				printBoard(coNum);
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
	if(coNum==''){
		alert("카테고리를 선택해주세요");
		return;
	}
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
				printBoard(coNum);
			}else{
				alert("게시판을 삭제하지 못했습니다.");
			}
		}, 
		error : function(a,b,c){
			
		}
	});
});

//게시판 리스트 출력
function printBoard(coNum){
	 $.ajax({
			url : '<c:url value="/manager/board/list"/>',
			method : "post",
			data : {
				coNum
			},
			success : function(data){
				let str='';
				for(board of data.boardList){
					str+=
					`
					<div class="line">
		       			<div class="bo-name">\${board.bo_name}</div>
		        		<div class="action">
		          			<div data-num="\${board.bo_num}" id="btn-update">수정</div>
		         			<div data-num="\${board.bo_num}" id="btn-delete">삭제</div>
		        		</div>
		      		</div>
					`;
				}
				$('.main').html(str);
			}, 
			error : function(a, b, c){
				
			}
		});
}

printBoard(coNum)
</script>
</body>
</html>