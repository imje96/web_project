package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;

import vo.AccountInfoDTO;

public class AccountInfoRepositoryImpl implements AccountInfoRepository {

    private static AccountInfoRepositoryImpl instance = null;

    private final String DB_URL =                              
            "jdbc:oracle:thin:@dinkdb_medium?TNS_ADMIN=C:/oracle/Wallet_DinkDB"; // database url
    private final String USER = "DA2316";
    private final String PASS = "Data2316";

    public AccountInfoRepositoryImpl() {
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static AccountInfoRepositoryImpl getInstance() {
        if (instance == null) {
            synchronized (AccountInfoRepositoryImpl.class) {
                if (instance == null) {
                    instance = new AccountInfoRepositoryImpl();
                }
            }
        }
        return instance;
    }


    @Override
    public List<AccountInfoDTO> findAccountsByMemberId(String memberId) {
        List<AccountInfoDTO> accountInfos = new ArrayList<>();
        String query = "SELECT * FROM account_info_hana WHERE member_id = ?";

        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS);
                PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, memberId);

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    AccountInfoDTO accountInfo = new AccountInfoDTO(rs.getString("account_number"),
                            rs.getString("member_id"), rs.getString("bank_code"),
                            rs.getString("branch_code"), rs.getString("account_password"),
                            rs.getInt("balance"), rs.getString("nickname"),
                            rs.getInt("account_type"), rs.getInt("account_status"),
                            rs.getDate("reg_date"));
                    accountInfos.add(accountInfo);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return accountInfos;
    }
    
    private String getRandomNumber() {
        Random random = new Random();
        return Integer.toString(random.nextInt(9000));
    }
    
    @Override
    public void createAccount(String memberId, String accountPassword, String nickname, int accountType) {
        try (Connection conn = DriverManager.getConnection(DB_URL, USER, PASS)) {
            String sql = "INSERT INTO account_info_woori (account_number, member_id, bank_code, branch_code, account_password, balance, nickname, account_type, account_status, reg_date) " +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, sysdate)";
           
            String accountNumber = "001" + "-" + getRandomNumber() + "-" + getRandomNumber();
            String bankCode = "우리";
            String branchCode = "001";
            // accountStatus 1이 정상 계좌
            int accountStatus = 1; 
            try (PreparedStatement stmt = conn.prepareStatement(sql)){
                stmt.setString(1, accountNumber);
                stmt.setString(2, memberId);
                stmt.setString(3, bankCode);
                stmt.setString(4, branchCode);
                stmt.setString(5, accountPassword);
                stmt.setInt(6, 0);
                stmt.setString(7, nickname);
                stmt.setInt(8, accountType);
                stmt.setInt(9, accountStatus);
                stmt.executeUpdate();
            }catch (SQLException e) {
                // Handle any potential database errors
                e.printStackTrace();
            }
        } catch (SQLException e) {
            // Handle any potential database errors
            e.printStackTrace();
        }
    }
    
    
}


