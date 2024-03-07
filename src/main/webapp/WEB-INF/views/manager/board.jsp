<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>게시글 관리</title>
  <script src="//code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
  <div class="container">
    <div class="header">
      <!-- 해드부분 -->
    </div>
    <div class="select">
    	<select name="category" id="category">
      		<c:forEach items="${categoryList}" var="category">
	        	<option value="${category.co_num }">${category.co_name }</option>
	        </c:forEach>
	    </select>
    </div>
    <div class="insertPost">
      <form action="" method="post">
        <input type="text" placeholder="게시판 이름을 입력" name="addPost">
        <button type="submit">게시판 등록</button>
      </form>
    </div> 
    <div class="main">
      	<c:forEach items="${boardList }" var="board">
	      <div class="line">
	        <div class="bo-name">${board.bo_name}</div>
	        <div class="action">
	          <a href="#" class="update" data-num="${board.bo_num}">수정</a>
	          <a href="<c:url value="/manager/board/delete?num=${board.bo_num}" />" class="delete">삭제</a>
	        </div>
	      </div>
	    </c:forEach>
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

$(".update").click(function(){
  let num=$(this).data('num');
  console.log(num);
  $("#update").attr("action",`<c:url value="/manager/category/update?num=\${num}" />`);
});

$("select[name=category]").change(function(){
    let num=$(this).val();
    $.ajax({
		url : '<c:url value="/manager/board">',
		method : 'post',
		async : true, //동기/비동기 선택, true : 비동기, false : 동기
		data : {
			"num":num
		},
		success : function(data){
			
		},
		error : function (a, b, c) {
			console.error("예외 발생");
		}
	});//ajax end
  });

</script>
</body>
</html>