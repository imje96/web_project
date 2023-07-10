<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="vo.MemberDTO" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 <!-- createAccount.jsp로 이동하는 버튼 -->
  <button onclick="goToCreateAccount()">계좌 개설</button>

  <!-- 기존 내용 -->
<%
	MemberDTO dto = new MemberDTO();
	//DTO 객체에 데이터 설정
	dto.setMemberId("gj98");
	dto.setName("John Doe");
	dto.setEmail("johndoe@example.com");


	session.setAttribute("dto", dto);
%>
<script>
    // createAccount.jsp로 이동하는 함수
  function goToCreateAccount() {
      window.location.href = "createAccount.jsp";
  }
</script>
</body>
</html>