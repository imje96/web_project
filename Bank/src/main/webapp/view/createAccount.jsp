<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="vo.MemberDTO" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>계좌 개설</title>
<style>
    /* Add your custom CSS styles here */
    body {
        font-family: Arial, sans-serif;
        background-color: #f7f7f7;
        margin: 0;
        padding: 20px;
    }

    h1 {
        color: #333;
    }

    form {
        max-width: 400px;
        margin: 20px auto;
        background-color: #fff;
        padding: 20px;
        border: 1px solid #ddd;
        border-radius: 5px;
    }

    label {
        display: block;
        margin-bottom: 5px;
        font-weight: bold;
    }

    input[type="password"],
    input[type="text"],
    select {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }

    input[type="submit"] {
        background-color: #4CAF50;
        color: #fff;
        border: none;
        padding: 10px 20px;
        cursor: pointer;
        border-radius: 4px;
    }

    .modal {
        display: none;
        position: fixed;
        z-index: 1;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        overflow: auto;
        background-color: rgba(0, 0, 0, 0.5);
    }

    .modal-content {
        background-color: #fff;
        margin: 10% auto;
        padding: 20px;
        border: 1px solid #888;
        width: 80%;
        border-radius: 5px;
        position: relative;
    }

    .close {
        color: #aaa;
        position: absolute;
        top: 10px;
        right: 20px;
        font-size: 28px;
        font-weight: bold;
        cursor: pointer;
    }

    .close:hover,
    .close:focus {
        color: #000;
        text-decoration: none;
        cursor: pointer;
    }

    .show-more {
        color: #4CAF50;
        cursor: pointer;
        text-decoration: underline;
        margin-top: 10px;
    }

    .hidden {
        display: none;
    }
</style>

<%	
	MemberDTO dto = (MemberDTO) session.getAttribute("dto");
%>
<script>
    function validateForm() {
        var password = document.getElementsByName("accountPassword")[0].value;
        var passwordCheck = document.getElementsByName("accountPasswordCheck")[0].value;

        if (password !== passwordCheck) {
            alert("계좌 비밀번호와 비밀번호 확인이 일치하지 않습니다.");
            return false;
        }
        return true;
    }
</script>

