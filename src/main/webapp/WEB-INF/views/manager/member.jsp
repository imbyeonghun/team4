<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>맴버관리</title>
<script src="//code.jquery.com/jquery-3.6.1.js"></script>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/manager.css">
</head>
<body>
  <div class="header">
  	<jsp:include page = "/WEB-INF/views/header.jsp"/>
  </div>
<div class="container mt-5 mb-4">
	<form class="search">
		<div class="input-group">
			<select name="type" class="form-control w-25">
				<option value="all" <c:if test='${cri.type == "all" }'>selected</c:if>>전체</option>
				<option value="grand" <c:if test='${cri.type == "grand" }'>selected</c:if>>등급</option>
				<option value="name" <c:if test='${cri.type == "name" }'>selected</c:if>>닉네임</option>
			</select>
			<input type="text"  placeholder="검색어" name="search" value="${cri.search }" class="form-control w-50">
			<button type="submit" id="search" class="btn btn-outline-secondary w-25">검색</button>
		</div>
	</form>
	<div class="main mt-5 pb-5 text-center">
		<table class="table">
			<thead class="table-secondary">
				<tr>
       				<th>등급</th>
      				<th>아이디</th>
      				<th>닉네임</th>
      				<th>가입일</th>
      				<th>상태</th>
     			</tr>
			</thead>
			<tbody>
			
			</tbody>
		</table>
	</div>
	<div class="comment-pagination mt-3">
		<ul class="pagination justify-content-center">
			  				
		</ul>
	</div>
</div>
<div class="update-box w-75">
    <h4>회원 정보 수정</h4>
    <div class="input-group">
    	<label id="userID" class="bold me-2"></label>
    	<select name="grade" id="grade" class="form-control w-25">
    		<option value="default">등급</option>
	    	<c:forEach items="${gradeList }" var="grade">
    			<option value="${grade.gr_name}">${grade.gr_name}</option>
	    	</c:forEach>
    	</select>
    	<select name="state" id="state" class="form-control w-25">
    		<option value="default">상태</option>
    		<c:forEach items="${stateList }" var="state">
    			<option value="${state.st_state}">${state.st_state}</option>
	    	</c:forEach>
    	</select>
    	<button type="button" id="update" class="btn btn-outline-secondary w-25">수정</button>
    </div>
    <button type="button" class="btn-close"></button>
    
</div>
<script type="text/javascript">
let cri={
	page:1,
	type:null,
	search:null
}
//검색
$(document).on("submit","#search",function(){
	cri.search=$("[name=search]").val();
	cri.type=$("select").val();
	if(cri.search==""){
		cri.type=null;
	}
});
//x버튼 누를시
$(".btn-close").click(function(){
	 $(".update-box").hide();
});


$(document).on("click",".line",function(){
	let text=$(this).data("name");
	$(".update-box").show();
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
			$(".update-box").hide();
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
				<tr class="line mt-2 click" data-name="\${member.me_id}">
					<td>\${member.me_gr_name}</td>
					<td>\${member.me_id}</td>
					<td>\${member.me_name}</td>
					<td>\${toStringFormatting(member.me_date)}</li>
					<td>\${member.me_st_state}</td>
				</tr>
				`;
			}
			$('.main>table>tbody').html(str);
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
printMember(cri);
</script>
</body>
</html>