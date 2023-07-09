<!-- 1차 수정중 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품 가입</title>
<style>
body {
   font-family: Arial, sans-serif;
}

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

/* 주민등록번호 입력란 스타일 */
.personal-id-input {
   display: flex;
   justify-content: space-between;
   align-items: center;
}

.personal-id-input input[type="text"] {
   flex: 1;
   padding: 10px;
   margin-right: 5px;
   border-radius: 5px;
   border: 1px solid #ccc;
   font-size: 14px;
   text-align: center;
}

.personal-id-input span {
   font-size: 18px; /* 조정된 사이즈로 변경 */
   margin-right: 5px; /* 간격 조정 */
}
</style>



<style>
    /* 회원가입 약관 */
.contract {
    width: 700px; margin: 50px auto 80px; padding: 30px 40px 50px;
    border-radius: 30px; background-color: rgb(167, 193, 204); 
}
.contract h1 {text-align: center;}
.contract .text {
    height: 230px; border: 1px solid black; background-color: white;
    white-space: pre-line; overflow-y: scroll; margin: 0 auto 20px;
}
.contract p {text-align: right;}
.contract .box {width: 100px; height: 40px;  padding: 8px; margin: 0 3px;}

</style>

<script>
// 팝업 창 열기
function openPopup() {
    var popup = window.open("", "popup", "width=800,height=600,scrollbars=yes,resizable=yes");
    var popupDocument = popup.document;
    popupDocument.write('<!DOCTYPE html><html><head><title>계좌개설 약관</title></head><body>');
    popupDocument.write(document.querySelector('.contract').innerHTML);
    popupDocument.write('<input type="checkbox" id="agreeCheckbox"> 약관에 동의하시려면 체크해주세요<br>');
    popupDocument.write('<input type="button" value="동의" onclick="closePopup()">');
    popupDocument.write('</body></html>');
    popupDocument.close();
}

// 팝업 창 닫기
function closePopup() {
    var agreeCheckbox = window.opener.document.getElementById('agreeCheckbox');
    if (agreeCheckbox.checked) {
        window.opener.document.getElementById('agreementForm').submit();
        window.close();
    } else {
        alert('약관에 동의해야 합니다.');
    }
}
</script>


    <form id="agreementForm" class="contract" action="signup.html">
        <h1>계좌개설 약관</h1>
        <div class="text">
            <!-- 약관 내용 -->
            제2조 (용어의 정의)

“종합계좌”란 고객이 회사가 제공하는 각종 금융상품 거래 및 관련 서비스를 이용하기 위하여 개설하는 계좌로서 금융상품 및 서비스를 종합적으로 관리할 수 있도록 구현된 것을 말합니다.
“개별계좌”란 고객이 회사가 제공하는 개별 금융상품 거래 및 관련 서비스를 이용하기 위하여 종합계좌 내에서 개설하는 계좌로 아래와 같이 구분됩니다.
일반 위탁계좌: 주식, 채권, 수익증권, 외화증권, 해외장내파생상품(미국주식옵션에 한함)을 거래하기 위하여 개설되는 계좌
“토스앱”이란 회사가 고객에 대하여 금융상품 거래 및 관련 서비스를 제공함에 있어서 이용하는 스마트폰 어플리케이션을 의미하며, “토스증권탭”이란 회사가 고객에 대하여 금융상품 거래 및 관련 서비스를 제공함에 있어서 이용하는 화면으로서 고객이 토스앱을 통하여 진입할 수 있는 것을 의미하며, “WTS”란 회사가 고객에 대하여 금융상품 거래 및 관련 서비스를 제공함에 있어서 이용하는 웹사이트로서 https://wts.tossinvest.com 및 그에 부속된 화면을 말합니다.
“푸시알림”이란 회사가 토스앱을 통하여 고객에게 전송하는 전자적 통지, “알림톡”이란 회사가 카카오톡 애플리케이션을 통하여 고객에게 전송하는 전자적 통지, “문자알림”이란 회사가 휴대전화 문자메시지의 형태로 고객에게 전송하는 전자적 통지, “알림메일”이란 회사가 이메일의 형태로 고객에게 전송하는 전자적 통지를 각 의미합니다.
 

제3조 (계좌의 개설)

고객은 종합계좌 및 일반 위탁계좌를 보유한 경우에 한하여 회사가 제공하는 금융상품 거래 및 관련 서비스를 이용할 수 있습니다.
고객은 개별 금융상품 거래 및 관련 서비스의 이용을 개시하고자 하는 경우(해당 거래에 필요한 개별계좌를 폐쇄한 후 해당 거래를 재개하고자 하는 경우를 포함)에 거래하고자 하는 금융상품의 유형에 따라 개별계좌를 개설하고 별도의 계좌설정 약관에 동의하여야 합니다.
 
        </div>
        <div>
            <p><input type="button" value="약관 보기" class="box" onclick="openPopup()"></p>
            <p><input type="submit" value="개설 신청" class="box"></p>
        </div>
    </form>





