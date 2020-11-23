<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 글 수정  -->
</head>
<body>
<%@ include file="../include/header.jsp"%>
<div class="container">
	<div class="row">
		<div class="col-sm-12">
			<div class="box-header">
				<h3 class="box-title">글 수정</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<input type="text" name="btitle" class="form-control" value="${board.btitle}">
					</div>
					<div class="form-group">
						<textarea class="form-control" name="bcontent" id="bcontent">${board.bcontent}</textarea>
						<script>CKEDITOR.replace('content');</script>
					</div>
					<!-- 수정에 사용할 글번호 -->
					<input type="hidden" name="bno" value="${board.bno }" />
					<!-- 수정하는 사람 -->
					<input type="hidden" name="id" value="${user.username }"/>
				</div>
		
				<div class="box-footer">
					<button type="submit" class="mng-button">수정</button>
				</div>
				<br>
			</form>
		</div>
	</div>
</div>
<%@include file="../include/footer.jsp"%>
					
