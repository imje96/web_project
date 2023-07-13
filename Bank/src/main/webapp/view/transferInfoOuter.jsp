<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	margin-left: 40px;
}

.navbar-nav .nav-link {
	color: #000000;
}

.navbar {
	padding-top: 10px;
	padding-bottom: 10px;
}

.navbar-brand {
	margin-bottom: 10px;
}

.navbar-nav {
	margin-left: -30px;
}

.logo-img {
	margin-left: 40px;
	max-width: 100px;
	max-height: 100px;
}

.navbar {
	padding-top: 3px;
	padding-bottom: 3px;
}

.navbar-divider {
	border-top: 2px solid #009591;
	margin-top: 0;
	margin-bottom: 0;
	width: 100%;
}

.navbar-nav .nav-item:nth-child(6) {
	margin-left: 30px;
}

.section1 {
	background-color: #FFFFFF;
	height: 800px;
}

.transfer-info {
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
	left: 360px;
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
	padding: 10px 20px;
	border: 2px solid #cccccc;
	border-radius: 30px;
	font-size: 15px;
	white-space: nowrap;
	margin-right: 20px;
} */
.bank-buttons {
	display: flex;
	gap: 10px;
	position: absolute;
	top: 220px;
	left: 170px;
}

.rounded-button1, .rounded-button2, .rounded-button3, .rounded-button4 {
	padding: 10px 35px;
	color: #000000;
	border: none;
	border-radius: 30px;
	font-size: 15px;
	font-weight: 500;
	cursor: pointer;
	transition: background-color 0.3s, box-shadow 0.3s;
	/* 그림자 효과에 대한 transition 추가 */
	box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2); /* 그림자 효과 추가 */
}

.rounded-button1:hover, .rounded-button2:hover, .rounded-button3:hover,
	.rounded-button4:hover {
	background-color: #30354B;
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2); /* 호버 시 그림자 효과 변경 */
}

.rounded-button1 {
	background-color: #0082C9;
}

.rounded-button2 {
	background-color: #5E7EB5;
}

.rounded-button3 {
	background-color: #8CC891;
}

.rounded-button4 {
	background-color: #F6D068;
}

.rounded-button:hover {
	background-color: #30354B;
}

table {
	width: 80%;
	margin: 0 auto;
	background-color: #fff;
	border-collapse: collapse;
	border: 1px solid #ddd;
	margin-top: 50px;
}

th, td {
	padding: 10px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #419390;
	color: #fff;
	font-weight: bold;
}

tr:hover {
	background-color: #f9f9f9;
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
						<li class="nav-item"><a class="nav-link"
							href="transferInfo.jsp">거래내역조회</a></li>
						<li class="nav-item"><a class="nav-link" href="#">고객센터</a></li>
						<li class="nav-item dropdown"><a
							class="nav-link dropdown-toggle" href="#" role="button"
							data-bs-toggle="dropdown" aria-expanded="false"> 마이페이지 </a>
							<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
								<li><a class="dropdown-item" href="login.jsp">로그인</a></li>
								<li><a class="dropdown-item" href="signin.jsp">회원가입</a></li>
							</ul></li>
						<li class="nav-item" style="margin-right: -30px;"><a
							class="nav-link" href="login.jsp">로그인</a></li>
						<li class="nav-item"><a class="nav-link" href="signin.jsp">회원가입</a></li>
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


		<div class="transfer-info">
			<div class="title">거래내역 조회</div>
			<div class="select_bank">
				<div class="btn-group" role="group" aria-label="Select Bank">
					<button type="button" class="btn btn-secondary"
						onclick="location.href='transferInfo.jsp'">All</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='transferInfo.jsp'">하나은행</button>
					<button type="button" class="btn btn-secondary"
						onclick="location.href='transferInfoOuter.jsp'">다른은행</button>
				</div>
			</div>

		</div>


		<!-- 	<div class="category-wrapper">
				<div class="category">입출금</div>
				<div class="category">예금・적금</div>
			</div> -->

		<div class="bank-buttons">
			<button class="rounded-button1">우리은행</button>
			<button class="rounded-button2">기업은행</button>
			<button class="rounded-button3">농협은행</button>
			<button class="rounded-button4">국민은행</button>
		</div>
		<table>
			<thead>
				<tr>
					<th>번호</th>
					<th>내계좌</th>
					<th>상대계좌</th>
					<th>거래구분</th>
					<th>거래금액</th>
					<th>내용</th>
					<th>거래일자</th>
					<th>거래시간</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${transactionList}" var="transaction">
					<tr>
						<td>${transaction.id}</td>
						<td>${transaction.myAccount}</td>
						<td>${transaction.otherAccount}</td>
						<td>${transaction.transactionType}</td>
						<td>${transaction.amount}</td>
						<td>${transaction.description}</td>
						<td>${transaction.date}</td>
						<td>${transaction.time}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>


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
