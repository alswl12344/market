<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>

</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%@include file="../include/header.jsp"%>
<section class="content">
	<div class="box-header">
		<br>
		<h3 class="box-title">회원 정보 수정</h3>
	</div>
	<hr class="mypage-hr">
	<form role="form" method="post" action="UserUpdate">
		<div class="box-body">
			<table class="join-table">
            		<tr>
            			<td class="join-table-title">아이디</td>
            			<td><input type="text" name="userid" value = "${user.userid }"
					class="form-control" readonly></td>
            		</tr>
            		<tr>
            			<td class="join-table-title">비밀번호</td>
            			<td>
            			<input type="text" name="userpw"  value="${user.userpw }" 
				class="form-control" >
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">이름</td>
            			<td>
            			<input type="text" name="username" value = "${user.username }"
					class="form-control" placeholder="이름을 입력하세요" readonly>
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">생년월일</td>
            			<td>
            			<input type="text" name="birth" value = "${user.birth }"
					class="form-control" placeholder="예)200101" readonly>
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">이메일</td>
            			<td>
            			<input type="text" name="email" value = "${user.email }"
					class="form-control" placeholder="예)market@naver.com">
                  		</td>
            		</tr>
            		<tr>
            			<td class="join-table-title">연락처</td>
            			<td>
            			<input type="text" name="phone" value = "${user.phone }"
					class="form-control" placeholder="예)01012345678" >
                  		</td>
            		</tr>
            	</table>
		</div>
		<hr class="mypage-hr">
      	<div class="join-footer" align="center">
			<button type="submit" class="join-button">작성 완료</button>
			<input type="button" value="초기화" onclick="location.reload()" id="userupdate" class="join-button-white">
		</div>

		
	</form>

	<c:if test="${msg!=null }">
		<h3 class="box-title">${msg }</h3>
	</c:if>

</section>
<%@include file="../include/footer.jsp"%>

