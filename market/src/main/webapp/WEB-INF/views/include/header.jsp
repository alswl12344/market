<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html lang="en">
<head>
<title>가지마켓</title>
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
<script src="../resources/ckeditor/ckeditor.js"></script>

<style>
@font-face {
	font-family: 'SDKukdetopokki-Lt';
	src:url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/SDKukdetopokki-aLt00.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

@font-face {
	font-family: 'NanumBarunGothic';
	font-style: normal;
	font-weight: 400;
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot');
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWeb.eot?#iefix')
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
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot');
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebBold.eot?#iefix')
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
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot');
	src:url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.eot?#iefix')
		format('embedded-opentype'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.woff')
		format('woff'),
		url('//cdn.jsdelivr.net/font-nanumlight/1.0/NanumBarunGothicWebLight.ttf')
		format('truetype');
}

@font-face {
    font-family: 'NEXON Lv2 Gothic';
    src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-04@2.1/NEXON Lv2 Gothic.woff') format('woff');
    font-weight: normal;
    font-style: normal;
}

@font-face {
     font-family: 'locus_sangsang';
     src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_six@1.2/locus_sangsang.woff') format('woff');
     font-weight: normal;
     font-style: normal;
}

::moz-selection {
	background: #ced0f5;
}

::selection {
	background: #ced0f5;
}

* {
	font-family: 'NEXON Lv2 Gothic';
}

button {
	border: 0;
	outline: none;
}

/* nav bar */

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
	top: 0;
}


/* logo */

.logo {
	margin: 0 0 20px 0;
	text-align: center;
	float: center;
}

.logo-detail {
	width: 100px;
}

.box-header {
	text-align: center;
}

.box-title {
	font-family: 'locus_sangsang';
	font-size: 22pt;
	padding: 10px 20px;
	text-align: center;
}

.sub-title {
	font-family: 'locus_sangsang';
	text-align: center;
}

.product-container {
	margin: 40px 0;
}

.container {
	margin-top: 20px;
	margin-bottom: 30px;
	animation: fadein 2s;
	-moz-animation: fadein 2s;
	-webkit-animation: fadein 2s;
	-o-animation: fadein 2s;
}

.content {
	margin-top: 20px;
	margin-bottom: 30px;
	animation: fadein 2s;
	-moz-animation: fadein 2s;
	-webkit-animation: fadein 2s;
	-o-animation: fadein 2s;
}


@keyframes fadein {from { opacity:0;}
to {opacity: 1;}}
@-moz-keyframes fadein { /* Firefox */ from { opacity:0;}
to {opacity: 1;}}
@-webkit-keyframes fadein { /* Safari and Chrome */ from { opacity:0;}
to {opacity: 1;}}
@-o-keyframes fadein { /* Opera */ from { opacity:0;}
to {opacity: 1;}}

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

/* 아이디 찾기 */

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
	border : none;
	outline : none;
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

/* 소트 */
.sort-button {
	background : white;
	color : #5f4f6e;
	font-weight: bold;
	font-size : 12pt;
}

/* 상품 목록 */
.product-table {
	width: 100%; 
	margin-top: 20px; 
	margin-bottom: 20px;
}

.product-name {
	text-align: center;
	font-size : 22pt;
	font-weight: bold;
}

.product-title {
	padding-left : 20px;
	font-weight: bold;
	height: 50px;
}

.product-button {
	margin-right : 10px;
	height : 30px;
	background : white;
	color : #5f4f6e;
	font-weight: bold;
	font-size : 10pt;
	border : 0;
	outline: none;
}

.detail-hr {
	border: 0;
	height: 2px;
	background-color: #b6b4b8;
}

/* 상품등록 */
.product-table {
	width: 100%;
}

.product-tr {
	padding : 10px;
	height: 45px;
}

.product-table-title {
	font-weight: bold;
	padding-left: 20px;
}

/* 회원가입 */
.join-table {
	width: 100%;
	height: 400px;
}

.join-table-title {
	font-weight: bold;
	padding-left: 20px;
}

.join-check {
	background-color: white;
	font-weight: bold;
	color : #5f4f6e;
	border : none;
	outline: none;
}

.join-button {
	width: 150px;
	height: 40px;
	background-color: #5f4f6e;
	color: white;
	font-weight: bold;
	margin: 5px;
	border: 0;
	outline: none;
}

.join-button-white {
	width: 150px;
	height: 40px;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin: 5px;
	border: 0;
	outline: none;
}

.join-footer {
	margin-bottom : 60px;
}

/* 마이페이지 */

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
	height: 200px;
	padding: 10px;
	margin-top: 20px;
}

.mypage-td {
	padding-left : 10px;
	font-weight: bold;
}

/* 주소지 */

.del-button {
	width: 100%;
	height: 50px;
	display: block;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin-bottom: 20px;
}

.del-table {
	width: 100%;
	margin-bottom : 20px;
	border-top : 3px solid #5f4f6e;
	border-bottom: 3px solid #5f4f6e; 
}

.del-title {
	color : #5f4f6e;
	padding-left : 15px;
	font-weight: bold;
}

.del-content {
	color : #5f4f6e;
	padding-left : 20px;
}

.del-list {
	width : 50px;
	height : 30px;
	background : white;
	color : #9d94a6;
	font-weight: bold;
	font-size : 10pt;
}

.del-first-tr {
	height : 40px;
	border-bottom : 1px solid #e1dee3;
}

