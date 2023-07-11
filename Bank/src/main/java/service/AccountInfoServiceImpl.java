package service;

import java.util.List;
import repository.AccountInfoRepository;
import repository.AccountInfoRepositoryImpl;
import vo.AccountInfoDTO;

public class AccountInfoServiceImpl implements AccountInfoService {

	@Override
	public List<AccountInfoDTO> findAccountsByMemberId(String memberId) {
		AccountInfoRepository repository = AccountInfoRepositoryImpl.getInstance();

		return repository.findAccountsByMemberId(memberId);
	}
	
	@Override
	public void insertAccount(AccountInfoDTO dto) {

		AccountInfoRepository repository = AccountInfoRepositoryImpl.getInstance();
		repository.insertAccount(dto);

	}

}
