<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="include/header.jsp"%>
<section class="content">
	<div class="box-header">
		<h3 class="box-title">게시판 글쓰기</h3>
	</div>
	<div style="float: left;">
	<select name="boardcategory">
		<option value="">상품 문의</option>
		<option value="">배송 문의</option>
		<option value="">결제 문의</option>
		<option value="">환불 문의</option>
	</select>
	</div> 
	<form role="form" method="post">
		<div class="box-body">
			<div class="form-group">
				<label>제목</label> <input type="text" name="btitle"
					class="form-control" placeholder="제목을 입력하세요">
			</div>
			<div class="form-group">
				<label>내용</label>
				<textarea class="form-control" name="bcontent" rows="3"
					placeholder="내용을 입력하세요"></textarea>
			</div>

			<div class="form-group">
				<label>작성자</label> <input type="text" name="bwriter"
					class="form-control" value="${user.name }" readonly>
			</div>
		</div>

		<div class="box-footer">
			<button type="submit" class="btn btn-primary">작성완료</button>
		</div>
	</form>
</section>
<%@include file="include/footer.jsp"%>

