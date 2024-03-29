<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>

<style type="text/css">
	body{
		margin:0;
		padding:0;
	}
	#wrap{
		width:1100px;
		position : relative;
		min-height:100vh; margin: auto;
		margin-top: 50px;
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
	.container{
		width: 500px;
	}
	.container>div{
		margin-bottom: 20px;
	}
</style>
</head>
<body>
	<!-- header 영역 -->
	<header>
		<jsp:include page = "/WEB-INF/views/header.jsp"/>
	</header>
	<div class="container-fluid" id='wrap'>
		<div class="row">
			<!-- 3단길이의 첫번째 열 -->
			<div class="col-md-3">
				<jsp:include page="/WEB-INF/views/sidebar.jsp" />
			</div>
			<!-- 9단길이의 첫번째 열 -->
			<div class="col-md-9 container">
				<h1 style="padding-bottom: 20px; text-align: center;">내 정보</h1>
				<div>
					<label for="id">닉네임(아이디)</label> 
					<input type="text" class="form-control" class="form-control" id="id" name="id" value="${user.me_name}" readonly>
				</div>
				<div>
					<label for="grade">등급명</label>
					<input type="text" class="form-control" id="grade" name="grade" value="${user.me_gr_name}" readonly>
				</div>
				<div>
					<label for="email">이메일</label>
					<input type="text" class="form-control" id="email" name="email" value="${user.me_email}" readonly>
				</div>
				<div>
					<label for="date">가입일</label> 
					<input type="text" class="form-control" id="date" name="date" value="${user.me_date}" readonly>
				</div>
				<div>
					<label for="count">방문횟수</label> 
					<input type="text" class="form-control" id="count" name="count" value="${user.me_loginCount}" readonly>
				</div>
				<div>
					게시글 수 : <a href="<c:url value="/mypage/userPost"/>">${postCount}개</a>
					&nbsp;&nbsp;|&nbsp;&nbsp; 댓 글 수 : <a href="<c:url value="/mypage/userComment"/>">${commentCount}개</a>
				</div>
				<a href="<c:url value="/mypage/check"/>"><button type="button" class="btn btn-outline-success">내 정보 수정</button></a>
				&nbsp;&nbsp;<button type="button" class="btn btn-outline-danger btn-secession">카페 탈퇴하기</button>
			</div>
		</div>
		<!-- footer 영역 -->
		<footer>
			<br>
			<hr style="border-width: 1px 0 0 0; border-style: solid; border-color: #bbb;">
			<a style="color: #7dafd4;">Team Project - Team4</a> 
			<br> 
			<a style="color: #7dafd4;">CAFE</a>
		</footer>
	</div>
<script type="text/javascript">
	$(".btn-secession").click(function(){
		//확인 누르면 로그인 페이지로
		if(confirm("정말 카페를 탈퇴하시겠습니까?")){
			location.href = "<c:url value='/mypage/secession?id=${user.me_id}'/>"
			return;
		}
		//취소 누르면 현재 페이지에서 동작을 안함
		else{
			location.href = "<c:url value='/mypage/myPageHome'/>"
			return;
		}
	});
	
	let dateTag = document.querySelector("#date");
	let asd = dateTag.value;
	let date = toStringFormatting(asd);
	dateTag.value = date;
	
	function toStringFormatting(source){
		  let replaced_source = source.replace('KST', '');
	      var  date = new Date(replaced_source);
	      const year = date.getFullYear();
	      const month = leftPad(date.getMonth() + 1);
	      const day = leftPad(date.getDate());
	      return [year, month, day].join('-');
	}

	function leftPad(value){
		if (Number(value) >= 10) {
			return value;
		}
		return "0" + value;
	}
</script>
</body>
</html>