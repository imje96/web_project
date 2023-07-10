package repository;

import java.util.List;
import vo.AccountInfoDTO;

public interface AccountInfoRepository {
    List<AccountInfoDTO> findAccountsByMemberId(String memberId);
    
    public static void createAccount(String memberId, String accountPassword, String nickname, int accountType) {
		// TODO Auto-generated method stub
		
	}
}
