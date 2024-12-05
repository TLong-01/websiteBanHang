package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class OrderSearchModel extends BaseSearchModel {

	public String keyword;
	public Integer orderId;
	
	public OrderSearchModel() {
		super();
	}
	
	public OrderSearchModel(String keyword, Integer orderId) {
		super();
		this.keyword = keyword;
		this.orderId = orderId;
	}


	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public Integer getOrderId() {
		return orderId;
	}
	public void setOrderId(Integer orderId) {
		this.orderId = orderId;
	}

	

}
