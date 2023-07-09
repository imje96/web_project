<%@page import="vo.ProductInfoDTO"%>
<%@ page import="javax.naming.*, javax.sql.*, java.sql.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%! 
// 메서드 호출은 임시 테스트용 
    List<ProductInfoDTO> getProductList() {
        List<ProductInfoDTO> dtos = new ArrayList<>();
        try {
            Context ctx = new InitialContext();
            DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
            Connection conn = ds.getConnection();
            String query = "SELECT * FROM product_info";
            PreparedStatement pstmt = conn.prepareStatement(query);
            ResultSet rs = pstmt.executeQuery();
            while (rs.next()) {
                ProductInfoDTO dto = new ProductInfoDTO(
                    rs.getInt("product_id"),
                    rs.getString("product_name"),
                    rs.getString("product_category"),
                    rs.getDouble("interest_rate"),
                    rs.getInt("term"),
                    rs.getInt("minimum_balance"),
                    rs.getString("product_description")
                );
                dtos.add(dto);
            }
            rs.close();
            pstmt.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return dtos;
    }
%>
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

<script>
function selectAllAccounts() {
     var personalIdNumber = document.getElementById("personalIdNumber").value;

     var xhr = new XMLHttpRequest();
     xhr.open("GET", "accounts?personalIdNumber=" + encodeURIComponent(personalIdNumber), true);
     xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
     console.log("readyState:", xhr.readyState, "status:", xhr.status);
     xhr.onreadystatechange = function () {
       console.log("readyState:", xhr.readyState, "status:", xhr.status);
       if (xhr.readyState === 4) {
         if (xhr.status === 200) {
           var response = xhr.responseText;
           var accountInfos = JSON.parse(response);

           var accountDetailsContainer = document.getElementById("accountDetailsContainer");
           accountDetailsContainer.innerHTML = ""; // 이전 내용 초기화

           var table = document.createElement("table");
           var thead = document.createElement("thead");
           var tbody = document.createElement("tbody");

           var trHead = document.createElement("tr");
           var thAccountNumber = document.createElement("th");
           thAccountNumber.textContent = "Account Number";
           var thAccountHolder = document.createElement("th");
           thAccountHolder.textContent = "Account Holder";
           var thBalance = document.createElement("th");
           thBalance.textContent = "Balance";

           trHead.appendChild(thAccountNumber);
           trHead.appendChild(thAccountHolder);
           trHead.appendChild(thBalance);
           thead.appendChild(trHead);

           for (var i = 0; i < accountInfos.length; i++) {
             var accountInfo = accountInfos[i];
             var tr = document.createElement("tr");
             var tdAccountNumber = document.createElement("td");
             tdAccountNumber.textContent = accountInfo.accountNumber;
             var tdAccountHolder = document.createElement("td");
             tdAccountHolder.textContent = accountInfo.accountHolder;
             var tdBalance = document.createElement("td");
             tdBalance.textContent = accountInfo.balance;

             tr.appendChild(tdAccountNumber);
             tr.appendChild(tdAccountHolder);
             tr.appendChild(tdBalance);
             tbody.appendChild(tr);
           }

           table.appendChild(thead);
           table.appendChild(tbody);
           accountDetailsContainer.appendChild(table);
         } else {
           console.log("Error:", xhr.status, xhr.statusText);
         }
       }
     };

     xhr.send();
   }

</script>


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
                            href="innerAccount.jsp">계좌이체</a></li>
                            
                            <!-- 추후 makeAccountSelect.do로 수정해야 함 -->
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


<!--  핵심 상품 리스트 부분  -->
<div class="container mt-4 border">
    <div class="section1">
        <!-- 섹션 1 내용 -->
        <div class="account-info">
            <div class="title">계좌개설</div>
            <div class="select_bank">
                <div class="btn-group" role="group" aria-label="Select Bank">
                    <button type="button" class="btn btn-secondary" onclick="selectAllAccounts()">입출금 계좌</button>
                    <button type="button" class="btn btn-secondary" onclick="selectDepositAccounts()">예금 계좌</button>
                    <button type="button" class="btn btn-secondary" onclick="selectSavingAccounts()">적금 계좌</button>
                </div>
            </div>
        </div>
    </div>
    <div class="row row-cols-3 justify-content-center">
        <% 
        List<ProductInfoDTO> productList = getProductList();
        for(ProductInfoDTO product: productList) { 
        %>
        <div class="col">
            <div class="product-container-lg border p-3" onmouseover="this.style.backgroundColor='#f1f1f1';" onmouseout="this.style.backgroundColor='transparent';">
                <p class="product-name"><%= product.getProductName() %></p>
                <p class="product-category"><%= product.getProductCategory() %></p>
                <p class="product-interest-rate-lg"><%= String.format("%.2f", product.getInterestRate()) %>%</p>
                <p class="product-minimum-balance"><small>Minimum Balance:</small> <%= product.getMinimumBalance() %></p>
                <p class="product-description-lg"><small>Description:</small> <%= product.getProductDescription() %></p>
            </div>
        </div>
        <% 
        } 
        %>
    </div>
</div>






    <!--    <div class="section2"></div>

    <div class="section3"></div>

    <div class="section4"></div> -->



    <div id="accountDetailsContainer"></div>

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

    <!— 부트스트랩 JavaScript 연결 —>
    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.min.js"></script>
</body>
</html>