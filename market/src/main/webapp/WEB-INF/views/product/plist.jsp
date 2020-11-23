<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>
<body oncontextmenu="return false" ondragstart="return false"
	onselectstart="return false">
<%@include file="../include/header.jsp" %>
<div class="container">
		<div class="row">
			<div class="col-sm-12">
					<div class="box-header">
						<h3 class="box-title">상품 목록</h3>
					</div>
 <div>${msg}</div>
<div class="table-responsive">
  <table class="table">
  <tr>
  	<td>상품 번호</td>
  	<td>상품명</td>
  	<td>상품 이미지</td>
  	<td>작성일</td>
  	<td>등록기한</td>
  	<td>상품가격</td>
  	<td>상품수량</td>
  	<td>분류코드</td>
  </tr>
<c:forEach var="Product" items="${plist }">
 	<tr>
 	<td>${Product.pcode}</td>
 	<td><a href="pdetail?pcode=${Product.pcode}"> ${Product.pname} </a></td>
 	<td><img src="${Product.pimage}" style = "width:150px; height:150px"></td>
 	<td>${Product.pdate}</td>
 	<td>${Product.plimit}</td>
 	<td>${Product.pprice}</td>
 	<td>${Product.pcount}</td>
 	<td>${Product.ptcodesub}</td>
 	</tr>
</c:forEach>
<tr>
<td colspan="5" align="center">
<input class="btn btn-success" type="button" value="메인으로" 
id="main" />
<input class="btn btn-primary" type="button" value="상품 등록하기" id="pinsert"/>
<input class="btn btn-danger" type="button" value="삭제 상품 목록보기" id="pdellist"/>
<h6>상품 정렬</h6><button type="button" id="clothes">의류</button>
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
		location.href="${pageContext.request.contextPath}";
	})
	
	$('#pinsert').on('click', function(){
		location.href="pinsert";
	})
	
	$('#pdellist').on('click', function(){
		location.href="pdellist";
	})
</script>


</html>