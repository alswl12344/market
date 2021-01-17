<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body>
<%@include file="../include/header.jsp" %>
<div class="container">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-10">
			<div class="box-header">
					<h3 class="box-title">삭제 상품</h3>
				</div>
<div class="table-responsive">
  <table class="list-table">
  <tr class="list-tr-top">
  	<th class="list-td">상품 번호</th>
  	<th class="list-td">상품명</th>
  	<th class="list-td">이미지</th>
  	<th class="list-td">작성일</th>
  	<th class="list-td">등록 기한</th>
  	<th class="list-td">가격</th>
  	<th class="list-td">수량</th>
  </tr>
<c:forEach var="Product" items="${pdellist }">
 	<tr class="list-tr" style="text-align: center;">
 	<td>${Product.pcode}</td>
 	<td><a href="pdetail?pcode=${Product.pcode}"> ${Product.pname} </a></td>
 <td><div align="center"><img src="${Product.pimage}" style = "width:150px; height:150px"></div></td>
 	<td class="list-td">${Product.pdate}</td>
 	<td class="list-td">${Product.plimit}</td>
 	<td class="list-td">${Product.pprice}</td>
 	<td class="list-td">${Product.pcount}</td>
 	</tr>
</c:forEach>
  </table>
  <div align="center">
<input class="cart-button" type="button" value="상품 목록" id="plist" />
</div>
</div>
</div>
<div class="col-sm-1"></div>
</div>
</div>
<%@include file="../include/footer.jsp" %>
</body>

<script>
	$('#plist').on('click' , function(){
		location.href="ProductPaging";
	})
</script>


</html>