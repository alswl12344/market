  
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
</head>

<script>
	function selChange() {
		var sel = document.getElementById('cntPerPage').value;
		location.href = "${contextPath }/dong/Product/pCategory?nowPage=${paging.nowPage}&ptcodemain=${paging.ptcodemain}&cntPerPage="
				+ sel;
	}
</script>

<body>
	<%@include file="../include/header.jsp"%>
	<div>${msg}</div>
	<div class="table-responsive">
		<div style="float: right;">
			<select id="cntPerPage" name="sel" onchange="selChange()">
				<option value="5"
					<c:if test="${paging.cntPerPage == 5 }">selected</c:if>>5줄
					보기</option>
				<option value="10"
					<c:if test="${paging.cntPerPage == 10 }">selected</c:if>>10줄
					보기</option>
				<option value="15"
					<c:if test="${paging.cntPerPage == 15 }">selected</c:if>>15줄
					보기</option>
				<option value="20"
					<c:if test="${paging.cntPerPage == 20 }">selected</c:if>>20줄
					보기</option>

			</select>
		</div>
	
		<table class="table">
			<tr>
				<td>상품 번호</td>
				<td>상품명</td>
		 		<td>상품 이미지</td>
				<td>작성일</td>
				<td>등록기한</td>
				<td>상품가격</td>
				<td>상품수량</td>
		
			</tr>
			<c:forEach var="Product" items="${viewAll }">
				<tr>
					<td>${Product.pcode}</td>
					<td><a href="pdetail?pcode=${Product.pcode}">
					${Product.pname} </a></td>
		 		<td><img src="${Product.pimage}" style = "width:150px; height:150px"></td>
					<td>${Product.pdate}</td>
					<td>${Product.plimit}</td>
					<td>${Product.pprice}</td>
					<td>${Product.pcount}</td>
			
				</tr>
			</c:forEach>
			<tr>
				<td colspan="5" align="center"><input class="btn btn-success"
					type="button" value="메인으로" id="main" /> 
			</tr>
		</table>
			</div>
    <%@include file="../include/SortSearch.jsp" %>

		<div style="display: block; text-align: center;">
			<c:if test="${paging.startPage != 1 }">
				<a href="${contextPath }/Product/ProductPagingSearch?nowPage=${paging.startPage - 1 }&cntPerPage=${paging.cntPerPage}">
					&lt; </a>
			</c:if>
			<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
				<c:choose>
					<c:when test="${p == paging.nowPage }">
						<b>&nbsp; ${p } &nbsp;</b>
					</c:when>
					<c:when test="${p != paging.nowPage }">
<%-- 					<c:if test ="${paging.keyWord !=null}  ">  --%>
						<a href="${contextPath }/Product/ProductPagingSearch?nowPage=${p }&cntPerPage=${paging.cntPerPage}">&nbsp;${p } &nbsp;</a>
<%-- 					</c:if > --%>
<%-- 						<a href="${contextPath }/Product/ProductPagingSearch?nowPage=${p }&cntPerPage=${paging.cntPerPage}">&nbsp;${p } &nbsp;</a> --%>
					</c:when>
				</c:choose>
			</c:forEach>
			<c:if test="${paging.endPage != paging.lastPage }">
				<a href="${contextPath }/Product/ProductPagingSearch?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}&ptcode=${paging.ptcode}">
					&gt; </a>
			</c:if>

			

	</div>


	<%@include file="../include/footer.jsp"%>
</body>

<script>
	$('#main').on('click', function() {
		location.href = "${pageContext.request.contextPath}";
	})
	$('#pinsert').on('click', function() {
		location.href = "pinsert";
	})
	$('#pdellist').on('click', function() {
		location.href = "pdellist";
	})
	
	$('#paging').on('click', function() {
		location.href = "ProductPaging";
	})
	
</script>



</html>