<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맴버관리</title>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</head>
<body>
<div class="header">
	<jsp:include page = "/WEB-INF/views/header.jsp"/>
</div>
<div class="container">
	<div class="search">
		<select name="type" >
			<option value="all" <c:if test='${cri.type == "all" }'>selected</c:if>>전체</option>
			<option value="grand" <c:if test='${cri.type == "grand" }'>selected</c:if>>등급</option>
			<option value="name" <c:if test='${cri.type == "name" }'>selected</c:if>>닉네임</option>
		</select>
		<input type="text"  placeholder="검색어" name="search" value="${cri.search }">
		<button type="button" id="search">검색</button>
	</div>
	<div class="main">
	
	</div>
	<div class="comment-pagination">
		<ul class="pagination justify-content-center">
			  				
		</ul>
	</div>
</div>
<div class="control-box hidden">
    <div>
    	<div>아이디</div>
    	<select name="grand" id="grand">
    		<option></option>
    	</select>
    	<select name="state" id="state">
    		<option></option>
    	</select>
    	<button type="button">수정</button>
    </div>
</div>
<script type="text/javascript">
let cri={
	page:1,
	type:'all',
	search:""
}

$(document).on("change","[name=type]",function(){
	cri.type=$(this).val();
	console.log(cri);
});

$(document).on("click","#search",function(){
	cri.search=$("[name=search]").val();
	console.log(cri);
});

function printMember(cri){
	$.ajax({
		url : '<c:url value="/manager/member/list"/>',
		method : "post",
		data : cri
		,
		success : function(data){
			let str='';
			for(member of data.list){
				str+=
				`
				<div class="line">
					<ul>
						<li>등급:<span>\${member.me_gr_name}</span></li>
						<li>아이디<span>\${member.me_id}</span></li>
						<li>닉네임<span>\${member.me_name}</span></li>
						<li>가입일<span>\${member.me_date}</span></li>
						<li>상태<span>\${member.me_st_state}</span></li>
					</ul>
				</div>
				`;
			}
			$('.main').html(str);
			let pm = JSON.parse(data.pm);
			let pmStr = "";
			//이전 버튼 활성화 여부
			if(pm.prev){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.startPage-1}">이전</a>
				</li>
				`;
			}
			//숫자 페이지
			for(i = pm.startPage; i<= pm.endPage; i++){
				let active = pm.cri.page == i ? "active" :"";
				pmStr += `
				<li class="page-item \${active}">
					<a class="page-link" href="javascript:void(0);" data-page="\${i}">\${i}</a>
				</li>
				`
			}
			//다음 버튼 활성화 여부
			if(pm.next){
				pmStr += `
				<li class="page-item">
					<a class="page-link" href="javascript:void(0);" data-page="\${pm.endPage+1}">다음</a>
				</li>
				`;
			}
			$(".comment-pagination>ul").html(pmStr);
		}, 
		error : function(a, b, c){
			
		}
	});
	
	printMember(cri);
}
</script>
</body>
</html>