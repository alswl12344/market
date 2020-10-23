<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>가지마켓</title>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%@include file="../include/header.jsp"%>
<section class="content">
	<div class="box-header">
		<h3 class="box-title">회원정보수정</h3>
	</div>

	<form role="form" method="post" action="UserUpdate">
		<div class="box-body">
			<div class="form-group">
				<label>아이디</label> <input type="text" name="userid" value = "${user.userid }"
					class="form-control" readonly>
			</div>
			<div class="form-group">
				<label>비밀번호 </label> <input type="text" name="userpw"  value="${user.userpw }" 
				class="form-control" >
			</div>
			<div class="form-group">
				<label>이름</label> <input type="text" name="username" value = "${user.username }"
					class="form-control" placeholder="이름을 입력하세요" readonly>
			</div>
			<div class="form-group">
				<label>생년월일</label> <input type="text" name="birth" value = "${user.birth }"
					class="form-control" placeholder="예)200101" readonly>
			</div>
			<div class="form-group">
				<label>이메일</label> <input type="text" name="email" value = "${user.email }"
					class="form-control" placeholder="예)market@naver.com">
			</div>
			<div class="form-group">
				<label>연락처</label> <input type="text" name="phone" value = "${user.phone }"
					class="form-control" placeholder="예)01012345678" >
			</div>
		</div>
		<button type="submit">수정완료</button>
		<input type="button" value="초기화" onclick="location.reload()" id="userupdate">
	</form>

	<c:if test="${msg!=null }">
		<h3 class="box-title">${msg }</h3>
	</c:if>

</section>
<%@include file="../include/footer.jsp"%>

