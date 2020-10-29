<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>장바구니</title>

</head>

<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<%@include file="../include/header.jsp" %>



<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">장바구니</h3>
					</div>
<div class="table-responsive">
  <table class="table">
  <tr>
  	<td>선택 </td>
  	<td>상품명</td>
  	<td>상품 이미지</td>
  	<td>수량</td>
  	<td>금액</td>
  	<td>배송비</td>
  </tr>
<c:forEach var="cart" items="${cartList }">
 	<tr>
 	<td> 선택 </td>
 	<td><a href="Product/pdetail?pcode=${cart.pcode}">${cart.cname}</a></td>
 	<td><img src="${cart.cimage}" style = "width:150px; height:150px"></td>
 	<td>${cart.cbuycount}</td>
 	<td>${cart.cprice}</td>
 	<td>배송비</td>
 	</tr>
</c:forEach>
<tr>
<td colspan="5" align="center">
<input class="btn btn-success" type="button" value="선택 상품 구매"
id="main" />
<input class="btn btn-primary" type="button" value="선택 상품 삭제" id="pinsert"/>
</td>
</tr>
  </table>
</div>
</div>
</div>
</div>

<%@include file="../include/footer.jsp" %>
</body>  
  
<script>
	$('#main').on('click' , function(){
// 		location.href="${pageContext.request.contextPath}";
	})
	
	$('#pinsert').on('click', function(){
// 		location.href="pinsert";
	})
	
	$('#pdellist').on('click', function(){
// 		location.href="pdellist";
	})
</script>


</html>