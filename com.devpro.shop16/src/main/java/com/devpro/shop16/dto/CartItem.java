package com.devpro.shop16.dto;

import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;

@Data
@ToString
public class CartItem {
	private int productId;
	private String productName;
	private int quanlity;
	private String productPictures;
	private BigDecimal priceUnit;
	public CartItem() {
		super();
	}
	public CartItem(int productId, String productName, int quanlity, String productPictures, BigDecimal priceUnit) {
		super();
		this.productId = productId;
		this.productName = productName;
		this.quanlity = quanlity;
		this.productPictures = productPictures;
		this.priceUnit = priceUnit;
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
	public int getQuanlity() {
		return quanlity;
	}
	public void setQuanlity(int quanlity) {
		this.quanlity = quanlity;
	}
	public String getProductPictures() {
		return productPictures;
	}
	public void setProductPictures(String productPictures) {
		this.productPictures = productPictures;
	}
	public BigDecimal getPriceUnit() {
		return priceUnit;
	}
	public void setPriceUnit(BigDecimal priceUnit) {
		this.priceUnit = priceUnit;
	}

	
}
