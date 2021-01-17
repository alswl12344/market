<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>
<head>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">주소록 관리</h3>
					</div>
<section class="content">
<div class="table-responsive">
  <table class="del-table">
<c:forEach var="delivery" items="${list }">
 	<tr class="del-first-tr">
 	<td class="del-title"> ${delivery.mname}</td>
 	<td style="width: 30%">
 	<div align="center">
 	<button onclick='location.href="mupdate?mcode=" + ${delivery.mcode}' class="del-list">
 	수정</button>
 	<button onclick='location.href="delete?mcode=" + ${delivery.mcode}' class="del-list">
 	삭제</button>
 	</div>
 	</td>
 	</tr>
 	<tr class="del-second-tr">
  	<td colspan="2" class="del-content"> ${delivery.maddress}<br>
  	 ${delivery.mnum}
  	 </td>
  	</tr>
</c:forEach>
</table>
<div align="center">
	<button onclick='location.href="minsert"' class="del-button" id="insert">등록</button>
</div>
</div>
</div>
</div>
</div>
<script>

	$('#mdelete').on('click' , function(){
		location.href="delete?mcode=" + ${delivery.mcode};
	})
</script>


</section>

<%@include file="../include/footer.jsp" %>
</body>
</html>