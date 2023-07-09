package service;

import java.util.List;

import repository.ProductInfoRepository;
import repository.ProductInfoRepositoryImpl;
import vo.ProductInfoDTO;

public class ProductInfoServiceImpl implements ProductInfoService {

	@Override
	public List<ProductInfoDTO> getProductList() {
		ProductInfoRepository repository = ProductInfoRepositoryImpl.getInstance();
		
		return repository.getProductList();
	}

}

