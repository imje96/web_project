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

/* 메뉴바 */
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

/* 제목  */
.section1 {
	background-color: #FFFFFF;
	height: 800px;
}

.title {
	left: 180px;
	top: 180px;
	position: absolute;
	text-align: center;
	color: black;
	font-size: 30px;
	font-family: Noto Sans KR;
}

.select_account {
	left: 300px;
	top: 180px;
	position: absolute;
}

.btn-group {
	display: flex;
	gap: 10px;
}

.btn-group .btn {
	font-size: 15px;
	font-family: Inter, sans-serif;
	font-weight: 500;
	line-height: 1.5;
	padding: 10px 10px;
	border-radius: 30px;
	background-color: #f7f7f7;
	color: #080C0C;
	transition: background-color 0.3s, color 0.3s;
	border: 2px solid #f7f7f7;
}

.btn-group .btn:hover, .btn-group .btn:focus {
	background-color: #419390;
	color: #ffffff;
	border-color: #419390;
}

.container {
	width: 50%;
	margin: 40px auto;
	margin-top: 180px;
	padding: 20px;
	background-color: #ffffff;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
	border-radius: 5px;
	padding: 20px;
}

h1 {
	text-align: center;
	margin-top: 0;
}

.form-group {
	margin-bottom: 20px;
	font-size: 20px;
}

.form-group label {
	font-weight: bold;
	margin-bottom: 8px;
	color: #333333;
}

.form-group select, .form-group input[type="text"], .form-group input[type="password"]
	{
	width: 100%;
	padding: 12px;
	border: 1px solid #cccccc;
	border-radius: 5px;
	transition: border-color 0.3s ease;
	font-size: 16px;
}

.form-group select:focus, .form-group input[type="text"]:focus,
	.form-group input[type="password"]:focus {
	outline: none;
	border-color: #009490;
}

.balance-container {
	display: flex; /* Flexbox를 사용하여 요소들을 나란히 배치 */
	align-items: center; /* 요소들을 수직 가운데로 정렬 */
}

.balance-label {
	font-weight: bold;
	margin-right: 8px; /* 우측 여백 추가 */
	color: #333333;
}

#balance {
	padding: 4px 8px;
	background-color: #f9f9f9;
	border: 1px solid #cccccc;
	border-radius: 5px;
}

.button-container {
	text-align: center;
}

.button-container button {
	background-color: #009490;
	color: #ffffff;
	padding: 12px 24px;
	border: none;
	border-radius: 5px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.button-container button:hover {
	background-color: #00756d;
}

/* 푸터 */
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
	width: 250px;
	height: 40px;
	position: absolute;
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
				<a class="navbar-brand" href="mainHana.jsp"> <img
					src="${logoUrl}" alt="로고" class="logo-img">
				</a>


				<div class="collapse navbar-collapse justify-content-center"
					id="navbarSupportedContent">
					<ul class="navbar-nav mb-2 mb-lg-0">
						<li class="nav-item"><a class="nav-link active"
							aria-current="page" href="innerAccount.jsp">계좌조회</a></li>
						<li class="nav-item"><a class="nav-link"
							href="accountTransferInner.jsp">계좌이체</a></li>
						<li class="nav-item"><a class="nav-link"
							href="makeAccountSelect.jsp">계좌개설</a></li>
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
		<div class="title">계좌이체</div>
		<div class="select_account">
			<div class="btn-group" role="group" aria-label="Select Bank">

				<button type="button" class="btn btn-secondary"
					onclick="location.href='accountTransferInner.jsp'">하나은행
					계좌이체</button>
				<button type="button" class="btn btn-secondary"
					onclick="location.href='accountTransferInner.jsp'">다른은행
					계좌이체</button>
			</div>
		</div>

		<div class="container">
			<!-- 	<h1>계좌이체를 진행하겠습니다.</h1> -->
			<form>
				<div class="form-group">
					<label for="bank-select">은행 선택</label> <select class="form-control"
						id="bank-select">
						<option value="bank1">은행1</option>
						<option value="bank2">은행2</option>
						<option value="bank3">은행3</option>
					</select>
				</div>
				<div class="form-group">
					<label for="account-select">계좌번호 선택</label> <select
						class="form-control" id="account-select">
						<option value="account1">계좌1</option>
						<option value="account2">계좌2</option>
						<option value="account3">계좌3</option>
					</select>
				</div>
				<div class="form-group">
					<label class="balance-label" id="balance-label">잔액:</label> <span
						id="balance">100,000원</span>
				</div>
				<div class="form-group">
					<label for="transfer-input">송금액</label> <input type="text"
						class="form-control" id="transfer-input">
				</div>
				<div class="form-group">
					<label for="password-input">계좌 비밀번호</label> <input type="password"
						class="form-control" id="password-input">
				</div>
				<div class="form-group">
					<label for="recipient-input">상대계좌</label> <input type="text"
						class="form-control" id="recipient-input">
				</div>
				<div class="button-container">
					<button type="submit">계좌 이체</button>
				</div>
			</form>
		</div>

	</div>






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
