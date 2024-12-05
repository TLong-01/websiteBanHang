package com.devpro.shop16.dto;

import lombok.Data;
import lombok.ToString;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;

@Data
@ToString
public class Cart {

	private BigDecimal totalPrice = BigDecimal.ZERO;
	
	private List<CartItem> cartItems = new ArrayList<CartItem>();

	public Cart() {
		super();
	}

	public Cart(BigDecimal totalPrice, List<CartItem> cartItems) {
		super();
		this.totalPrice = totalPrice;
		this.cartItems = cartItems;
	}

	public BigDecimal getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(BigDecimal totalPrice) {
		this.totalPrice = totalPrice;
	}

	public List<CartItem> getCartItems() {
		return cartItems;
	}

	public void setCartItems(List<CartItem> cartItems) {
		this.cartItems = cartItems;
	}

	

}
