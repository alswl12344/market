<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소 등록</title>
</head>
<body>
		<%@include file="include/header.jsp"%>
		
		<section class="content">
			<div class="box-header">
				<h3 class="box-title">주소지 등록</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>이름</label> <input type="text"
							name='mname' class="form-control" placeholder="이름을 입력하세요">
					</div>
					<div class="form-group">
						<label>주소</label>
						<textarea class="form-control" name="maddress" rows="3"
							placeholder="주소를 입력하세요"></textarea>
					</div>
					<div class="form-group">
				<label>연락처</label>
						<textarea class="form-control" name="mnum" rows="3"
							placeholder="연락처를 입력하세요"></textarea>
					</div>
				</div>
							<div class="form-group">
						<label>작성자</label> <input type="text" name="userid" class="form-control"  
							value="${management.userid }" readonly>
					</div>
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">작성완료</button>
				</div>
			</form>
		</section>
		<%@include file="include/footer.jsp"%>
					

</body>
</html>