<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Detail</title>
<!-- 댓글 작성 -->
</head>
<body>
<section>
<div class="table-responsive">
  <table class="table">

	<form>
	<div class="form-group1">
<table width="90%" style="margin: 5px;">
<c:forEach var="boardreply" items="${list}">
<tr>
<td>작성자 : ${boardreply.rewriter}<br>작성일자 : ${boardreply.redate} </td>
</tr>
<tr>
<td><textarea name="rememo" rows="3" style="width:100%;"
		readonly="readonly" class="form-control1">
${boardreply.rememo}</textarea></td>
</tr>
<tr>
<td style="text-align:right;">
<a href="replyupdate?reno=${boardreply.reno}">댓글 수정</a>
<a href="replydelete?reno=${boardreply.reno}">댓글 삭제</a>
<button type="button" class="btn btn-default">댓글 수정</button>
<button type="button" class="btn btn-default1">댓글 삭제</button>
</td>
<tr>
</c:forEach>
</table>
</div>

	<script>
	$(function(){
		//댓글수정 버튼을 눌렀을 때 처리
		$(".btn-default").click(function(){
			location.href="replyupdate?reno=" + ${boardreply.reno};
		});
		//댓글삭제 버튼 눌렀을 때 처리
		$(".btn-default1").click(function(){
			location.href="replydelete?reno=" + ${boardreply.reno};
		});
	})
	</script>

</form>	
<%@ include file="../include/footer.jsp"%>
</section>		

</body>
</html>