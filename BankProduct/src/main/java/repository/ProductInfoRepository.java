package repository;

import java.util.List;

import vo.AccountInfoDTO;
import vo.ProductInfoDTO;

public interface ProductInfoRepository {
    List<ProductInfoDTO> getProcutList();
}
