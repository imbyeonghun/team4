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

<style type="text/css">
	body{
		margin:0;
		padding:0;
	}
	#wrap{
		width:100%;
		position : relative;
		min-height:100vh; 
	}
	footer{
		width: 100%;
		height: 110px;
		bottom: 0px;
		position: absolute;
		text-align: center;
	}
	section{
		padding-bottom : 110px;	/*footer의  height와 동일*/
	}
</style>

</head>
<body>
<!-- header 영역 -->
<header>
	<jsp:include page = "/WEB-INF/views/header.jsp"/>
</header>

<h1>카페 HOME</h1>

<div class="container-fluid" id='wrap'>
	<section>
	<div class="row">
		<!-- 사이드 바 영역 -->
		<div class="col-md-3">
			<jsp:include page = "/WEB-INF/views/sidebar.jsp"/>
		</div>
		<!-- 본문 영역 -->
		<div class="col-md-9">
			<div class="container">
					<h1>홈화면</h1>
					<p>홈</p>
			</div>
			
		</div>
	</div>
	</section>
	<!-- footer 영역 -->
	<footer>
	<br>
		<hr style="border-width:1px 0 0 0; border-style:solid; border-color:#bbb;">
		<a>footer 영역</a>
	</footer>
</div>
</body>
</html>