<script>
        function limitPhoneNumber() {
            var phoneNumberInput = document.getElementById('phone');
            var phoneNumber = phoneNumberInput.value;
            // 010으로 시작하지 않으면 010을 추가
            if (!phoneNumber.startsWith('010')) {
                phoneNumberInput.value = '010' + phoneNumber;
            }
            // 11자리가 넘으면 자르기
            if (phoneNumber.length > 11) {
                phoneNumberInput.value = phoneNumber.slice(0, 11);
            }
        }
        
        function limitSimplePw(input) {
            // 입력 값에서 숫자만 추출
            var digits = input.value.replace(/\D/g, '');

            // 6자리 숫자로 제한
            digits = digits.substr(0, 6);

            // 입력 필드에 결과 값 반영
            input.value = digits;
        }

        function limitPersonalId(input) {
            // 입력 값에서 숫자만 추출
            var digits = input.value.replace(/\D/g, '');

            // 13자리 숫자로 제한
            if (digits.length > 13) {
                digits = digits.substr(0, 13);
            }
            // 입력 필드에 결과 값 반영
            input.value = digits;
        }
    </script>
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
    
    
    function validatePersonalId() {
        var personalId1 = document.getElementById('personal_id_1').value;
        var personalId2 = document.getElementById('personal_id_2').value;

        // 각 입력 필드의 길이를 확인
        if (personalId1.length !== 6 || personalId2.length !== 7) {
            alert("주민등록번호를 다시 입력해주세요.");
            return false;
        }

        // 숫자로 이루어진지 확인
        var numericRegex = /^[0-9]+$/;
        if (!personalId1.match(numericRegex) || !personalId2.match(numericRegex)) {
            alert("주민등록번호는 숫자로만 입력해야 합니다.");
            return false;
        }

        // 여기에 추가적인 유효성 검사 규칙을 추가할 수 있습니다.

        return true;
    }
    
    /*
    function validatePersonalId(){
        var personalIdInput = document.getElementById('personal_id');
        if( personalIdInput.value.length !== 14){
           alert("주민등록번호를 다시 입력해주세요."); // 주민등록번호가 13자리가 아닐 경우 알림 메시지 표시
           return false;
        }
        return true;
     }*/
     
     function validateSimplePw(){
        var simplePwInput = document.getElementById('simplePw');
        if(simplePwInput.value.length !== 6){
           alert("간편 비밀번호를 다시 입력해주세요."); // 간편 비밀번호가 6자리가 아닐 경우 알림 메시지 표시
           return false;
        }
        
        return true;
     }
    
    function validateAddress() {
        var postcodeInput = document.getElementById('sample6_postcode');
        var addressInput = document.getElementById('sample6_address');
        var detailAddressInput = document.getElementById('sample6_detailAddress');
        if (postcodeInput.value.trim() === '' || addressInput.value.trim() === '' || detailAddressInput.value.trim() === '') {
            alert('주소를 모두 입력해주세요.');
            return false;
        }
        return true;
    }
    
    
</script>

<script>
  var idCk = false;
  function checkDuplicateId() {
    var id = document.getElementById("id").value; // 입력된 아이디 가져오기
    
    // AJAX 요청 수행
    var xhr = new XMLHttpRequest();
    xhr.open("POST", "checkDuplicateId.do", true);
    xhr.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
    console.log("readyState:", xhr.readyState, "status:", xhr.status);
    xhr.onreadystatechange = function() {
         console.log("readyState:", xhr.readyState, "status:", xhr.status);
         if (xhr.readyState === 4) {
           if (xhr.status === 200) {
             var response = xhr.responseText; // AJAX 응답 받기
            
             var ckResult = response === "true"; // 중복 결과에 따라 ckResult 설정

        // ckResult 값에 따른 로직 처리
        if (ckResult) {
          idCk = true;
/*           document.getElementById("id").disabled = true;
          document.getElementById("id").readOnly = true;
          document.getElementById("id").style.backgroundColor = "#f0f0f0";
          document.querySelector("button[type='button']").disabled = true; */
          
          alert("아이디 사용이 가능합니다.")
        } else {
          alert("중복된 아이디입니다. 다른 아이디를 입력해주세요.");
        }
      }
    } else {
        console.log('Error:', xhr.status, xhr.statusText); // 추가된 에러 메시지
      }
    }
  
    xhr.send("id=" + encodeURIComponent(id)); // 요청 전달 데이터 설정
  }
  
  
  
  function validateId() {
      // var idField = document.getElementById("id");
      // var idButton = document.querySelector("button[type='button']");
       
       if (idCk) {
         return true;
       } else {
          alert("아이디 중복체크가 필요합니다.")
         return false;
       }
     }
</script>
</head>
<body>
   <h1>상품 가입</h1>
   <form action="enrollment.do" method="post"
        onsubmit="return validateId() && validatePersonalId() && validateSimplePw() && validateAddress() && validateEmail()">
   <%--    <label for="name">계좌번호:</label>
       <input type="text" name="name" id="name" placeholder="이름을 입력해주세요." required value="${param.name}">  --%>
        <label for="id">은행:</label> 
       <input type="text" name="nickname" id="nickname" placeholder="고객님의 계좌 별칭을 입력해주세요." required value="${param.id}">
      <button type="button" onclick="checkDuplicateId()">중복 확인</button>
       <label for="id">계좌별명:</label> 
      <label for="pw">계좌비밀번호:</label> 
      <input type="password" name="pw" id="pw" placeholder="영문 숫자로 구성하며 최소 4글자 이상 필요합니다." required value="${param.pw}"> 
      <label for="pwck">비밀번호 확인</label> 
      <input type="password" name="pwck" id="pwck" required value="${param.pwck}">
      <label for="simplePw">간편 비밀번호</label> <input type="password" name="simplePw" id="simplePw" placeholder="간편 비밀번호 6자리를 입력해주세요." required value="${param.simplePw}" oninput="limitSimplePw(this)"
         maxlength="6"> 
    
      <label for="email">이메일:</label> <input type="email" name="email"
         placeholder="이메일을 입력해주세요." required value="${param.email}">
      <!-- <button type="submit" formaction="mail.do" name="sendMail">인증
         메일 발송</button>
          -->
       <button type="button" onclick="sendMail()">인증 메일 발송</button>       
      <br />인증번호: <input type="text" name="verifyCode">
      <button type="button" onclick="checkCode()">코드 확인</button>
      &nbsp;&nbsp; <input type="submit" value="회원가입요청">
   </form>
</body>
</html>