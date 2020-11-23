<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 글 입력  -->
</head>
<body>
	<%@ include file="../include/header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-sm-12">
	<div class="logo">
					<a href="${contextPath }/Product/ProductPaging">
					<img src="../resources/logo/logo.png" class="logo-detail"/>
					</a>
					<br>
				</div>
	<div style="float: right;">
	<select name="boardcategory" class="boardcategory">
		<option value="">상품 문의</option>
		<option value="">배송 문의</option>
		<option value="">결제 문의</option>
		<option value="">환불 문의</option>
	</select>
	</div> 
	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<input type="text" name="btitle"
					class="form-control" placeholder="제목을 입력하세요">
			</div>
			<div class="form-group">
				<textarea class="form-control" name="bcontent" id="bcontent"></textarea>
				<script>CKEDITOR.replace('bcontent');</script>
			</div>
				<input type="hidden" name="bwriter" value="${user.username }">
		<div class="box-footer" align="center">
			<button type="submit" class="mng-button">작성</button>
		</div>
		<br>
		</div>
		
	</form>

</div>
</div>
</div>
<%@include file="../include/footer.jsp"%>

