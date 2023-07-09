<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="daodto.ProductDao" %>
<%@ page import="daodto.ProductDto" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
    .product-box {
        border: 1px solid #000;
        margin: 10px;
        padding: 10px;
    }
    .product-grid {
        display: grid;
        grid-template-columns: repeat(3, 1fr);
        gap: 10px;
    }
</style>
</head>
<body>
<h1>Product List</h1>
<div class="product-grid">
<%
    // ProductDao 인스턴스 생성
    ProductDao dao = new ProductDao();

    // 모든 상품정보 가져오기 
    List<ProductDto> productList = dao.getProductList();

    // Iterate over all products
    for(ProductDto product : productList) {
%>
    <div class="product-box">
        <h2><%= product.getProductName() %></h2>
        <p>Category: <%= product.getProductCategory() %></p>
        <p>Interest Rate: <%= product.getInterestRate() %></p>
        <p>Term: <%= product.getTerm() %></p>
        <p>Minimum Balance: <%= product.getMinimumBalance() %></p>
        <p>Description: <%= product.getProductDescription() %></p>
        <form action="/view/beforenroll.do" method="post">
            <input type="hidden" name="memberId" value="<%= request.getSession().getAttribute("memberId") %>">
            <input type="hidden" name="productType" value="<%= product.getProductCategory() %>">
            <input type="submit" value="Choose">
        </form>
    </div>
<%
    }
%>
</div>
</body>
</html>
