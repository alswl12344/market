
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="include/header.jsp"%>

<section class="content">
	<div class="box-header">
		<h3 class="box-title">마이페이지</h3>
	</div>

	<div id="Mypage">
	
		<table>
		<th>====== 개인정보 ========</th>
			<tr>
				<td><b>유저코드 : ${mypage.usercode}</b></td>
			</tr>
			<tr>
				<td><b>이름 : ${mypage.username}<b></td>
			</tr>
			<tr>
				<td><b>ID : ${mypage.userid }</b></td>
			</tr>
			<tr>
				<td>비밀번호 : ${mypage.userpw}</td>
			</tr>
			<tr>
				<td><b>생년월일 : ${mypage.birth}<b></td>
			</tr>
			<tr>
				<td>이메일 : ${mypage.email}</td>
			</tr>
			<tr>
				<td>누적포인트 : ${mypage.point}</td>
			</tr>
			<tr>
				<td>연락처 :${mypage.phone}</td>
			</tr>
			<tr>
				<td>등급 : ${mypage.lvname}</td>
			</tr>
		</table>
	<button type="button" onclick="location.href='${pageContext.request.contextPath}/user/UserUpdate?userid=${mypage.userid }' ">개인정보수정</button>
<!-- 		<input type="button" value="개인정보수정" id="fn_UserUpdate()" />  아작스로 하고싶은데 일단 보류--> 


</section>
<%@include file="include/footer.jsp"%>

