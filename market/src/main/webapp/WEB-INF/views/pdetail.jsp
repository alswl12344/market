<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>상세보기</title>
</head>
<body>
	<%@ include file="include/header.jsp"%>
	<script>
	
	$(function(){
		//메인 버튼을 눌렀을 때 처리
		
		$('#main').on('click' , function(){
			location.href="${pageContext.request.contextPath}";
		})
		$('#plist').on('click' , function(){
			location.href="plist";
		})
		$('#pupdate').on('click' , function(){
			location.href="pupdate?pcode=" + ${Product.pcode};
		})
		$('#pdelete').on('click' , function(){
			location.href="pdelete?pcode=" + ${Product.pcode};
		})

	});
	
	

	</script>
	
	<section class="content">
		<div class="box">
			<div class="box-header">
				<h3 class="box-title">상세보기</h3>
			</div>
			<div class="box-body">
				<div class="form-group">
					<label>상품명</label> <input type="text" name="title"
						class="form-control" value="${Product.pname}" readonly="readonly" />
				</div>
				<div class="form-group">
					<label>상품 이미지</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${Product.pimage}</textarea>
				</div>
				<div class="form-group">
					<label>상품 설명</label>
					<textarea name="content" rows="5" readonly="readonly"
						class="form-control">${Product.pcontent}</textarea>
				</div>

				<div class="form-group">
				<div class="col-sm-4"><label>수량</label> <input type="text" name="id"
						class="form-control" value="${Product.pcount}" readonly="readonly" /></div>
				<div class="col-sm-4">	
					<label>가격</label> <input type="text" name="id"
						class="form-control" value="${Product.pprice}" readonly="readonly" />
					</div>
					<div class="col-sm-4"><label>등록일자</label> <input type="text" name="id"
						class="form-control" value="${Product.pdate}" readonly="readonly" />		
				</div>
				</div>
			</div>

		</div>
		
		<div class="box-footer">
		<input class="btn btn-success" type="button" value="메인으로 돌아가기"  id="main" />
		<input class="btn btn-primary" type="button" value="목록으로 돌아가기"  id="plist" />
		<input class="btn btn-warning" type="button" value="상품 수정하기"  id="pupdate" />
		<input class="btn btn-danger" type="button" value="상품 삭제하기"  id="pdelete" />
		</div>
	
	</section>
<hr><p></p><p></p>

</body>
</html>
