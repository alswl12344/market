<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />

<html>
<head>
<title>주소지 관리</title>
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
	<%@include file="../include/header.jsp"%>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">배송 현황</h3>
					</div>


	<!-- Content Wrapper. Contains page content -->
	<div class="content-wrapper">
	<div class="table-responsive">
	  <table class="table">
	<tr>
	  	<td>상품번호</td>
	  	<td>상품명</td>
	  	<td>주소</td>
	  	<td>연락처</td>
	  	<td>배송 현황</td>
	  	<td>작성자</td>
	  </tr>
	<c:forEach var="delivery" items="${list }">
	 	<tr>
	 	<td> ${delivery.dcode}</td>
	  	<td> ${delivery.dname}</td>
	 	<td> ${delivery.address}</td>
	 	<td> ${delivery.phone}</td>
	 	<td> ${delivery.status}</td>
	 	<td> ${delivery.userid}</td>
	 	</tr>
	</c:forEach>
	</table>
	<input class="btn btn-success" type="button" value="메인으로" id="main" />
	</div>
</div>
</div>
</div>
</div>
<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
</script>

<%@include file="../include/footer.jsp" %>
</body>
</html>