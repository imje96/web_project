<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<style>
table {
	width: 80%;
	margin: 20px auto;
	border-collapse: collapse;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 12px 20px;
	text-align: left;
	border-bottom: 1px solid #eee;
}

th {
	background-color: #f2f2f2;
}

tr:hover {
	background-color: #f9f9f9;
}

.product-buttons {
	list-style-type: none;
	padding: 0;
	margin: 20px 0;
}

.product-buttons li {
	display: inline-block;
	margin-right: 10px;
}

.product-buttons button {
	background-color: #009490;
	color: #fff;
	padding: 10px 20px;
	border: none;
	border-radius: 30px;
	font-size: 16px;
	font-weight: bold;
	cursor: pointer;
	transition: background-color 0.3s, transform 0.3s, box-shadow 0.3s;
}

.product-buttons button:hover {
	background-color: #00756d;
	transform: translateY(-2px);
	box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}
</style>

</head>
<body>
	<script>
function showDetails(productType) {
  var table = document.getElementById("product-table");
  var rows = table.getElementsByTagName("tr");

  for (var i = 1; i < rows.length; i++) {
    var row = rows[i];
    var productTypeCell = row.cells[0];
    if (productTypeCell.innerText === productType) {
      row.style.display = "table-row";
    } else {
      row.style.display = "none";
    }
  }
}
</script>

	<h2>상품 목록</h2>
	<ul class="product-buttons">
		<li><button onclick="showDetails('입출금상품')">입출금 상품</button></li>
		<li><button onclick="showDetails('예금적금상품')">예금적금 상품</button></li>
		<li><button onclick="showDetails('보험상품')">보험 상품</button></li>
	</ul>

	<table id="product-table">
		<thead>
			<tr>
				<th>상품 종류</th>
				<th>세부 상품</th>
			</tr>
		</thead>
		<tbody>
			<tr>
				<td>입출금상품</td>
				<td>입출금 상품 A</td>
			</tr>
			<tr>
				<td>입출금상품</td>
				<td>입출금 상품 B</td>
			</tr>
			<tr>
				<td>예금적금상품</td>
				<td>예금적금 상품 X</td>
			</tr>
			<tr>
				<td>예금적금상품</td>
				<td>예금적금 상품 Y</td>
			</tr>
			<tr>
				<td>보험상품</td>
				<td>보험 상품 I</td>
			</tr>
			<tr>
				<td>보험상품</td>
				<td>보험 상품 II</td>
			</tr>
		</tbody>
	</table>
</body>
</html>