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
    	<div id="userID"></div>
    	<select name="grade" id="grade">
    		<option value="default">등급</option>
	    	<c:forEach items="${gradeList }" var="grade">
    			<option value="${grade.gr_name}">${grade.gr_name}</option>
	    	</c:forEach>
    	</select>
    	<select name="state" id="state">
    		<option value="default">상태</option>
    		<c:forEach items="${stateList }" var="state">
    			<option value="${state.st_state}">${state.st_state}</option>
	    	</c:forEach>
    	</select>
    	<button type="button" id="update">수정</button>
    </div>
</div>
<script type="text/javascript">
let cri={
	page:1,
	type:null,
	search:null
}

$(document).on("click","#search",function(){
	cri.search=$("[name=search]").val();
	cri.type=$("select").val();
	if(cri.search==""){
		cri.type=null;
	}
	printMember(cri);
});

$(document).on("click",".line",function(){
	let text=$(this).data("name");
	$("#userID").text(text);
});
let st;
let gr;
$("[name=state]").change(function(){
	st=$("[name=state]").val();
});
$("[name=grade]").change(function(){
	gr=$("[name=grade]").val();
	
});

$(document).on("click","#update",function(){
	$.ajax({
		url : '<c:url value="/manager/member/update"/>',
		method : "post",
		data :{
			grade:gr,
			state:st,
			userId:$("#userID").text()
		},success : function(data){
			if("ok"){
				alert("수정 완료");
				$("[name=state] option:eq(0)").prop("selected", true);
				$("[name=grade] option:eq(0)").prop("selected", true);
				printMember(cri);
			}else{
				alert("수정 실패");
			}
		},error : function(a, b, c){
			
		}
	});

});

//출력
function printMember(cri){
	$.ajax({
		url : '<c:url value="/manager/member/list"/>',
		method : "post",
		data : cri
		,
		success : function(data){
			let str='';
			if(data.list==0){
				str+=`<h1>일치하는 결과가 없습니다</h1>`;
				$('.main').html(str);
				return;
			}
			
			for(member of data.list){
				str+=
				`
				<div class="line" data-name="\${member.me_id}">
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
}

printMember(cri);
</script>
</body>
</html>