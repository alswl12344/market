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
						<h3 class="box-title">주소록 관리</h3>
					</div>
				
<div class="table-responsive">
  <table class="table">
<c:forEach var="delivery" items="${list }">
 	<tr>
 	<td> ${delivery.mname}
 	<button onclick='location.href="delete?mcode=" + ${delivery.mcode}' class="mng-button">삭제</button>
 	<button onclick='location.href="mupdate?mcode=" + ${delivery.mcode}' class="mng-button">수정</button>
 	</td>
 	</tr>
 	<tr>
  	<td> ${delivery.maddress}<br>
  	 ${delivery.mnum}
  	 </td>
  	</tr>
</c:forEach>
</table>
<div align="center">
	<button class="mng-button" id="minsert">등록</button>
	<input class="mng-button-white" type="button" value="메인으로" id="main" />
<br>
</div>
</div>
</div>
</div>
</div>
<script>
	$('#main').on('click' , function(){
		location.href="${pageContext.request.contextPath}";
	})
	$('#minsert').on('click' , function(){
		location.href="minsert";
	})
	$('#mdelete').on('click' , function(){
		location.href="delete?mcode=" + ${delivery.mcode};
	})
</script>




<%@include file="../include/footer.jsp" %>
</body>
</html>