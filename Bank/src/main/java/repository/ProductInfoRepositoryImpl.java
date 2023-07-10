package repository;

import java.sql.Connection;
import java.sql.DriverManager;
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
	
    private final String DB_URL =                              
            "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/oracle/Wallet_DinkDB"; // database url
    private final String USER = "DA2316";
    private final String PASS = "Data2316";

    public ProductInfoRepositoryImpl() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
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

        List<ProductInfoDTO> dtos = new ArrayList<>();
        String query = "SELECT * FROM product_info";
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
             PreparedStatement pstmt = conn.prepareStatement(query);
             ResultSet rs = pstmt.executeQuery()) {
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
        }
        return dtos;
    }
    }