<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<section class="content">
					<div class="box-header">
						<div class="mypage-first">
							<h3 class="box-title">${mypage.username}님 반갑습니다.</h3>
							현재 등급은 ${mypage.lvname}, ${mypage.point} 포인트가 누적되었습니다.
						</div>
					</div>
					<div id="Mypage">
						<hr class="mypage-hr">
						<table class="mypage-table">
							<tr>
								<td class="mypage-td">이름</td>
								<td>${mypage.username}</td>
							</tr>
							<tr>
								<td class="mypage-td">생년월일</td>
								<td>${mypage.birth}</td>
							</tr>
							<tr>
								<td class="mypage-td">아이디</td>
								<td>${mypage.userid }</td>
							</tr>
							<tr>
								<td class="mypage-td">비밀번호</td>
								<td>${mypage.userpw}</td>
							</tr>
							<tr>
								<td class="mypage-td">이메일</td>
								<td>${mypage.email}</td>
							</tr>
							<tr>
								<td class="mypage-td">연락처</td>
								<td>${mypage.phone}</td>
							</tr>
						</table>
						<br>
						<button type="button"
							onclick="location.href='${pageContext.request.contextPath}/user/UserUpdate?userid=${mypage.userid }'" class="login-button">개인정보수정</button>
						<!-- 		<input type="button" value="개인정보수정" id="fn_UserUpdate()" />  아작스로 하고싶은데 일단 보류-->
						<br>
					</div>

				</section>
			</div>
		</div>
	</div>
	<%@include file="../include/footer.jsp"%>