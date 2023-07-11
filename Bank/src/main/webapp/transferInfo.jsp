<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<title>Insert title here</title>
<style>
/* CSS 스타일 지정 */
body {
	margin: 0;
	padding: 0;
}

.header {
	background-color: #FFFFFF;
	padding: 5px;
}

.section {
	padding: 50px;
}

.footer {
	background-color: #333;
	color: #fff;
	padding: 20px;
	text-align: center;
}

.navbar-nav .nav-item {
	margin-left: 50px;
}

.navbar-nav .nav-link {
	color: #000000;
}

.navbar {
	padding-top: 10px; /* 헤더 상단 여백 조절 */
	padding-bottom: 10px; /* 헤더 하단 여백 조절 */
}

.navbar-brand {
	margin-left: 50px; /* 로고 이미지와 메뉴 간격 조절 */
}

.navbar-nav {
	margin-left: -50px; /* 메뉴 간격 조절 */
}

.logo-img {
	margin-left: 80px;
	max-width: 100px;
	max-height: 100px;
}

.navbar {
	padding-top: 3px; /* 헤더 상단 여백 조절 */
	padding-bottom: 3px; /* 헤더 하단 여백 조절 */
}

.navbar-divider {
	border-top: 2px solid #009591;
	margin-top: 0;
	margin-bottom: 0;
	width: 100%;
}

.section1 {
	background: linear-gradient(to bottom, #C1E9E8, #FFFFFF);
	height: 350px;
}

.fw-bold {
	padding-left: 200px;
	padding-top: 100px;
}

.fw-normal {
	padding-left: 200px;
	padding-top: 5px;
}

.DivQuickButtonWrap {
	position: absolute;
	right: 0;
	width: 332px;
	height: 124px;
	margin-right: 200px;
	top: 220px;
}

.Link {
	width: 150px;
	height: 100px;
	position: absolute;
	border-radius: 10px;
}

.Link:first-child {
	left: 0;
	background: linear-gradient(180deg, rgba(0, 151, 147, 0.94) 0%, #009591
		100%);
}

.Link:last-child {
	left: 180px;
	background: linear-gradient(180deg, rgba(52, 59, 84, 0.94) 0%, #323850
		100%);
}

.LinkText {
	width: 36.34px;
	height: 29px;
	left: 14px;
	top: 70px;
	position: absolute;
	color: white;
	font-size: 20px;
	font-family: Noto Sans KR;
	font-weight: 700;
	line-height: 18px;
	word-wrap: break-word;
}

.section2 {
	background-color: #ECF0F1;
	height: 150px;
}

.section3 {
	background-color: #fffff;
	height: 200px;
}

.BankFooter {
	background-color: #f7f7f7;
	padding: 20px;
	text-align: center;
}

.BankFooterContent {
	max-width: 800px;
	margin: 0 auto;
	margin-top: 30px;
	margin-left: -50px;
}

.FooterLinks {
	list-style: none;
	padding: 0;
	margin-bottom: 10px;
}

.FooterLinks li {
	display: inline-block;
	margin-right: 10px;
}

.FooterLinks li:last-child {
	margin-right: 0;
}

.FooterLinks a {
	color: #333;
	text-decoration: none;
	font-size: 14px;
}

.FooterDescription {
	color: #666;
	font-size: 12px;
}

.ContactItem {
	width: 258.27px;
	height: 40px;
	position: absolute;
	bottom: -360px;
	margin-right: 150px;
	right: 0;
}

.ContactTitle {
	width: 50px;
	height: 20px;
	text-align: right;
	color: #009591;
	font-size: 14px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 10px; /* Increase line-height to add spacing */
	word-wrap: break-word;
	position: absolute;
	top: 2px;
	right: 30px;
}

.ContactNumber {
	width: 122.17px;
	height: 36px;
	text-align: right;
	color: #333333;
	font-size: 24px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 24px;
	word-wrap: break-word;
	position: absolute;
	top: 19px;
}

.ContactNumber.Strong15881111 {
	left: 0;
	right: 30px;
}

.ContactSeparator {
	width: 9.12px;
	height: 36px;
	text-align: right;
	color: #DDDDDD;
	font-size: 24px;
	font-family: Noto Sans KR;
	font-weight: 350;
	line-height: 24px;
	word-wrap: break-word;
	position: absolute;
	top: 19px;
	left: 124.68px;
}

.ContactNumber.Strong15991111 {
	left: 105px;
}
</style>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/css/bootstrap.min.css">
</head>
<body>
	<div class="header">
		<!-- 메뉴바 내용 -->
		<nav class="navbar navbar-expand-lg">
			<div class="container-fluid">
				<c:url var="logoUrl" value="/hanabank.jpg" />
				<a class="navbar-brand" href="#"> <img src="${logoUrl}" alt="로고"
					class="logo-img">
				</a>
				<div class="collapse navbar-collapse justify-content-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="#">계좌조회</a></li>
						<li class="nav-item"><a class="nav-link" href="#">계좌이체</a></li>
						<li class="nav-item"><a class="nav-link" href="#">계좌개설</a></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
						<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
					</ul>
				</div>
				<form class="d-flex" role="search">
					<input class="form-control me-2" type="search" placeholder="Search"
						aria-label="Search">
					<button class="btn btn-outline-success" type="submit">Search</button>
				</form>
			</div>
		</nav>


	</div>
	<hr class="navbar-divider">
	<div class="section1">
		<!-- 섹션 1 내용 -->
		<div class="hello word">
			<p class="fw-bold" style="font-size: 25px;">최민영 님만을 위한 하나은행 오픈뱅킹
				서비스</p>
			<p class="fw-normal">
				일상에서 더 쉽고 편리하게!<br>하나오픈뱅킹이 언제나 함께 합니다!
			</p>
		</div>

		<div class="DivQuickButtonWrap">
			<div class="Link">
				<div class="LinkText">조회</div>
			</div>
			<div class="Link">
				<div class="LinkText">이체</div>
			</div>
		</div>

	</div>

	<div class="section2"></div>

	<div class="section3"></div>

	<div class="section4"></div>







	<footer class="BankFooter">
		<div class="BankFooterContent">
			<ul class="FooterLinks">
				<li><a href="#">이용약관</a></li>
				<li><a href="#">개인정보처리방침</a></li>
				<li><a href="#">보안정책</a></li>
				<li><a href="#">고객센터</a></li>
			</ul>
			<div class="ContactItem">
				<div class="ContactTitle">고객센터</div>
				<div class="ContactNumber Strong15881111">1588-1111</div>
				<div class="ContactSeparator">/</div>
				<div class="ContactNumber Strong15991111">1599-1111</div>
			</div>

			<p class="FooterDescription">하나은행오픈뱅킹입니다.</p>
		</div>

	</footer>

	<!-- 부트스트랩 JavaScript 연결 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>