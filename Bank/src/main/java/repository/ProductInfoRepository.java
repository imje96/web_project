package repository;

import java.util.List;

import vo.ProductInfoDTO;


public interface ProductInfoRepository {

	public List<ProductInfoDTO> getProductList();
}
