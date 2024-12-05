package com.devpro.shop16.dto;

import com.devpro.shop16.entities.BaseEntity;
import com.devpro.shop16.entities.Categories;
import lombok.Data;

import java.math.BigDecimal;

@Data
public class ProductSearchDataModel extends BaseEntity {

    private String title;
    private BigDecimal price;

    private BigDecimal price_sale;

    private String shortDes;

    private String details;

    private String avatar;

    private String seo;

    private Categories categories;


    private Long userId;

    private String userOwnTheProduct;

    private String bank;

    private String paymentAccountNumber;

	public ProductSearchDataModel() {
		super();
	}

	public ProductSearchDataModel(String title, BigDecimal price, BigDecimal price_sale, String shortDes,
			String details, String avatar, String seo, Categories categories, Long userId, String userOwnTheProduct,
			String bank, String paymentAccountNumber) {
		super();
		this.title = title;
		this.price = price;
		this.price_sale = price_sale;
		this.shortDes = shortDes;
		this.details = details;
		this.avatar = avatar;
		this.seo = seo;
		this.categories = categories;
		this.userId = userId;
		this.userOwnTheProduct = userOwnTheProduct;
		this.bank = bank;
		this.paymentAccountNumber = paymentAccountNumber;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public BigDecimal getPrice() {
		return price;
	}

	public void setPrice(BigDecimal price) {
		this.price = price;
	}

	public BigDecimal getPrice_sale() {
		return price_sale;
	}

	public void setPrice_sale(BigDecimal price_sale) {
		this.price_sale = price_sale;
	}

	public String getShortDes() {
		return shortDes;
	}

	public void setShortDes(String shortDes) {
		this.shortDes = shortDes;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public String getAvatar() {
		return avatar;
	}

	public void setAvatar(String avatar) {
		this.avatar = avatar;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Categories getCategories() {
		return categories;
	}

	public void setCategories(Categories categories) {
		this.categories = categories;
	}

	public Long getUserId() {
		return userId;
	}

	public void setUserId(Long userId) {
		this.userId = userId;
	}

	public String getUserOwnTheProduct() {
		return userOwnTheProduct;
	}

	public void setUserOwnTheProduct(String userOwnTheProduct) {
		this.userOwnTheProduct = userOwnTheProduct;
	}

	public String getBank() {
		return bank;
	}

	public void setBank(String bank) {
		this.bank = bank;
	}

	public String getPaymentAccountNumber() {
		return paymentAccountNumber;
	}

	public void setPaymentAccountNumber(String paymentAccountNumber) {
		this.paymentAccountNumber = paymentAccountNumber;
	}
    
    
}
