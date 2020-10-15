﻿<%@ page language="java" contentType="text/html; charset=UTF-8"
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

@font-face {
    font-family: 'KyoboHand';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@1.0/KyoboHand.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
    font-family: '777Newyorkers';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_nine_@1.1/777Newyorkers.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

::moz-selection {
	background: #ced0f5;
}

::selection {
	background: #ced0f5;
}

.topnav {
	overflow : visible;
	height : 40px;
	background-color: white;
	font-size: 5pt;
	padding : 0 2px;
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

.dropdown-menu {
    position:absolute;
    left: 0;
    top: 0 /*according to your menu height */
}


@media (max-width:768px) {
	

}

.logo {
	margin: 0 0 20px 0;
	text-align: center;
	float: center;
}

.logo-detail {
	width: 220px;
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

@keyframes fadein {
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-moz-keyframes fadein { /* Firefox */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-webkit-keyframes fadein { /* Safari and Chrome */
    from {
        opacity:0;
    }
    to {
        opacity:1;
    }
}
@-o-keyframes fadein { /* Opera */
    from {
        opacity:0;
    }
    to {
        opacity: 1;
    }
}

.product-galley-i {
	text-align: left;
	width : 100%;
}

.product-galley-title {
	margin-top : 10px;
	font-size : 14pt;
	font-family: 'NanumBarunGothic';
	line-height: 180%;
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
<link rel="shortcut icon" href="favicon.ico" type="image/x-icon">
<link rel="icon" href="/favicon.ico" type="image/x-icon">
</style>
</head>
<body>
	<script>
	$(window).resize(function(){
		if($(window).width()>768) {
			
			
		} else {
					
		}
	});
	</script>
	<div class="topnav">
			<a class="navbar-brand" href="${pageContext.request.contextPath}">
				<img src="https://img.icons8.com/dusk/2x/eggplant.png" class="nav-logo">
			</a>
		<div class="topnav-right">
		<ul class="nav justify-content-end">
    		<c:if test="${user==null }">
    		<li class="nav-item">
				<a class="nav-link" href="${contextPath}/user/login">로그인</a>
			</li>
			</c:if>
			<c:if test="${user!=null }">
			<li class="nav-item">
				<a class="nav-link" href="${contextPath }/user/logout">${user.userid }님 로그아웃</a>
			</li>
				<div>
				 <li class="nav-item dropdown">
			     <a class="nav-link dropdown-toggle" href="#" id="navbardrop" data-toggle="dropdown">
			     	마이페이지
			     </a>
			     <div class="dropdown-menu">
			       <a class="dropdown-item" href="${contextPath }/delivery/management">주소지 관리</a>
			       <a class="dropdown-item" href="${contextPath }/delivery/dview">배송 현황</a>
			     </div>
			    </li>
			    </div>
			</c:if>
			<li class="nav-item">
    			<a class="nav-link" href="${contextPath }/Product/plist">상품목록</a>
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
    			<a class="nav-link" href="${contextPath }/delivery/management">이벤트</a>
    		</li>
    		<c:if test="${user==null }">
    			<li class="nav-item">
					<a class="nav-link" href="${contextPath }/user/join">회원가입</a>
				</li>
			</c:if>
			
			</ul>
			</div>
	</div>