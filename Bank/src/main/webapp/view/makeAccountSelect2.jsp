<!-- makeAccountSelect.jsp -->
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Product List</title>
<style>
.grid-container {
  display: grid;
  grid-template-columns: auto auto auto auto; /* 바둑판 배열의 열 수를 조정하세요 */
  padding: 10px;
}
.grid-item {
  border: 1px solid rgba(0, 0, 0, 0.8);
  padding: 20px;
  font-size: 30px;
  text-align: center;
}
</style>
</head>
<body>
<div class="grid-container">
  <c:forEach var="product" items="${productList}">
    <div class="grid-item">
      <p>${product.productName}</p>
      <p>${product.productCategory}</p>
      <p>${product.interestRate}%</p>
      <p>Minimum Balance: ${product.minimumBalance}</p>
      <p>Description: ${product.productDescription}</p>
    </div>
  </c:forEach>
</div>
</body>
</html>
