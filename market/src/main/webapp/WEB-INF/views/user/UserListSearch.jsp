<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
	<%@ include file="../include/header.jsp"%>
<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href="${contextPath }/dong/user/UserList?nowPage=${paging.nowPage}&cntPerPage="+sel;
	}
	
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		
		$('#main').on('click' , function(){
			location.href="${pageContext.request.contextPath}";
		})

		$('#userdelete').on('click' , function(){
			location.href="Userdelete?usercode=" + $('#userlistUsercode').val();
			
		})

	});
		
</script>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">회원 목록</h3>
					</div>
<div id="outter">
	<div style="float: right;">
		<select id="cntPerPage" name="sel" onchange="selChange()">
			<option value="5"
				<c:if test="${paging.cntPerPage == 5}">selected</c:if>>5줄 보기</option>
			<option value="10"
				<c:if test="${paging.cntPerPage == 10}">selected</c:if>>10줄 보기</option>
			<option value="15"
				<c:if test="${paging.cntPerPage == 15}">selected</c:if>>15줄 보기</option>
			<option value="20"
				<c:if test="${paging.cntPerPage == 20}">selected</c:if>>20줄 보기</option>
		</select>
	</div> 
 <div>${msg}</div>
<div class="table-responsive">
  <table class="table">
  <tr>
  	<td>회원 번호</td>
  	<td>회원 아이디</td>
  	<td>회원 이름</td>
  	<td>회원 이메일</td>
  	<td>생년 월일</td>
  	<td>포인트</td>
  	<td>전화번호</td>
  	<td>회원 레벨</td>
  </tr>
<c:forEach var="userlist" items="${viewAll }">
 	<tr>
 
 	<td><div id="userlistUsercode">${userlist.usercode}</div></td>
 	<td>${userlist.userid}</td>
 	<td>${userlist.username}</td>
 	<td>${userlist.email}</td>
 	<td>${userlist.birth}</td>
 	<td>${userlist.point}</td>
 	<td>${userlist.phone}</td>
 	<c:set var="code" value="${userlist.lvcode}" />
		
	<c:choose>
	<c:when test="${code eq '1'}">
 	<td>사용자<button onclick="location.href='UserUpgrade?usercode= ${userlist.usercode}'" value="${userlist.usercode}">등급 상승</button></td>
 		</c:when>
	<c:when test="${code eq '2'}">
	<td>VIP<button onclick="location.href='UserUpgrade?usercode= ${userlist.usercode}'" value="${userlist.usercode}">등급 상승</button></td>
	</c:when>
	</c:choose>
 	<td><button onclick="location.href='Userdelete?usercode= ${userlist.usercode}'" value="${userlist.usercode}">삭제</button></td>
 	</tr>
</c:forEach>
	</table>
	
	<div style="display: block; text-align: center;">		
		<c:if test="${paging.startPage != 1 }">
			<a href="${contextPath }/user/UserList?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">&lt;</a>
		</c:if>
		<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
			<c:choose>
				<c:when test="${p == paging.nowPage }">
					<b>${p }</b>
				</c:when>
				<c:when test="${p != paging.nowPage }">
					<a href="${contextPath }/user/UserList?nowPage=${p }&cntPerPage=${paging.cntPerPage}">${p }</a>
				</c:when>
			</c:choose>
		</c:forEach>
		<c:if test="${paging.endPage != paging.lastPage}">
			<a href="${contextPath }/user/UserList?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}">&gt;</a>
		</c:if>
	</div>
	<input class="btn btn-success" type="button" value="메인으로" 
id="main" />
<br>
</div>
	  <!-- 검색 창 div -->
	  <div>
				<form method ="post" action="${contextPath }/user/UserListSearch?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">
					<select name="SearchOption">
						<option value="username">회원 이름</option>
					</select> <input type="text" name="keyWord" id = "keyWord"/>
					<button type="submit">검색</button>
					</form>
				</div>
			
</div>
</div>
</div>
</div>

<%@include file="../include/footer.jsp" %>
</body>

<script>


</script>


</html>