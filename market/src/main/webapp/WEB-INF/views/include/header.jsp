<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap 4 Website Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>


<style>
@font-face {
	font-family: 'SDKukdetopokki-Lt';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/SDKukdetopokki-aLt00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf')
		format('truetype');
}
@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 700;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf')
		format('truetype')
}
@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 300;
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
	src:
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf')
		format('truetype');
}
@font-face {
	font-family: 'KyoboHand';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
@font-face {
	font-family: '777Newyorkers';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/777Newyorkers.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}
::moz-selection {
	background: #ced0f5;
}
::selection {
	background: #ced0f5;
}
body {
	font-family: 'NanumBarunGothic';
}
button {
	border: 0;
	outline: none;
}
.topnav {
	overflow: visible;
	height: 40px;
	background-color: white;
	font-size: 5pt;
	padding: 0 2px;
}
.nav-logo {
	width: 25px;
}
.topnav a {
	float: left;
	color: #444;
	text-align: center;
	padding: 10px 10px;
	text-decoration: none;
	font-size: 9pt;
}
.topnav-right a:hover {
	color: white;
	background: #5f4f6e;
}
.topnav-right a:active {
	color: #5f4f6e;
}
.topnav-right {
	float: right;
}
.dropdown-menu {
	position: absolute;
	left: 0;
	top: 0 /*according to your menu height */
}
.logo {
	margin: 0 0 20px 0;
	text-align: center;
	float: center;
}
.logo-detail {
	width: 200px;
}
.main-footer {
	padding: 20px 10px;
	background-color: #f0f0f0;
}
.box-header {
	text-align: center;
}
.box-title {
	font-family: 'SDKukdetopokki-Lt';
	font-size: 22pt;
	padding: 10px 20px;
	text-align: center;
}
.product-container {
	margin-top: 40px;
}
.container {
	margin-top: 20px;
	animation: fadein 2s;
	-moz-animation: fadein 2s;
	-webkit-animation: fadein 2s;
	-o-animation: fadein 2s;
}
@
keyframes fadein {from { opacity:0;
	
}
to {
	opacity: 1;
}
}
@
-moz-keyframes fadein { /* Firefox */ from { opacity:0;
	
}
to {
	opacity: 1;
}
}
@
-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;
	
}
to {
	opacity: 1;
}
}
@
-o-keyframes fadein { /* Opera */ from { opacity:0;
	
}
to {
	opacity: 1;
}
}
.product-galley-i {
	text-align: left;
	width: 100%;
}
.product-galley-title {
	margin-top: 10px;
	font-size: 14pt;
	font-family: 'NanumBarunGothic';
	line-height: 180%;
}
.search-sign {
	text-align: right;
	font-size: 10pt;
}
.search-sign a {
	text-decoration: none;
	color: black;
}
.search-sign a:hover {
	color: #ced0f5;
}
.content {
	margin: 0 30%;
}
.login-box {
	position: absolute;
	width: 100%;
	padding: 10px;
	height: 50px;
	display: block;
	margin: auto;
}
.login-button {
	width: 100%;
	height: 50px;
	display: block;
	background-color: #5f4f6e;
	color: white;
	font-weight: bold;
	margin: 10px 0;
}
.search-table {
	width: 100%;
	vertical-align: middle;
}
.input-tr {
	width: 50px;
	padding: 5px;
}
.searchid-box {
	width: 100%;
	height: 40px;
	display: block;
	margin: auto;
}
.signup-button {
	width: 100%;
	height: 50px;
	display: block;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin: 10px 0;
}
.search-button {
	width: 100%;
	height: 50px;
	display: block;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin: 10px 0;
}
.mng-button {
	width: 80px;
	height: 40px;
	background-color: #5f4f6e;
	color: white;
	font-weight: bold;
	margin: 5px;
}
.mng-button-white {
	width: 80px;
	height: 40px;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin: 5px;
	border: 0;
	outline: none;
}
.mypage-title {
	text-align: center;
}
.mypage-hr {
	border: 0;
	height: 3px;
	background-color: #5f4f6e;
}
.mypage-table {
	width: 100%;
	height: 150px;
	padding: 10px;
	margin-top: 20px;
}
.main-footer {
	font-family: 'NanumBarunGothic';
}
.main-footer h4 {
	font-family: 'SDKukdetopokki-Lt';
}
.footer-contact {
	line-height: 250%;
}
.footer-detail {
	font-size: 10pt;
}
.footer-copyright {
	font-size: 8pt;
}
</style>
</head>
<body>
	<script>
		$(window).resize(function() {
			if ($(window).width() > 768) {
			} else {
			}
		});
	</script>
	<div class="topnav">
		<a class="navbar-brand" href="${pageContext.request.contextPath}">
			<img src="https://img.icons8.com/dusk/2x/eggplant.png"
			class="nav-logo">
		</a>
		<div class="topnav-right">
			<ul class="nav justify-content-end">
				<c:if test="${user==null }">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath}/user/login">로그인</a></li>
				</c:if>
				<c:if test="${user!=null }">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath }/user/logout">${user.username }님 로그아웃</a></li>
					<div>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" id="navbardrop"
							data-toggle="dropdown"> 마이페이지 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item"
									href="${contextPath }/user/Mypage?userid=${user.userid }">내
									정보</a> <a class="dropdown-item"
									href="${contextPath }/delivery/management">주소지 관리</a> <a
									class="dropdown-item" href="${contextPath }/delivery/dview">배송
									현황</a>
							</div></li>
					</div>
				</c:if>
				<li><c:if test="${user.userid == 'admin'}">
						<a class="dropdown-item" href="${contextPath }/Product/pinsert">상품등록</a>
					</c:if></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/Product/ProductPaging">상품목록</a></li>
				<li class="nav-item"><a class="nav-link" href="#">특가상품</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/board/paginglist">게시판</a></li>
				<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
				<li class="nav-item"><a class="nav-link" href="#">이벤트</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/cart/cartlist?customerid=${user.userid }">장바구니</a>
				</li>
				<c:if test="${user==null }">
					<li class="nav-item"><a class="nav-link"
						href="${contextPath }/user/join">회원가입</a></li>
				</c:if>

			</ul>
		</div>
	</div>