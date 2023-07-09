package repository;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import vo.ProductInfoDTO;


public class ProductInfoRepositoryImpl implements ProductInfoRepository {
	private DataSource ds;

	private static ProductInfoRepositoryImpl instance = null;
	
	public ProductInfoRepositoryImpl() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

    public static ProductInfoRepositoryImpl getInstance() {
        if (instance == null) {
            synchronized (ProductInfoRepositoryImpl.class) {
                if (instance == null) {
                    instance = new ProductInfoRepositoryImpl();
                }
            }
        }
        return instance;
    }
	
	@Override
	public List<ProductInfoDTO> getProductList() {
		System.out.println("모든 상품 정보 조회");
		
	    Connection conn = null;
	    PreparedStatement pstmt = null;
	    ResultSet rs = null;

	    List<ProductInfoDTO> dtos = new ArrayList<>();

	    String query = "SELECT * FROM product_info";
	    try {
	        conn = ds.getConnection();
	        pstmt = conn.prepareStatement(query);
	        rs = pstmt.executeQuery();

	        while (rs.next()) {
	        	ProductInfoDTO dto = new ProductInfoDTO(
	                rs.getInt("product_id"),
	                rs.getString("product_name"),
	                rs.getString("product_category"),
	                rs.getInt("interest_rate"),
	                rs.getInt("term"),
	                rs.getInt("minimum_balance"),
	                rs.getString("product_description")
	            );
	            dtos.add(dto);
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    } finally {
	        try {
	            if (rs != null)
	                rs.close();
	            if (pstmt != null)
	                pstmt.close();
	            if (conn != null)
	                conn.close();
	        } catch (Exception e) {
	            e.printStackTrace();
	        }
	    }
	    return dtos;
	}
}