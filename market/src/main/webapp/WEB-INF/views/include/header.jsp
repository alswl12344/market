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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script>
	var media = window.matchMedia(mediaQueryString)
</script>
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
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.ttf') format('truetype');
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 700;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.ttf') format('truetype')
}

@font-face {
 font-family: 'NanumBarunGothic';
 font-style: normal;
 font-weight: 300;
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
 src: url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix') format('embedded-opentype'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff') format('woff'), url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf') format('truetype');
}

.topnav {
	overflow: hidden;
	background-color: white;
	height: 40px;
	font-size: 5pt;
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
	background: #ced0f5;
}

.topnav-right a:active {
	color: #ced0f5;
}

.topnav-right {
	float: right;
}

.logo {
	margin: 40px 0 50px 0;
	text-align: center;
}

.logo-detail {
	width: 150px;
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
	font-size: 18pt;
	padding: 10px 20px;
	background-color: #f0f0f0;
	text-align: center;
}

.container {
	margin-top: 30px;
	margin-bottom: 30px;
}

.product-galley-i {
	text-align: center;
}

.main-footer{
	font-family: 'NanumBarunGothic';
}

.main-footer h4{
	font-family: 'SDKukdetopokki-Lt';
}

.footer-contact{
	text-align: center;
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
	<div class="topnav">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">
				<img src="https://img.icons8.com/dusk/2x/eggplant.png" class="nav-logo">
			</a>
		<div class="topnav-right">
		<ul class="nav justify-content-end">
    		<c:if test="${user==null }">
    		<li class="nav-item">
				<a class="nav-link" href="${contextPath}/board/login">로그인</a>
			</li>
			</c:if>
			<c:if test="${user!=null }">
			<li class="nav-item">
				<a class="nav-link" href="#">${user.name }님</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="${contextPath }/board/logout">로그아웃</a>
			</li>
			</c:if>
			<li class="nav-item">
    			<a class="nav-link" href="${contextPath }/Product/ProductPaging">상품목록</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="#">특가상품</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="${contextPath }/board/paginglist">게시판</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="#">고객센터</a>
    		</li>
    		<li class="nav-item">
    			<a class="nav-link" href="#">이벤트</a>
    		</li>
    		<c:if test="${user==null }">
    			<li class="nav-item">
					<a class="nav-link" href="#">회원가입</a>
				</li>
			</c:if>
			<c:if test="${user!=null }">
				<li class="nav-item">
					<a class="nav-link" href="#">구매내역</a>
				</li>
				<li class="nav-item">
					<a class="nav-link" href="#">장바구니</a>
				</li>
			</c:if>
			</ul>
			</div>
	</div>