</head>
<body>
    <h1>계좌 개설</h1>
    <form action="account.do" method="post" onsubmit="return validateForm()">
    	<input type = "hidden" name ="memberId" value=<%=dto.getMemberId()%>>

		
		<label>계좌 유형 (1: 입출금):</label>
		<select name="accountType">
		  <option value="1">입출금</option> 
		</select><br>
		<label>계좌 별명 : </label>
        <input type="text" name="nickname"><br>
        
        <label>계좌 비밀번호: </label>
        <input type="password" name="accountPassword"><br>
          
        <label>계좌 비밀번호 확인: </label>
        <input type="password" name="accountPasswordCheck"><br>

		<!-- modal -->
			
			<div class="modal">
 
		      <!-- 첫 번째 Modal의 내용 -->
		      <div class="modal-content">
		        <span class="close">&times;</span>                         
		        <p><b>개인(신용)정보 수집·이용 동의서(상품서비스 안내·오픈뱅킹용)</b> <br>
					귀 행이 상품서비스 안내 등을 위하여 본인의 개인(신용)정보를 수집·이용하는 경우에는 「신용정보의 이용 
					및 보호에 관한 법률」 제15조 제2항, 제32조 제1항, 제33조 및 제34조, 「개인정보 보호법」 제15조 제1항
					제1호, 제22조 제3항에 따라 본인의 동의가 필요합니다.  <br>
					
					아래에서 (금융)거래라 함은 은행업무(여신, 수신, 외국환), 겸영업무(신탁, 펀드, 방카슈랑스, 신용카드 등), 부수업무(보증, 팩토링, 대여금고, 보호예수 등)와 관련된 거래를 의미합니다. 
					<br>
					1. 수집 이용 목적 <br>
					타행 (금융)거래정보를 활용한 상품, 서비스 홍보 및 판매 권유<br>
					2. 수집‧이용할 항목<br>
					￭ 개인정보<br>
					‣ 성명, 생년월일, 주소, 연락처(전자우편주소, 집/직장/휴대폰 전화번호 등), 국적, 연소독, 직업, 직장정보, 결혼여부, 주거 및 가족사항, 거주기간, 관심 금융/서비
					스 정보, 금융/비금융 자산현황<br>
					￭ 오픈뱅킹 및 통합조회 서비스 이용을 위하여 등록한 타행 (금융)거래정보<br>
					‣ 상품종류, 거래조건(이자율, 만기 등), 거래일시, 금액 등 거래 설정·내역정보 및 오픈
					뱅킹 서비스의 설정·유지·이행·관리를 위한 상담 등을 통해 생성되는 정보
					※ 본 동의 이전에 발생한 개인(신용)정보도 포함됩니다.<br>
					3. 보유 이용 기간<br>
					위 개인(신용)정보는 (금융)거래종료일* 또는 동의 철회 시까지 보유· 이용할 수 있습니다. 이후에는 관련된 사고조사, 분쟁해결, 민원처리, 법령상 의
					무이행을 위하여 필요한 범위 내에서만 보유․이용됩니다. * (금융)거래 종료일이란 당행과 거래중인 모든 계약(여·수신, 내·외국환, 카드 및 제3자 담보
					제공 등)해지 및 서비스(대여금고, 보호예수, 외국환거래지정, 인터넷뱅킹 포함 전자금융
					거래 등)가 종료된 날을 의미합니다.
				</p>
		      </div>
		    </div>
			
			
		    
		    
		    <div class="modal">
 
		      <!-- 첫 번째 Modal의 내용 -->
		      <div class="modal-content">
		        <span class="close">&times;</span>                         
		        <p><b>개인 정보 수집·이용에 관한 동의서</b> <br>
					  주식회사 하나은행은 개인정보보호법 등 관련 법상의 개인정보호 규정을 준수하여 근로자의 개인정보 보호에 최선을 다하고 있습니다. 회사는 개인정보보호법 제17조에 근거하여 다음과 같이 회사 업무의 수행 및 소속직원들의 채용, 해지, 발령 등에 따른 인사기록의 보관 등과 같이 반드시 필요한 범위내에서 직원의 개인정보 수집, 이용, 보관하고 이를 제3자에게 제공하는데 동의를 받고자합니다.
					<br>
					1. 개인정보 수집 목적 <br>
					   채용, 배치, 평가, 취업 알선, 기타 법령으로 정한 용도로의 활용 및 제3자에 대한 제공 <br>
					
					2. 수집항목 <br>
					   가. 필수항목 : 이름, 주민등록번호 앞 6자리, 주소, 전화번호(연락을 목적으로 사용 가능), 보유자격 및 교육이수현황
					   나. 선택항목 : 가족관계, 이력 및 경력사항 <br>
					
					3. 개인정보 보유 및 이용기간  <br>
					   가. 채용 전 : 제출일로부터 3개월간 <br>
					   나. 채용 시 : 채용일로부터 퇴사 후 5년간 <br>
					
					4. 제3자에 대한 제공 동의(□ 동의 함 / □ 동의하지 않음) <br>
					   가. 제공 받은 자 : 배치예정 또는 배치하고자하는 사업장의 사업주 또는 담당자 <br>
					   나. 제공 받은 자의 목적 : 정보제공자의 배치적정 여부 판단 및 인적사항 확보 <br>
					   다. 제공하는 항목 : 정보 주체가 제출한 이력서, 자격증 사본에 기재된 사항 일체 <br>
					   라. 제공 받은 자의 보유/이용기간 : 정보 주체가 해당 사업장에 배치되어 종사하는 기간 동안  <br>
					   마. 동의 거부권 : 귀 개인정보의 수집·이용에 대한 동의를 거부할 수 있으며, 동의하지 않는 경우 사업장의 배치 거부로 채용 또는 배치가 제한 또는 거절 될 수 있습니다. <br>
					
					5. 개인정보의 수집·이용에 대한 동의 거부  <br>
					   개인정보의 수집·이용을 거부할 수 있습니다. 다만, 개인정보의 수집·이용 등에 동의하지 않을 경우 신원확인 및 선임, 직무능력 등이 입증되지 않아 채용되지 않거나 채용 이후에도 채용이 취소될 수 있습니다.</p>
		      </div>
		    </div>
		    
		    <div class="modal">
 
		      <!-- 첫 번째 Modal의 내용 -->
		      <div class="modal-content">
		        <span class="close">&times;</span>                         
		        <p><b>개인(신용)정보 수집,이용(조회)<br> 제공동의서 관련 고객 권리 안내문</b> <br>
					1. 금융서비스 이용 범위 <br>
					고객의 개인(신용)정보는 고객이 동의한 목적을 위하여만 수집ㆍ이용 및 제공됩니다. 필수적 정보에 대한 수집ㆍ이용 및 제공은 계약의 체결 및 이행을 위하여 필수적이므로, 위 사항에 동의하셔야만 [(금융)거래] 관계의 설정 및 유지가 가능합니다. 반면 선택적 정보에 대한 수집ㆍ이용 및 제공에 대하여는 거부하실 수 있으며, 다만 동의하지 않으실 경우 [(금융)거래] 조건 등에 불이익을 받으실 수 있습니다.
					<br>
					2. 고객 개인(신용)정보의 제공 및 마케팅 활용 중단 신청<br>
					가. 고객은 가입 신청 시 동의한 본인 개인(신용)정보의 제3자 제공 또는 당사의 [금융상품(서비스)] 소개 등 영업목적의 사용에 대하여 전체 또는 사안별로 당사에 제공 활용을 중단시킬 수 있습니다(개인정보 보호법 제37조, 신용정보의 이용 및 보호에 관한 법률 제37조).
					다만, ① 법률에 특별한 규정*이 있거나 법령상 의무를 준수하기 위하여 불가피한 경우, ② 다른 사람의 생명ㆍ신체를 해할 우려가 있거나 다른 사람의 재산과 그 밖의 이익을 부당하게 침해할 우려가 있는 경우, ③ 개인(신용)정보를 처리하지 아니하면 정보주체와 약정한 서비스를 제공하지 못하는 등 계약의 이행이 곤란한 경우로서 정보주체가 그 계약의 해지 의사를 명확하게 밝히지 아니한 경우에는 제공 활용중단 신청이 거절될 수 있습니다.
					* 신용조회회사 또는 신용정보집중기관에 제공하여 개인의 신용도를 평가하기 위한 목적으로 행한 신용정보의 제공 동의는 철회할 수 없습니다(신용정보의 이용 및 보호에 관한 법률 제37조제1항 단서).
					*[(금융)거래]관계를 설정하면서 동의를 한 경우 계약 체결일로부터 3개월 내에는 신용정보의 제공 동의를 철회할 수 없습니다(신용정보의 이용 및 보호에 관한 법률 시행령 제32조제1항 단서).
					<br>
					3. 고객 개인(신용)정보의 자기정보결정권<br>
					가. 고객은 개인정보 보호법, 신용정보의 이용 및 보호에 관한 법률 및 신용정보업감독규정 등에 따라 아래의 권리가 부여되어 있습니다. 동 권리의 세부내용에 대해서는 당사 홈페이지(www.shinhansavings.com) 또는 금융감독원 홈페이지(www.fss.or.kr)에 게시되어 있습니다. 동 권리를 행사하고자 하는 고객은 연락중지청구권의 경우 두낫콜 홈페이지(www.donotcall.or.kr)에서, 그 밖의 권리는 당사 각 영업점 앞으로 신청하여 주시기 바랍니다.
					개인신용정보 이용 및 제공 사실 조회 요청권(신용정보의 이용 및 보호에 관한 법률 제35조) : 금융회사가 내부경영관리의 목적으로 이용하거나 반복적인 업무위탁을 위해 제공하는 경우 등을 제외하고 개인신용정보를 이용하거나 제공중인 현황을 확인할 수 있는 권리
					연락중지청구권(신용정보의 이용 및 보호에 관한 법률 제37조 제2항) : 원치 않는 마케팅 목적의 연락(휴대폰 전화 또는 문자메세지)을 거부할 수 있는 권리
					개인(신용)정보 열람 및 오류 개인(신용)정보의 정정 삭제 요구권(개인정보보호법 제35조 제36조, 신용정보의 이용 및 보호에 관한 법률 제38조) : 당사에 본인의 개인(신용)정보에 대한 열람을 요구할 수 있는 권리 및 자신의 개인(신용)정보를 열람한 후 사실과 다르거나 확인할 수 없는 개인(신용)정보에 대하여 정정 또는 삭제를 요구할 수 있는 권리
					개인신용정보 이용 제공 사실 통보 요구권(신용정보의 이용 및 보호에 관한 법률 제35조) : 신용정보회사 등이 본인에 관한 신용정보를 이용 제공한 경우 매 1년마다 이용 제공현황을 통보해줄 것을 요구할 수 있는 권리(단, 신용정보 이용 제공사실 통보에 대한 수수료가 발생할 수 있습니다.)
					개인신용정보 삭제요구권(신용정보의 이용 및 보호에 관한 법률 제38조의3) : 당사와의 금융거래 종료 후 법령에서 정한 기간이 경과 시 당사가 보유한 본인 정보의 파기를 요구할 수 있는 권리
				</p>
		      </div>
		    </div>
		    
		<!-- modal -->
        <input type="submit" value="계좌 개설">
    </form>
	<script>
        // Modal functionality
        var modal = document.getElementsByClassName("modal");
        var btn = document.getElementsByClassName("modal-btn");
        var span = document.getElementsByClassName("close");

        for (var i = 0; i < btn.length; i++) {
            btn[i].onclick = function() {
                modal[i].style.display = "block";
            }
        }

        for (var i = 0; i < span.length; i++) {
            span[i].onclick = function() {
                for (var j = 0; j < modal.length; j++) {
                    modal[j].style.display = "none";
                }
            }
        }
    </script>
    
</body>
</html>