.del-second-tr {
	height : 70px;
	border-bottom : 1px solid #b6b4b8;
}

.dupdate-table {
	width: 100%;
	height: 300px;
}

.minsert-table {
	width: 100%;
	height: 200px;
}


/* 게시판 */

.list-table {
	font-size: 12pt;
	width : 100%;
	margin-bottom: 20px;
	border-top : 3px solid #5f4f6e;
	border-bottom: 2px solid #a092ad;
}

.list-table a {
	color : black;
	text-decoration: none;
}

.list-table a:hover {
	color: #5f4f6e;
}

.list-tr-top {
	height : 60px;
	padding : 10px;
	background: #f9f7fa;
	border-bottom: 2px solid #c1b7c9;
	text-align: center;
	
}

.list-tr {
	height : 50px;
	padding : 10px;
	border-top: 2px solid #eeebf0;
}

.list-td-top {
	font-weight: bold;
	text-align: center;
	
}
.list-td {
	text-align: center;
	
}

.list-td-title {
	padding-left: 20px;
	
}

.list-insert {
	margin-right : 10px;
	width : 80px;
	height : 30px;
	background : white;
	color : #5f4f6e;
	font-weight: bold;
	font-size : 10pt;
	border : 0;
	outline : none;
}



/* 검색창 */
.search-icon {
	background-color: white;
}

.search-field {
	border : 1px solid #eeebf0;
	font-size: 9pt;
	padding : 5px;
	padding-left : 10px;
}

/* 페이지네이션 */

.pagination {
	justify-content: center;
	margin: 5px;
}

.pagination a {
	text-decoration: none;
	color : black;
}

.pagination a:hover {
	background: #5f4f6e;
	color : white;
	font-weight: bold;
}

/* 글 쓰기 */
.boardcategory {
	margin-bottom : 10px;
}

/* 상세보기 */

.detail-list {
	width : 70px;
	height : 30px;
	background : white;
	color : #5f4f6e;
	font-weight: bold;
	font-size : 10pt;
	
}

.detail-table {
	width : 100%;
	margin-top : 10px;
	border-top : 3px solid #5f4f6e;
	border-bottom : 3px solid #5f4f6e;
	margin-bottom: 20px;
}

.detail-tr {
	height : 50px;
}

.detail-tr-center {
	height : 50px;
	border-top: 2px solid #a39da6;
	border-bottom: 2px solid #a39da6;
}

.detail-title {
	width : 100px;
	background : #91839e;
	color : white;
	font-weight: bold;
	padding : 10px;
	border-bottom : 2px solid #5f4f6e;
	text-align: center;
}

.detail-label {
	padding : 10px;
	width : 40%;
}

.detail-main {
	padding : 20px;
}

/* 댓글 */

.reply-list {
	color : #353336;
}

.reply-input {
	width : 100%;
	height : 150px;
}

.reply-save {
	margin-top : 10px;
	width : 100px;
	height : 30px;
	background : white;
	color : #5f4f6e;
	text-align: right;
	font-weight: bold;
	font-size : 10pt;
}

.reply-button a {
	text-decoration: none;
	color: #5f4f6e;
}

/* 장바구니 */

.cart-footer {
	margin-top : 20px;
	margin-bottom: 30px;
}

.cart-button {
	width: 150px;
	height: 40px;
	background-color: #5f4f6e;
	color: white;
	font-weight: bold;
	margin: 5px;
	border: 0;
	outline: none;
}

.cart-button-white {
	width: 150px;
	height: 40px;
	background-color: white;
	color: #5f4f6e;
	font-weight: bold;
	margin: 5px;
	border: 0;
	outline: none;
}

/* footer */
.main-footer {
	padding: 20px 10px;
	background-color: #f0f0f0;
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
					<li class="nav-item">
					<a class="nav-link"	href="${contextPath }/user/chargepoint">${point }포인트 사용가능</a></li>
					<li>
					<a class="nav-link"href="${contextPath }/user/logout">${user.username }님 로그아웃</a></li>

				<c:if test="${user.userid=='admin' }">
						<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"> 관리자기능 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${contextPath }/user/Mypage?userid=${user.userid }">사용자 관리</a> 
								<a class="dropdown-item" href="${contextPath }/delivery/dview">결제 현황</a>
								<a class="dropdown-item" href="${contextPath }/Product/pdellist">삭제 상품 목록</a>	
								<a class="dropdown-item" href="${contextPath }/Product/pinsert">상품등록</a>
								<a class="dropdown-item" href="${contextPath }/user/UserList">회원목록</a>
							</div>
						</li>
				</c:if>
					<li class="nav-item dropdown">
						<a class="nav-link dropdown-toggle" href="#" id="navbardrop"
								data-toggle="dropdown"> 마이페이지 </a>
							<div class="dropdown-menu">
								<a class="dropdown-item" href="${contextPath }/user/Mypage?userid=${user.userid }">내 정보</a>
								<a class="dropdown-item" href="${contextPath }/delivery/management?userid=${user.userid }">주소지 관리</a> 
								<a class="dropdown-item" href="${contextPath }/delivery/dviewuser?orderuserid=${user.userid}">배송 현황</a>
							 	<a class="dropdown-item" href="${contextPath}/chat/chatroom">쪽지</a>
							</div>
						</li>

				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/Product/ProductPaging">상품목록</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${contextPath }/board/paginglist">게시판</a></li>
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