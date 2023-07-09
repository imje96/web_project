package model;

import java.io.IOException;

import daodto.AccountDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class enrollmentCommand2 implements accountCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        System.out.println("execute 실행");
        
        String accountId = request.getParameter("account_id"); 
        String memberId = request.getParameter("member_id");
        String bankCode = request.getParameter("bank_code"); 
        String branchCode = request.getParameter("branch_code");
        String productId = request.getParameter("product_id");
        String accountN = request.getParameter("account_id");
        String accountPw = request.getParameter("account_password");
        String balance = request.getParameter("balance");
        String nickname = request.getParameter("nickname");
        String accountStatus = request.getParameter("account_status");
        String regDate = request.getParameter("reg_date");
        
        AccountDto dto = new AccountDto(accountId, memberId, bankCode, branchCode, productId,
    			accountN, accountPw, balance, nickname, accountStatus, regDate);
        
        
		/*
		 * // 주민등록번호에서 7번째 자리 값 확인 char genderDigit = personID.charAt(6); if
		 * (genderDigit == '1' || genderDigit == '3') { dto.setGender("M"); } else {
		 * dto.setGender("F"); }
		 * 
		 * // 주민등록번호 6자리 추출 String birth = personID.substring(0, 6);
		 * dto.setBirth(birth);
		 * 
		 * MemberDao dao = new MemberDao(); dao.joinMember(dto);
		 */
    }

}
