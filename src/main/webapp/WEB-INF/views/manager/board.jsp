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
      <form  method="post" id="addBoard">
        <input type="text" placeholder="게시판 이름을 입력" name="addBoard">
        <button type="submit">게시판 등록</button>
      </form>
    </div> 
    <div class="main">
      	
    </div>
    <div class="pagination">
      <!-- 페이지 넘기기 -->
    </div>
    <div class="update-box hidden">
      <form  method="post" id="update">
        <label for="update">게시판 수정</label>
        <input type="text" placeholder="bo_name" name="update">
        <button type="submit">수정</button>
      </form>
    </div>
  </div>
<script type="text/javascript">
$(document).on("click",".update", function(){
  let num=$(this).data('num');
  console.log(num);
  $("#update").attr("action",`<c:url value="/manager/board/update?num=\${num}" />`);
});

//카테고리 선택후 게시판 관리 기능
$("select[name=category]").change(function(){
    let coNum=$(this).val();
    if(coNum==null){
    	return;
    }
    $.ajax({
		url : '<c:url value="/manager/board/list"/>',
		method : "post",
		data : {
			coNum
		},
		success : function(data){
			console.log(coNum);
			console.log(data.boardList);
			let str='';
			for(board of data.boardList){
				str+=
				`
				<div class="line">
	       			<div class="bo-name">\${board.bo_name}</div>
	        		<div class="action">
	          			<a href="#" class="update" data-num="\${board.bo_num}">수정</a>
	         			 <a href="<c:url value="/manager/board/delete?num=\${board.bo_num}" />" class="delete">삭제</a>
	        		</div>
	      		</div>
				`;
			}
			$('.main').html(str);
			$("#addBoard").attr("action",`<c:url value="/manager/board/insert?num=\${coNum}" />`);
		}, 
		error : function(a, b, c){
			
		}
	});
  });

</script>
</body>
</html>