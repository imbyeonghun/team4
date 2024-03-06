<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>카페 HOME</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<!-- header 영역 -->
<header>
	<jsp:include page = "/WEB-INF/views/header.jsp"/>
</header>

<h1>카페 HOME</h1>
<div class="container-fluid">
    <div class="row">
     <!-- 3단길이의 첫번째 열 -->
      <div class="col-md-3">
      <h1>첫번째 열의 제목</h1>
      <p>첫번째 열의 본문</p>
      </div>
      <!-- 9단길이의 첫번째 열 -->
      <div class="col-md-9">
      <h1>두번째 열의 제목</h1>
      <p>두번째 열의 본문</p>
      </div>
     </div>


</body>
</html>