<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>카테고리 관리</title>
   <script src="//code.jquery.com/jquery-3.6.1.js"></script>
</head>
<body>
  <div class="container">
    <!-- 헤더부분 -->
    <div class="insertCategory">
      <form action="<c:url value="/manager/category/insert" />" method="post">
        <input type="text" placeholder="카테고리 이름을 입력" name="addCategory">
        <button type="submit">카테고리 등록</button>
      </form>
    </div>  
    <div class="main">
    	<c:forEach items="${categoryList }" var="category">
	      <div class="line">
	        <div class="co-name">${category.co_name }</div>
	        <div class="action">
	          <a href="#" class="update" data-num="${category.co_num }">수정</a>
	          <a href="<c:url value="/manager/category/delete?num=${category.co_num  }" />" class="delete">삭제</a>
	        </div>
	      </div>
	    </c:forEach>
    </div>
    <div class="pagination">
      <!-- 페이지 넘기기 -->
    </div>
    <div class="update-box hidden">
      <form  method="post" id="update">
        <label for="update">카테고리 수정</label>
        <input type="text" placeholder="" name="update">
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

</script>
</body>
</html>