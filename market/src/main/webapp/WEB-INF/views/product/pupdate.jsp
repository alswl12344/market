		<%@ page language="java" contentType="text/html; charset=UTF-8"
			pageEncoding="UTF-8"%>
		
		<%@include file="../include/header.jsp"%>
		
		<section class="content">
			<div class="box-header">
				<h3 class="box-title">상품 수정하기</h3>
			</div>
		
			<form role="form" method="post">
		<div class="box-body">
					<div class="form-group">
						<label>상품명</label> <input type="text"
							name="pname" class="form-control" placeholder="상품명을 입력하세요">
					</div>
					<div class="form-group">
						<label>상품 이미지</label> <input type="text"
							name="pimage" class="form-control">
					</div>
					<div class="form-group">
						<label>상품설명</label>
						<textarea class="form-control" name="pcontent" rows="3"
							placeholder="내용을 입력하세요"></textarea>
					</div>
		
					<div class="col-sm-4">
						<label>상품 수량</label> <input type="text" name="pcount" class="form-control"></div>
					<div class="col-sm-4">
						<label>상품 가격</label> <input type="text" name="pprice" class="form-control"></div>
			<div class="col-sm-4">
						<label>상품 코드</label> <input type="text" name="ptcode" class="form-control"></div>
				
					</div>
				
					<!-- 수정에 사용할 글번호 -->
					<input type="hidden" name="pcode" value="${Product.pcode }" />
			
		
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">수정완료</button>
				</div>
			</form>
		</section>
		<%@include file="../include/footer.jsp"%>
					
