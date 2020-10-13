<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>현황!</title>
<meta
	content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no'
	name='viewport'>
<link href="${pageContext.request.contextPath}/resources/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
</head>
<script src="${pageContext.request.contextPath}/resources/jQuery/jquery-3.5.1.min.js"></script>
<script src="${pageContext.request.contextPath}/resources/bootstrap/js/bootstrap.min.js"></script>
<body class="skin-blue sidebar-mini">
	<div class="wrapper">
		<header class="main-header">
			<div class="page-header">
				<h1>배송 현황</h1>
			</div>
		</header>
	</div>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<ul class="nav nav-tabs">
				<li role="presentation" class="active"><a href="#">배송 목록</a></li>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside> 
	
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
<tr>
<td colspan="5" align="center">
<input class="btn btn-success" type="button" value="메인으로" id="main" />
</td>
</tr>
</table>
</div>
<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
</script>

<%@include file="include/footer.jsp" %>
</body>
</html>