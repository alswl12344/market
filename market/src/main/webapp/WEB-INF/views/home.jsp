<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
<title>Home</title>
</head>
<body>

<%@include file="include/header.jsp"%>
<div class="logo">
	<img src="https://cdn160.picsart.com/upscale-273511376022211.png?type=webp&to=min&r=640" class="logo-detail">
</div>
<div class="container">
<div class="row">
	<div class="col-sm-12">
	<div class="box-header">
		<span class="box-title">인기 상품</span>
	</div>
	</div>
</div>
</div>
<div class="container">
	<div class="row">
	
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
  </div>
</div>
<div class="container">
	<div class="row">
    <div class="col-sm-6">
		<div class="box-header">
			<span class="box-title">신상품</span>
		</div>
    </div>
    <div class="col-sm-6">
		<div class="box-header">
			<span class="box-title">특가 상품</span>
		</div>
    </div>
  </div>
</div>
<div class="container">
	<div class="row">
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		a
		</div>
    </div>
  </div>
</div>
<%@include file="include/footer.jsp"%>

</body>
</html>
