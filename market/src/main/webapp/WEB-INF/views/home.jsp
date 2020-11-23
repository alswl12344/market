<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="true" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<html>
<head>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<%@include file="include/header.jsp"%>
<div class="container">
<div class="row">
	<div class="col-sm-12">
<div class="logo">
	<img src="./resources/logo/logo.png" class="logo-detail"/>
</div>
</div>
</div>
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
		<img src="https://www.wbcsd.org/var/site/storage/images/programs/food-and-nature/food-land-use/fresh/60850-138-eng-GB/FReSH_720_square.jpg" width="100%">
		<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		<img src="https://cdn.loveandlemons.com/wp-content/uploads/2020/06/picnic-food-500x500.jpg" width="100%">
		<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		<img src="https://thegirlonbloor.com/wp-content/uploads/2019/01/Meal-Prep-Egg-and-Sausage-McMuffin-4-500x500.jpg" width="100%">
		<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
		<img src="https://www.melissassouthernstylekitchen.com/wp-content/uploads/2019/02/SouthernFriedChicken002-500x500.jpg" width="100%">
		<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
  </div>
</div>
<div class="product-container">
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
			<img src="https://www.dinneratthezoo.com/wp-content/uploads/2017/12/meal-prep-burrito-bowls-500x500.jpg" width="100%">
			<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
			<img src="https://www.flavcity.com/wp-content/uploads/2018/05/healthy-meal-prep-recipes-500x500.jpg" width="100%">
			<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
			<img src="https://www.halfbakedharvest.com/wp-content/uploads/2019/04/Ultimate-Spring-Brunch-Board-1-500x500.jpg" width="100%">
			<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
    <div class="col-sm-3">
		<div class="product-galley-i">
			<img src="https://www.hotforfoodblog.com/wp-content/uploads/2019/09/bolognese_hotforfood_filtered1-500x500.jpg" width="100%">
			<p class="product-galley-title">상품 이름<br>
			<b>가격</b></p>
		</div>
    </div>
  </div>
</div>
</div>
<br>
<br>
<%@include file="include/footer.jsp"%>

</body>
</html>
