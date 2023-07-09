package daodto;

public class AccountDto {
	private int accountId;
	private String memberId;
	private String bankCode;
	private String branchCode;
	private int productId;
	private String accountN;
	private String accountPw;
	private int balance;
	private String nickname;
	private int accountStatus;
	private String regDate;

	
	public AccountDto(int accountId, String memberId, String bankCode, String branchCode, int productId,
			String accountN, String accountPw, int balance, String nickname, int accountStatus, String regDate) {
		this.accountId = accountId;
		this.memberId = memberId;
		this.bankCode = bankCode;
		this.branchCode = branchCode;
		this.productId = productId;
		this.accountN = accountN;
		this.accountPw = accountPw;
		this.balance = balance;
		this.nickname = nickname;
		this.accountStatus = accountStatus;
		this.regDate = regDate;
	}
	
	public int getAccountId() {
		return accountId;
	}

	public void setAccountId(int accountId) {
		this.accountId = accountId;
	}

	public String getMemberId() {
		return memberId;
	}

	public void setMemberId(String memberId) {
		this.memberId = memberId;
	}

	public String getBankCode() {
		return bankCode;
	}

	public void setBankCode(String bankCode) {
		this.bankCode = bankCode;
	}

	public String getBranchCode() {
		return branchCode;
	}

	public void setBranchCode(String branchCode) {
		this.branchCode = branchCode;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
	}

	public String getAccountN() {
		return accountN;
	}

	public void setAccountN(String accountN) {
		this.accountN = accountN;
	}

	public String getAccountPw() {
		return accountPw;
	}

	public void setAccountPw(String accountPw) {
		this.accountPw = accountPw;
	}

	public int getBalance() {
		return balance;
	}

	public void setBalance(int balance) {
		this.balance = balance;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public int getAccountStatus() {
		return accountStatus;
	}

	public void setAccountStatus(int accountStatus) {
		this.accountStatus = accountStatus;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	@Override
	public String toString() {
		return "AccountDto [accountId=" + accountId + ", memberId=" + memberId + ", bankCode=" + bankCode + ", branchCode=" + branchCode + ", productId="
				+ productId + ", accountPw=" + accountPw + ", balance=" + balance + ", accountStatus=" + accountStatus + ", regDate=" + regDate + "]";
	}

}
