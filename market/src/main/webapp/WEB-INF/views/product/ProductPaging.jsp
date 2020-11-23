<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

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
			<div class="logo">
					<a href="${contextPath }/Product/ProductPaging">
					<img src="../resources/logo/logo.png" class="logo-detail"/>
					</a>
					<br>
				</div>
			   <%@include file="../include/SortSearch.jsp" %>
<c:set var="i" value="0" />
<c:set var="j" value="3" />
<table style="width:100%;">
	<c:if test="${i%j == 0 }">
	<tr>
	</c:if>
<c:forEach var="Product" items="${viewAll}">
	<td style="width:30%; padding-left:30px;">
	<div align="center">
	 	<img src="${Product.pimage}" style = "width:200px; height:200px; margin-top:40px;">
 	</div>
		<br><a href="pdetail?pcode=${Product.pcode}" style="text-decoration: none; color:black; font-weight:bold;">
		<span style="font-size:20pt;">${Product.pname}</span></a>
	 	<br><span style="font-size:14pt; color: #5f4f6e; font-weight:bold;">${Product.pprice}원</span>
	 	<div style="margin-bottom:40px;"></div></td>
	<c:if test="${i%j == j-1 }">
	</tr>
	</c:if>
	<c:set var="i" value="${i+1 }" />
	</c:forEach>
</table>
  <table style="width:100%; margin-top:20px;">
  	<tr>
  		<td style="width:30%;">
  			 <!-- 검색 창 div -->
	  			<div>
				<form method ="post" action="${contextPath }/Product/ProductPagingSearch?nowPage=${paging.startPage }&cntPerPage=${paging.cntPerPage}">
					<select name="SearchOption">
						<option value="pname">제목</option>
					</select>
					<input type="text" name="keyWord" id = "keyWord" placeholder="Search for..." class="search-field">
	<!-- 				<input type="hidden" name="nowPage" value="" /> -->
	<%-- 				<input type="hidden" name="cntPerPage" value="${paging.cntPerPage}"/> --%>
					<button type="submit" class="search-icon">
				    	<img src="../resources/logo/search.png" width="20px">
				    </button>
					</form>
				</div>
  		</td>
  		<td>
  		<ul class="pagination">
			  	<c:if test="${paging.startPage != 1 }">
			  		<li class="page-item">
						<a href="${contextPath }/Product/ProductPaging?nowPage=${paging.startPage - 1}&cntPerPage=${paging.cntPerPage}" class="page-link">&lt;</a>
					</li>
				</c:if>
				<c:forEach begin="${paging.startPage }" end="${paging.endPage }" var="p">
					<c:choose>
						<c:when test="${p == paging.nowPage }">
							<li class="page-item">
							<a class="page-link">${p }</a>
							</li>
						</c:when>
						<c:when test="${p != paging.nowPage }">
							<li class="page-item">
								<a href="${contextPath }/Product/ProductPaging?nowPage=${p}&cntPerPage=${paging.cntPerPage}" class="page-link">${p }</a>
							</li>
						</c:when>
					</c:choose>
				</c:forEach>
			    <c:if test="${paging.endPage != paging.lastPage}">
			    	<li class="page-item">
						<a href="${contextPath }/Product/ProductPaging?nowPage=${paging.endPage+1 }&cntPerPage=${paging.cntPerPage}" class="page-link">&gt;</a>
					</li>
				</c:if>
			</ul>
  		</td>
  		<td style="width:30%;">
  			<div align="right">
  				<c:if test="${user.userid == 'admin'}">
		  			<input type="button" class="product-button" value="상품 등록" id="pinsert"/>
					<input type="button" class="product-button" value="삭제 상품" id="pdellist"/>
  				</c:if>
			</div>
  		</td>
  	</tr>
  </table>
	<br>
  </div>
<div class="col-sm-1"></div>
</div>
</div>


<%@include file="../include/footer.jsp" %>
</body>

<script>
	
	$('#pinsert').on('click', function(){
		location.href="pinsert";
	})
	
	$('#pdellist').on('click', function(){
		location.href="pdellist";
	})
</script>



</html>