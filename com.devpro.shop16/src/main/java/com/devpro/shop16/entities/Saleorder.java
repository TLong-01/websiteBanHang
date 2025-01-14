package com.devpro.shop16.entities;

import javax.persistence.*;
import java.math.BigDecimal;
import java.util.HashSet;
import java.util.Set;

@Entity
@Table(name = "tbl_saleorder")
public class Saleorder extends BaseEntity {
	@Column(name = "code", length = 45, nullable = false)
	private String code;

	@Column(name = "customer_name", length = 100, nullable = true)
	private String customer_name;

	@Column(name = "customer_address", length = 100, nullable = true)
	private String customer_address;

	@Column(name = "customer_phone", length = 100, nullable = true)
	private String customer_phone;

	@Column(name = "customer_email", length = 100, nullable = true)
	private String customer_email;

	@Column(name = "total", precision = 13, scale = 2, nullable = true)
	private BigDecimal total;

	private BigDecimal totalPrice;//tổng giá trị đơn hàng

	private String reason;//lý do hủy đơn
	private Double fee;//tiền ship

	@Column(name = "seo", length = 1000, nullable = true)
	private String seo;

	@Column(name = "payment_type", nullable = true)
	private Integer paymentType;//1: thanh toán bằng tiền mặt, 2: thanh toán bằng vnpay

	@Column(name = "payment_status", nullable = true)
	private Integer paymentStatus;//1: Chưa xử lý, 2: Đang giao hàng, 3: Đã giao hàng, 4: Đơn hàng đã bị hủy

	@OneToMany(cascade = CascadeType.ALL, mappedBy = "saleOrder", fetch = FetchType.EAGER)
	private Set<SaleorderProducts> saleOrderProducts = new HashSet<SaleorderProducts>();

	public void addSaleOrderProducts(SaleorderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(this);
		saleOrderProducts.add(_saleOrderProducts);
	}

	public void removeSaleOrderProducts(SaleorderProducts _saleOrderProducts) {
		_saleOrderProducts.setSaleOrder(null);
		saleOrderProducts.remove(_saleOrderProducts);
	}

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "user_id")
	private User user;

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCustomer_name() {
		return customer_name;
	}

	public void setCustomer_name(String customer_name) {
		this.customer_name = customer_name;
	}

	public String getCustomer_address() {
		return customer_address;
	}

	public void setCustomer_address(String customer_address) {
		this.customer_address = customer_address;
	}

	public String getCustomer_phone() {
		return customer_phone;
	}

	public void setCustomer_phone(String customer_phone) {
		this.customer_phone = customer_phone;
	}

	public String getCustomer_email() {
		return customer_email;
	}

	public void setCustomer_email(String customer_email) {
		this.customer_email = customer_email;
	}

	public BigDecimal getTotal() {
		return total;
	}

	public void setTotal(BigDecimal total) {
		this.total = total;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}

	public Set<SaleorderProducts> getSaleOrderProducts() {
		return saleOrderProducts;
	}

	public void setSaleOrderProducts(Set<SaleorderProducts> saleOrderProducts) {
		this.saleOrderProducts = saleOrderProducts;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public String getReason() {
		return reason;
	}

	public void setReason(String reason) {
		this.reason = reason;
	}

	public Integer getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(Integer paymentType) {
		this.paymentType = paymentType;
	}

	public Integer getPaymentStatus() {
		return paymentStatus;
	}

	public void setPaymentStatus(Integer paymentStatus) {
		this.paymentStatus = paymentStatus;
	}

	public Double getFee() {
		return fee;
	}

	public void setFee(Double fee) {
		this.fee = fee;
	}
}
