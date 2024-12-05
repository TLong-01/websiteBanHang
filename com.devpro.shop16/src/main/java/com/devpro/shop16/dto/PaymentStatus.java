package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class PaymentStatus {
    private Integer saleOrderId;
    private Integer status;
	public PaymentStatus() {
		super();
	}
	public PaymentStatus(Integer saleOrderId, Integer status) {
		super();
		this.saleOrderId = saleOrderId;
		this.status = status;
	}
	public Integer getSaleOrderId() {
		return saleOrderId;
	}
	public void setSaleOrderId(Integer saleOrderId) {
		this.saleOrderId = saleOrderId;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
    
    
}
