<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 상세 보기  -->
</head>
<body>
	<%@ include file="../include/header.jsp"%>
	<section class="content">
			<div class="box-header">
				<h3 class="box-title">댓글 작성</h3>
			</div>
		
			<form role="form" method="post">
				<div class="box-body">
					<div class="form-group">
						<label>작성자</label> <input type="text"
							name='rewriter' class="form-control" placeholder="작성자">
						<textarea class="form-control" name="rememo" rows="3"
							placeholder="내용을 입력하세요"></textarea>
					</div>
				<!-- 수정에 사용할 글 번호 (bno를 넘겨야 하는데 bno를 작성할 수 없으니 hidden으로) -->
				<input type="hidden" name="bno" value="" />
				</div>
		
				<div class="box-footer">
					<button type="submit" class="btn btn-primary">작성완료</button>
				</div>
			</form>
		</section>
	<%@include file="../include/footer.jsp" %>
</body>
</html>
