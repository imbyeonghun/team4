<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<style type="text/css">
	.post-list {text-decoration: none; color: black;}
	
	.list-group{
		width:170px;
		
	}
	.post-list:hover{
		text-decoration: underline;
	}
	.cafe-info {
		line-height: 0.7;
	}
	.list-group-item{
		line-height: 0.8;
	}
	.btnMenu{
		display : block; height: 35px; width:140px; text-align: center;
	}
</style>

</head>
<body>

	<div class="panel panel-info">
	<!-- 
		<div class="panel-heading">
			<h3 class="panel-title">CAFE TITLE</h3>
		</div>
	
	 -->
		<!-- 메뉴목록 -->
		<ul class="list-group">
			<li class="list-group-item">
			<br>
			<p style="font-weight: bold; font-size:20px;">[ 카페정보 ]</p> 
			<div class="cafe-info">
				<p style="height:50%; float:left; font-weight: bold;" align="justify" >회원 수</p>
				<p class="memberTotalCount" style="height:50%; float:right;" align="justify"">00명</p>
				<p style="height:50%; float:left; font-weight: bold;" align="justify" font-weight: bold;>게시글 수</p>
				<p class="postTotalCount" style="height:50%; float:right;" align="justify"">00개</p>
			</div>
			<c:if test="${user == null}">
				<div class="btn-guest">
					<button type="button" class="btn btn-outline-success btnMenu" onClick="location.href='<c:url value='/user/login'/>'">로그인</button>
					<button type="button" class="btn btn-outline-success btnMenu" onClick="location.href='<c:url value='/user/signup'/>'">회원가입</button>
				</div>
			</c:if>
			<c:if test="${user != null }">
				<div class="btn-user">
					<button type="button" class="btn btn-outline-success btnMenu" onClick="location.href='<c:url value='/'/>'">글쓰기</button>
					<button type="button" class="btn btn-outline-success btnMenu" onClick="location.href='<c:url value='/'/>'">탈퇴하기</button>
				</div>
			</c:if>
			</li>
		</ul>
		
		
		<hr style="border:0; height:3px; background: black;" >
		<!-- 카테고리 및 게시판 리스트 -->
		
		<ul class="list-group">
			<li class="list-group-item">
				<a href="#" class ="post-list" > 전체 글 보기</a>
			</li>
		</ul>
		<hr>
		
		<!-- 카테고리와 게시판을 출력하는 박스 -->
		<ul class="list-group listCaBo">
			<li class="list-group-item">
			<!-- 카테고리명 -->
				<hr>
				<!-- 게시판명 -->
				<p><a href="#" class ="board post-list"></a></p>

			</li>
		</ul>
		
		
	</div>
	
	
	
	
		
	<!-- 카테고리와 게시판 출력 -->
	<script type="text/javascript">
	$.ajax({
		url : '<c:url value="/sidebar"/>',
		method : "get",	//get도 상관없음 (post면 dopost에, get이면 doget에 작업할 것)
		data : {
			
		},
		success : function(data){
			
			console.log("포스트 수 : "+data.PTC)
			
			//카페정보 출력
			if(data.MTC){
				$('.memberTotalCount').text(data.MTC + "명");
			}
			if(data.PTC){
				$('.postTotalCount').text(data.PTC + "개");
			}
			

			//카테고리, 게시판 출력 
			
			let caStr = '';	//카테고리 코드
			console.log(data);

			for(category of data.caList){
				let boStr=''
				for(board of data.boList){
					if(category.co_num == board.bo_co_num){
						boStr +=
							`
							<c:url var="url" value="/post/list">
								<c:param name="num" value="\${board.bo_num}" />
							</c:url>
								<p><a href="${url}" class ="board post-list">\${board.bo_name}</a></p>
							`;
					}
				}
				
				console.log(boStr);	//콘솔창 확인
				
				//만약 카테고리의 게시판이 없다면
				if(boStr == ''){
					boStr +=
						`
							<p><a class ="board post-list">하위 게시판이 없습니다.</a></p>
						`;
				}
				
				caStr += `
					<li class="list-group-item">
					\${category.co_name}
						<hr>
						\${boStr}
					</li>
					<hr style="border-width:1px 0 0 0; border-style:solid; border-color:#bbb;">
				`;
				
			console.log(caStr);	//콘솔창 확인
			if(caStr == ''){
				caStr += `
					<li class="list-group-item">
					등록된 카테고리가 없습니다.
					</li>
					<hr style="border-width:1px 0 0 0; border-style:solid; border-color:#bbb;">
				`;
			}
			$(".listCaBo").html(caStr);
			}
		},
		error : function(a, b, c){
			
		}
	});
	</script>

	
</body>
</html>