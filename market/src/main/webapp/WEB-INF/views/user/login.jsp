<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">

	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
	<div class="logo">
		<img src="../resources/logo/logo.png" class="logo-detail" />
	</div>
	</div>
	</div>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<section class="content">
		      			<form method="post">
						<div class="input-group mb-3">
						   <div class="input-width">
						   <input type="text" name="userid" placeholder="아이디를 입력해주세요." class="login-box"/><br>
						   </div>
						</div>
						<div class="input-group mb-3">
						   <div class="input-width">
						   <br>
						   <input type="password" name="userpw" placeholder="비밀번호를 입력해주세요." class="login-box"/><br>
						   <br>
						   </div>
						</div>
							<div class="search-sign">
							<a href="SearchId">아이디 찾기</a> 
							&nbsp;
							<a href="SearchPw">비밀번호 찾기</a>
							</div>
						   <button type="submit" class="login-button">로그인</button>
						   <button type="button" class="signup-button">회원가입</button>
						   <br>
						   <br>
					
							<script>
								$(function(){
									//댓글수정 버튼을 눌렀을 때 처리
									$(".signup-button").click(function(){
										location.href="join"
									});
								})
							</script>
					</form>
				</section>
				</div>
			</div>
			
		</div>
	<%@include file="../include/footer.jsp"%>
</body>
</html>
