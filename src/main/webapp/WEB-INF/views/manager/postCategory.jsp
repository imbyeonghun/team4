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
<div class="container">
	<div class="input-group mb-3 mt-3">
		<input type="text" class="form-control" id="pcName" placeholder="말머리 입력" name="pcName">
		<hr>
		<div class="input-group-append">
			<button class="btn btn-success" type="submit">말머리 등록</button>
		</div>
	</div>
</div>
</body>
</html>