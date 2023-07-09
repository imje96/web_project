package model;

import java.io.IOException;

import daodto.AccountDto;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

public class enrollmentCommand implements accountCommand {
    @Override
    public void execute(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        System.out.println("execute 실행");
        
        int accountId = Integer.parseInt(request.getParameter("account_id")); 
        String memberId = request.getParameter("member_id");
        String bankCode = request.getParameter("bank_code"); 
        String branchCode = request.getParameter("branch_code");
        int productId = Integer.parseInt(request.getParameter("product_id"));
        String accountN = request.getParameter("account_id");
        String accountPw = request.getParameter("account_password");
        int balance = Integer.parseInt(request.getParameter("balance"));
        String nickname = request.getParameter("nickname");
        int accountStatus = Integer.parseInt(request.getParameter("account_status"));
        String regDate = request.getParameter("reg_date");

        
        AccountDto dto = new AccountDto(accountId, memberId, bankCode, branchCode, productId,
    			accountN, accountPw, balance, nickname, accountStatus, regDate);
        
    }

}
