package daodto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.Properties;
import java.util.Random;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class AccountDao {

	private DataSource ds;

	public AccountDao() {
		try {
			Context ctx = new InitialContext();
			ds = (DataSource) ctx.lookup("java:comp/env/jdbc/oracle");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}


	public void enrollAccount(AccountDto dto) {

		System.out.println("insert메소드 시작");
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		String query = "INSERT INTO account_info (account_id, member_id, bank_code, branch_code, product_id, account_number, account_password, balance, nickname, account_status, reg_date)\r\n"
				+ "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setInt(1, dto.getAccountId());
			pstmt.setString(2, dto.getMemberId());
			pstmt.setString(3, dto.getBankCode());
			pstmt.setString(4, dto.getBranchCode());
			pstmt.setInt(5, dto.getProductId());
			pstmt.setString(6, dto.getAccountN());
			pstmt.setString(7, dto.getAccountPw());
			pstmt.setInt(8, dto.getBalance());
			pstmt.setString(9, dto.getNickname());
			pstmt.setInt(10, dto.getAccountStatus());
			pstmt.setString(11, dto.getRegDate());
			int iResult = pstmt.executeUpdate();

			if (iResult >= 1) {
				System.out.println("insert success");

			} else {
				System.out.println("insert fail");
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

	}

	public boolean hasAccount(String memberId) {
		System.out.println("입출금 계좌 존재여부 체크");

		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		// 계좌정보 테이블에 회원 id 존재하는지 확인(최초 로그인 한 사람은 계좌정보 테이블에 회원 id가 존재x)
		String query = "SELECT * FROM account_info WHERE ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(query);
			pstmt.setString(1, memberId);
			rs = pstmt.executeQuery();

			if (rs.next()) {
				// 계좌 정보가 있을 경우
				return true;
			} else {
				// 계좌 정보가 없을 경우
				return false;
			}
		} catch (Exception e) {
			// 예외 처리
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
		return false;
	}
}

 */