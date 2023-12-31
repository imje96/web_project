package repository;

import java.util.List;

import vo.AccountInfoDTO;

public interface AccountInfoRepository {
    List<AccountInfoDTO> findAccountsByMemberId(String memberId);
    
    public void enrollAccount(AccountInfoDTO dto);
    
    public boolean hasAccount(String memberId);
    
}
