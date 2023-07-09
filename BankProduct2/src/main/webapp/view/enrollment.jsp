<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 가입</title>
<style>

h1 {
	text-align: center;
}

form {
	max-width: 400px;
	margin: 0 auto;
}

label {
	display: block;
	margin-bottom: 5px;
}

input[type="text"], input[type="password"], input[type="email"] {
	width: 100%;
	padding: 10px;
	margin-bottom: 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	font-size: 14px;
}

input[type="button"], input[type="submit"] {
	width: 100%;
	padding: 10px;
	border-radius: 5px;
	background-color: #4CAF50;
	color: white;
	font-size: 14px;
	border: none;
	cursor: pointer;
}

input[type="button"]:hover, input[type="submit"]:hover {
	background-color: #45a049;
}

.checkbox-group {
	display: flex;
	flex-direction: row;
	justify-content: center;
	gap: 20px;
}

.checkbox-group label {
	font-size: 16px;
}

/* 화면 크기가 600px 이하일 경우 세로 배치 */
@media (max-width: 600px) {
	.checkbox-group {
		flex-direction: column;
	}
}
</style>
<script>
    document.addEventListener("DOMContentLoaded", function () {
        // 패스워드 체크
        let passwd = document.querySelector("#pw");
        let passwdck = document.querySelector("#pwck");
        let message = document.createElement("p");
        message.style.color = "green";
        message.style.fontWeight = "bold";
        // 메시지 엘리먼트를 추가
        passwdck.insertAdjacentElement('afterend', message);
        passwdck.addEventListener("input", function () {
            if (passwd.value === passwdck.value) {
                message.textContent = "비밀번호가 일치합니다.";
                document.querySelector('input[type="submit"]').disabled = false; // 비밀번호 일치 시 회원가입 버튼 활성화
            } else {
                message.textContent = "비밀번호가 일치하지 않습니다.";
                
            }
        });
        // 회원가입 요청(submit) 시 비밀번호 일치 여부 확인
        document.querySelector('form').addEventListener("submit", function (event) {
            if (passwd.value !== passwdck.value) {
                event.preventDefault(); // submit 동작 중지
                alert("비밀번호가 일치하지 않습니다."); // 비밀번호 불일치 시 알림창 표시
            }
        });
    });
    
</script>
</head>
<body>
	<h1>상품 가입</h1>
	<form action="enrollment.do" method="post">
		<label for="type">계좌 유형:</label>
		<select name="type">
			<option value="입출금계좌" ${type == '입출금계좌' ? 'selected' : ''}>입출금계좌</option>
			<option value="예금계좌" ${type == '예금계좌' ? 'selected' : ''}>예금계좌</option>
			<option value="적금계좌" ${type == '적금계좌' ? 'selected' : ''}>적금계좌</option>
		</select>
		<label for="id">계좌별명:</label> <input type="text" name="nickname"
			id="nickname" placeholder="고객님의 계좌 별칭을 입력해주세요." required
			value="${param.nickname}">
		<label for="pw">계좌비밀번호:</label> <input type="password" name="pw"
			id="pw" placeholder="숫자 4글자를 입력해주세요." required
			value="${param.pw}"> <label for="pwck">비밀번호 확인</label> <input
			type="password" name="pwck" id="pwck" placeholder="숫자4자리를 다시 입력해주세요." required value="${param.pwck}">

		<label for="email">이메일:</label> <input type="email" name="email"
			placeholder="이메일을 입력해주세요." required value="${param.email}">
		<button type="button" onclick="sendMail()">인증 메일 발송</button>
		<br />인증번호: <input type="text" name="verifyCode">
		<button type="button" onclick="checkCode()">코드 확인</button>
		&nbsp;&nbsp; <input type="submit" value="개설 신청">
		<style>
/* 회원가입 약관 */
.contract {
	width: 700px;
	margin: 50px auto 80px;
	padding: 30px 40px 50px;
	border-radius: 30px;
	background-color: rgb(167, 193, 204);
}

.contract h1 {
	text-align: center;
}

.contract .text {
	height: 230px;
	border: 1px solid black;
	background-color: white;
	white-space: pre-line;
	overflow-y: scroll;
	margin: 0 auto 20px;
}

.contract p {
	text-align: right;
}

.contract .box {
	width: 100px;
	height: 40px;
	padding: 8px;
	margin: 0 3px;
}
</style>

		<script>
			// 팝업 창 열기
			function openPopup() {
				var popup = window.open("", "popup",
						"width=800,height=600,scrollbars=yes,resizable=yes");
				var popupDocument = popup.document;
				popupDocument
						.write('<!DOCTYPE html><html><head><title>계좌개설 약관</title></head><body>');
				popupDocument
						.write(document.querySelector('.contract .text').innerHTML);
				popupDocument.write('</body></html>');
				popupDocument.close();
			}
		</script>


		<main>
			<form id="agreementForm" class="contract" action="enrollmentOk.jsp">
				<h1>계좌개설 약관</h1>
				<div class="text" style="display: none;">
					<!-- 약관 내용 -->
					약관입니당
				</div>
				<div>
					<p>
						<input type="button" value="약관 보기" class="box"
							onclick="openPopup()">
					</p>
					<p>
						<input type="submit" value="개설 신청" class="box">
					</p>
				</div>
			</form>
		</main>
		
		<input type="submit" value="계좌 등록">
	</form>

	<!-- 나머지 HTML 코드들 -->

</body>
</html>
