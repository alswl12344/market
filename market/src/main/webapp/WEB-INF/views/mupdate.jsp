<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
</head>
<body>
<%@include file="include/header.jsp"%>
		
		<section class="content">
			<div class="box-header">
				<h3 class="box-title">주소록 수정하기</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>이름</label> <input type="text" name='mname' class="form-control"  value="${management.mname}">
					</div>
					<div class="form-group">
						<label>주소</label>
						<textarea class="form-control" name="maddress" rows="3">${management.maddress}</textarea>
					</div>
					<div class="form-group">
						<label>연락처</label>
						<textarea class="form-control" name="mnum" rows="3">${management.mnum}</textarea>
					</div>
			
					<div class="form-group">
						<label>작성자</label> <input type="text" name="userid" class="form-control" readonly="readonly"  value="${user.userid}">
					</div>
					
					<!-- 수정에 사용할 글번호 -->
					<input type="hidden" name="mcode" value="${management.mcode }" />
				</div>
		
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
			</form>
		</section>
		<%@include file="include/footer.jsp"%>
</body>
</html>