<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말머리 등록</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<jsp:include page = "/WEB-INF/views/header.jsp"/>
<div class="container mt-5 mb-4">
	<div class="select">
    	<select name="postCategory" id="postCategory" class="form-control">
    		<option value="0" <c:if test='${cri.coNum==0}' >selected</c:if>>카테고리 선택</option>
      		<c:forEach items="${categoryList}" var="category">
	        	<option value="${category.co_num}" <c:if test='${category.co_num==cri.coNum }' >selected</c:if>
	        	>${category.co_name}</option>
	        </c:forEach>
	    </select>
    </div>
</div>
</body>
</html>