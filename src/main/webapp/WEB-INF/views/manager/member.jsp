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
		<div class="search" >
			<div class="input-group">
				<select name="type" class="form-control w-25">
					<option value="all" <c:if test='${cri.type == "all" }'>selected</c:if>>전체</option>
					<option value="grand" <c:if test='${cri.type == "grand" }'>selected</c:if>>등급</option>
					<option value="name" <c:if test='${cri.type == "name" }'>selected</c:if>>닉네임</option>
				</select>
				<input type="text"  placeholder="검색어" name="search" value="${cri.search }" class="form-control w-50">
				<button type="button" id="search" class="btn btn-outline-info w-25">검색</button>
			</div>
		</div>
		<div class="main mt-5 pb-5 text-center">
			<table class="table">
				<thead class="table-info">
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
	<div class="modal" id="myModal">
	  <div class="modal-dialog  modal-dialog-centered" >
	    <div class="modal-content">
	      <div class="modal-header">
	         <h4>회원 정보 수정</h4>
	         <button type="button" class="btn-close m-2" data-bs-dismiss="modal"></button>
	      </div>
	      <div class="modal-body input-group">
	   		<label id="userID" class="bold p-2"></label>
	    	<select name="grade"class="form-control w-30">
		    	<c:forEach items="${gradeList }" var="grade">
	    			<option value="${grade.gr_name}">${grade.gr_name}</option>
		    	</c:forEach>
	    	</select>
	    	<select name="state"class="form-control w-30">
	    		<c:forEach items="${stateList }" var="state">
	    			<option value="${state.st_state}">${state.st_state}</option>
		    	</c:forEach>
	    	</select>
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="update" class="btn btn-outline-secondary" data-bs-dismiss="modal">수정</button>
	      </div>
	    </div>
	  </div>
	</div>
<script type="text/javascript">
let cri={
	page:1,
	type:null,
	search:null
}
//검색
$(document).on("click","#search",function(){
	search();
});

$(document).on("keypress","[name=search]",function(key){
	if(key.keyCode==13){	
		$('#search').click();
	}
});


function search() {
	cri.search=$("[name=search]").val();
	cri.type=$("select").val();
	console.log(cri);
	if(cri.search==""){
		cri.type=null;
	}
	printMember(cri);
}

//클릭 이벤트
$(document).on("click",".line",function(){
	let text=$(this).data("name");
	let gr = $(this).data("gr");
	let st = $(this).data("st");
	$("#userID").text(text);
	$("select[name=grade]").val(gr).prop("selected", true);
	$("select[name=state]").val(st).prop("selected", true);
});

//수정
$(document).on("click","#update",function(){
	$.ajax({
		url : '<c:url value="/manager/member/update"/>',
		method : "post",
		data :{
			grade:$("select[name=grade]").val(),
			state:$("select[name=state]").val(),
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
				<tr class="line mt-2 click" data-name="\${member.me_id}"
					data-bs-toggle="modal" data-bs-target="#myModal"
					data-gr="\${member.me_gr_name}" data-st="\${member.me_st_state}">
					<td class="bold">\${member.me_gr_name}</td>
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