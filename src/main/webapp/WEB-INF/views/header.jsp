<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">

	

</style>

</head>

<body>
<!-- <nav class="navbar navbar-expand-sm bg-dark navbar-dark"> -->
<nav class="navbar navbar-expand-sm"  style="font-weight:bold; background-color: #e3f2fd;"> 
  <div class="container-fluid">
    <a class="navbar-brand" href="<c:url value="/"/>">
      <img  src="https://i.ibb.co/JkwJMcg/Logo.png" alt="Team4" style="width:120px;" class="rounded-pill">
    </a>
    <div class="collapse navbar-collapse justify-content-end"  id="collapsibleNavbar">
      <ul class="navbar-nav">
      	<c:if test="${user == null}">
      		<li class="nav-item">
	          <a class="nav-link" href="<c:url value="/user/login"/>">로그인</a>
	        </li>
	      	<li class="nav-item">
	          <a class="nav-link" href="<c:url value="/user/signup"/>">회원가입</a>
	        </li>
      	</c:if>
      	<c:if test="${user.me_gr_name=='운영자' }">
	      	 <li class="nav-item dropdown">
	         	<a class="nav-link dropdown-toggle" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">관리자페이지</a>
	          	<ul class="dropdown-menu">
	            	<li><a class="dropdown-item" href="<c:url value="/manager/category"/>">카테고리 관리</a></li>
	           		<li><a class="dropdown-item" href="<c:url value="/manager/board"/>">게시판 관리</a></li>
	           		<li><a class="dropdown-item" href="<c:url value="/manager/postType"/>">말머리 관리</a></li>
	            	<li><a class="dropdown-item" href="<c:url value="/manager/member"/>">회원 관리</a></li>
	          	</ul>
	        </li>
      	</c:if>

        <c:if test="${user != null}">
	        <li class="nav-item dropdown">
         		<a class="nav-link dropdown-toggle" href="javascript:void(0);" role="button" data-bs-toggle="dropdown">마이페이지</a>
          		<ul class="dropdown-menu">
            		<li><a class="dropdown-item" href="<c:url value="/mypage/myPageHome"/>">개인정보</a></li>
           			<li><a class="dropdown-item" href="<c:url value="/mypage/check"/>">내 정보 수정</a></li>
            		<li><a class="dropdown-item" href="<c:url value="/user/logout"/>">로그아웃</a></li>
          		</ul>
        	</li>
      	</c:if>
      </ul>
     </div>
	</div>	
</nav>
</body>
</html>