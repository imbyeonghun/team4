<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>말머리 등록</title>
</head>
<body>
	<div class="header">
    	<jsp:include page = "/WEB-INF/views/header.jsp"/>
  	</div>

	<div class="container">
		<div class="input-group mb-3 mt-3">
			<input type="text" class="form-control" id="pcName" placeholder="말머리 입력" name="pcName">
			<hr>
			<div class="input-group-append">
				<button class="btn btn-success" type="submit">말머리 등록</button>
			</div>
		</div>
		<div class="main mt-5 pb-5 text-center">
      	<table class="table">
			<thead class="table-secondary">
				<tr>
       				<th class="w-30"></th>
      				<th class="w-30"></th>
      				<th class="w-auto"></th>
      				<th class="w-auto"></th>
     			</tr>
			</thead>
			<tbody>
		
			</tbody>
		</table>
    </div>
	</div>
</body>
</html>