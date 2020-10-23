<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>회원가입</title>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<%@include file="../include/header.jsp" %>
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
		<div class="box-header">
			<h3 class="box-title">회원가입</h3>
		</div>
			
<%-- 	#{userid}, #{userpw}, #{username}, #{birth}, #{email}, #{phone}, --%>
		<tabel>
		<form role="form" method="post">
			<div class="box-body">
				<div class="form-group">
					<label>아이디 : </label> 
					<input type="text"	name="userid" class="form-control" placeholder="아이디를 입력하세요">
				</div>					
				<div class="form-group">
					<label>비밀번호 : </label>
					<input type = "text" name="userpw" class="form-control" placeholder="비밀번호를 입력하세요" >
				</div>
				<div class="form-group">
					<label>이름 : </label> 
					<input type="text" name="username" class="form-control" placeholder="이름을 입력하세요">
				</div>
				<div class="form-group">
					<label>생년월일 : </label> 
					<input type="text" name="birth" class="form-control" placeholder="예)20200101">
				</div>
				<div class="form-group">
					<label>E-mail : </label> 
					<input type="text" name="email" class="form-control" placeholder="예)market@naver.com">
				</div>
				<div class="form-group">
					<label>연락처 : </label> 
					<input type="text" name="phone" class="form-control" placeholder="예)01012345678">
				</div>
				</div>
				<br>
				<div class="box-footer">
					<button type="submit" class="login-button">작성완료</button>
				</div>
				<br>
				<br>
				
			</form>
			</tabel>
	</section>
	</div>
	</div>
	</div>
<%@include file="../include/footer.jsp"%>
					
