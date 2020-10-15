<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="ContextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소록</title>
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
				<h1>주소록 관리</h1>
			</div>
		</header>
	</div>
	<!-- Left side column. contains the logo and sidebar -->
	<aside class="main-sidebar">
		<!-- sidebar: style can be found in sidebar.less -->
		<section class="sidebar">
			<ul class="nav nav-tabs">
				<div align="right">
				<button onclick='location.href="minsert"' class="btn btn-primary" style="float:right">등록</button>
				</div>
			</ul>
		</section>
		<!-- /.sidebar -->
	</aside> 
<div class="table-responsive">
  <table class="table">
<c:forEach var="delivery" items="${list }">
 	<tr>
 	<td> ${delivery.mname}<button  onclick='location.href="delete?mcode=" + ${delivery.mcode}' class="btn btn-danger"style="float:right">삭제</button>
 	<button onclick='location.href="mupdate?mcode=" + ${delivery.mcode}' class="btn btn-warning" style="float:right">수정</button> </td>
 	</tr>
 	<tr>
  	<td> ${delivery.maddress}<br>
  	 ${delivery.mnum}
  	 </td>
  	</tr>
</c:forEach>
</table>
<div colspan="5" align="center">
<input class="btn btn-success" type="button" value="메인으로" id="main" />
</div>
</div>
<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
</script>




<%@include file="include/footer.jsp" %>
</body>
</html>