package vo;

import java.math.BigDecimal;

public class ProductInfoDTO {
	private int productId;
	private String productName;
	private String productCategory;
	private double interestRate;
	private int term;
	private int minimumBalance;
	private String productDescription;



	public ProductInfoDTO(int productId, String productName, String productCategory, double interestRate, int term,
			int minimumBalance, String productDescription) {
		this.productId = productId;
		this.productName = productName;
		this.productCategory = productCategory;
		this.interestRate = interestRate;
		this.term = term;
		this.minimumBalance = minimumBalance;
		this.productDescription = productDescription;
	}

		


	public int getProductId() {
		return productId;
	}




	public void setProductId(int productId) {
		this.productId = productId;
	}




	public String getProductName() {
		return productName;
	}




	public void setProductName(String productName) {
		this.productName = productName;
	}




	public String getProductCategory() {
		return productCategory;
	}




	public void setProductCategory(String productCategory) {
		this.productCategory = productCategory;
	}




	public double getInterestRate() {
		return interestRate;
	}




	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}




	public int getTerm() {
		return term;
	}




	public void setTerm(int term) {
		this.term = term;
	}




	public int getMinimumBalance() {
		return minimumBalance;
	}




	public void setMinimumBalance(int minimumBalance) {
		this.minimumBalance = minimumBalance;
	}




	public String getProductDescription() {
		return productDescription;
	}




	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}




	@Override
	public String toString() {
		return "AccountDto [productId=" + productId + ", productName=" + productName + ", productCategory=" + productCategory + ", interestRate=" + interestRate + ", term="
				+ term + ", minimumBalance=" + minimumBalance + ", productDescription=" + productDescription + "]";
	}

}
