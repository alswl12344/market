<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>Home</title></head><body>

<%@include file="../include/header.jsp"%>
<section class="content">
	<div class="box">
		<div class="box-header with-border">
			<a href="board/register"><h3 class="box-title">게시판 글쓰기</h3></a>
		</div>
	</div>

	<div class="box-header with-border">
			<a href="Product/ProductPaging"><h3 class="box-title">상품 목록보기</h3></a>
	</div>
	
	<div class="box-header with-border">
			<a href="Product/ProductPagingSearch"><h3 class="box-title">상품 목록보기+검색</h3></a>
	</div>
	
	<div class="box-header with-border">
			<a href="board/boardPaging"><h3 class="box-title">게시판 목록보기</h3></a>
	</div>
	<div class="box-header with-border">
		<c:if test="${user==null }">
		<a href="board/login"> <h3 class="box-title">로그인</h3></a>
		</c:if>
		<c:if test="${user!=null }">
		${user.name }님 환영합니다. <br />
		<a href="board/logout"> <h3 class="box-title">로그아웃</h3></a>
		</c:if>
	</div>
	<hr>
	<table border="1">
		<tr align="center">
			<td colspan="2">스프링 HttpServletRequest , ModelAndView,param, Vo , Model</td>
		</tr>
		
		<tr>
			<td width="400">
				기본을 이해하자<br>
				1.<a href="${contextPath }/main">메인1로 이동->main</a><br>	
								
			</td>
			<td width="400">
				<a href="${contextPath }/login/loginForm">loginForm로 이동->main</a><br>	
				<a href="${contextPath }/empcount">Emp Count(Mybatis)</a> :결과보기	:${cnt}<br>
							</td>
		</tr>
		</table>	
</section>
<%@include file="../include/footer.jsp"%>

</body>
</html>
