		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		
		<%@include file="include/header.jsp"%>
		
		<section class="content">
			<div class="box-header">
				<h3 class="box-title">회원가입</h3>
			</div>
			
<%-- 			#{userid}, #{userpw}, #{username}, #{birth}, #{email}, #{phone}, --%>
			<tabel>
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>ID : </label> 
						<input type="text"	name="userid" class="form-control" placeholder="ID를 입력하세요">
					</div>					
					<div class="form-group">
						<label>Password : </label>
						<input type = "text" name="userpw" class="form-control" placeholder="비밀번호를 입력하세요" >
					</div>
					<div class="form-group">
						<label>이름</label> 
						<input type="text" name="username" class="form-control" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						<label>생년월일</label> 
						<input type="text" name="birth" class="form-control" placeholder="예)200101">
					</div>
					<div class="form-group">
						<label>E-mail</label> 
						<input type="text" name="email" class="form-control" placeholder="예)market@naver.com">
					</div>
					<div class="form-group">
						<label>연락처</label> 
						<input type="text" name="phone" class="form-control" placeholder="예)01012345678">
					</div>
		
				</div>
		
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">작성완료</button>
				</div>
		
			</form>
			</tabel>
		</section>
		<%@include file="include/footer.jsp"%>
					
