package repository;

import java.util.List;
import vo.AccountInfoDTO;

public interface AccountInfoRepository {
    List<AccountInfoDTO> findAccountsByMemberId(String memberId);
    
    //계좌개설
    public void insertAccount(AccountInfoDTO dto);

//	void createAccount(String memberId, String accountPassword, String nickname, int productId, int openBankingStatus);
}
