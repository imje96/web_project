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

.account-info {
	width: 100%;
	height: 150px;
	position: relative;
}

.title {
	left: 180px;
	top: 45px;
	position: absolute;
	text-align: center;
	color: black;
	font-size: 30px;
	font-family: Noto Sans KR;
}

/* 은행선택 */
.select_bank {
	left: 300px;
	top: 40px;
	position: absolute;
}

.btn-group {
	display: flex;
	gap: 10px;
}

.btn-group .btn {
	font-size: 18px;
	font-family: Inter, sans-serif;
	font-weight: 500;
	line-height: 1.5;
	padding: 10px 20px;
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

/* 입출금, 예적금 */
/* .category-wrapper {
	display: flex;
	justify-content: space-between;
	align-items: center;
	width: 200px;
	height: 10px;
	position: absolute;
	top: 120px;
	left: 180px;
}

.category {
	display: inline-flex;
	align-items: center;
	justify-content: center;
	background-color: #ffffff;
	height: 40px;
	padding: 3px 15px;
	border-radius: 30px;
	font-size: 15px;
	white-space: nowrap;
	border: 2px solid #cccccc;
	border-radius: 30px;
	white-space: nowrap;
	margin-right: 20px;
} */

/* 아코디언 */
.accordion {
	width: 90%;
	margin: 0 auto;
	position: relative;
}

.accordion-item {
	margin-bottom: 10px;
}

.accordion-button {
	background-color: #f2f2f2;
	color: #333333;
	height: 80px;
	display: flex;
	align-items: center;
	justify-content: center;
	font-size: 30px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.accordion-button:hover {
	background-color: #e6e6e6;
}

.accordion-body {
	padding: 10px;
	background-color: #ffffff;
	border: 1px solid #cccccc;
	border-radius: 5px;
	height: 200px;
	font-size: 20px;
	color: #555555;
	line-height: 1.5;
}

/*계좌 상세정보*/
.account-details {
	display: flex;
	align-items: center;
}

.right-column {
	flex: 1;
	text-align: right;
}

.left-column {
	flex: 1;
	margin-top: 30px;
	margin-left: 30px;
	display: flex;
	justify-content: space-between;
	align-items: center;
	gap: 10px;
	display: flex;
}

.account-info {
	font-size: 20px;
	font-family: inherit;
}

.account-bank, .account-number, .account-name {
	display: block;
	margin-bottom: 5px;
}

.account-bank {
	color: #419390;
}

.account-number, .account-name {
	color: #080C0C;
}

.buttons {
	gap: 10px;
	margin-left: 50px;
	flex-direction: column;
}

.transfer-button, .transaction-button {
	padding: 5px 0;
	background-color: #30354B;
	color: white;
	border: none;
	font-weight: 500;
	font-size: 20px;
	border-radius: 30px;
	cursor: pointer;
	width: 150px;
}

.balance {
	font-size: 25px;
	font-family: inherit;
	white-space: nowrap;
	overflow: hidden;
	text-overflow: ellipsis;
	margin-right: 20px;
	order: -1; /* Place the balance element before the buttons */
}
/* .section2 {
	background-color: #ECF0F1;
	height: 150px;
}

.section3 {
	background-color: #fffff;
	height: 200px;
}
 */
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
		<!-- 섹션 1 내용 -->
		<div class="account-info">
			<div class="title">계좌조회</div>
			<div class="select_bank">
				<div class="btn-group" role="group" aria-label="Select Bank">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='innerAccount.jsp'">All</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='innerAccount.jsp'">하나은행</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='outerAccount.jsp'">다른은행</button>
				</div>
			</div>
			<!-- 		<div class="category-wrapper">
				<div class="category">입출금</div>
				<div class="category">예금・적금</div>
			</div> -->
		</div>
c: each { 
		<div class="accordion" id="accordionExample">
			<div class="accordion-item">
				<h2 class="accordion-header" id="headingOne">
					<button class="accordion-button" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseOne"
						aria-expanded="true" aria-controls="collapseOne">입출금 계좌</button>
				</h2>
				<div id="collapseOne" class="accordion-collapse collapse show"
					aria-labelledby="headingOne" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<!-- 입출금 계좌에 대한 세부 내용을 이곳에 추가 -->

						<div class="account-details">
							<div class="left-column">
								<div class="account-info">
									<span class="account-bank">은행명: 우리은행</span> <span
										class="account-number">계좌번호: 1234567890</span> <span
										class="account-name">계좌명: 홍길동</span>
								</div>
							</div>
							<div class="right-column">
								<span class="balance">잔액: 1,000,000원</span>
							</div>
							<div class="buttons">
								<button class="transfer-button">이체</button>
								<button class="transaction-button">거래내역</button>
							</div>
						</div>


					</div>
				</div>
			</div>

			<div class="accordion-item">
				<h2 class="accordion-header" id="headingTwo">
					<button class="accordion-button collapsed" type="button"
						data-bs-toggle="collapse" data-bs-target="#collapseTwo"
						aria-expanded="false" aria-controls="collapseTwo">예금/적금
						계좌</button>
				</h2>
				<div id="collapseTwo" class="accordion-collapse collapse"
					aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
					<div class="accordion-body">
						<!-- 예금/적금 계좌에 대한 세부 내용을 이곳에 추가 -->

						<div class="account-details">
							<div class="left-column">
								<div class="account-info">
									<span class="account-bank">은행명: 우리은행</span> <span
										class="account-number">계좌번호: 1234567890</span> <span
										class="account-name">계좌명: 홍길동</span>
								</div>
							</div>
							<div class="right-column">
								<span class="balance">잔액: 1,000,000원</span>
							</div>
							<div class="buttons">
								<button class="transfer-button">이체</button>
								<button class="transaction-button">거래내역</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>




	</div>

	<!-- 	<div class="section2"></div>

	<div class="section3"></div>

	<div class="section4"></div> -->







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