package com.devpro.shop16.service;

import com.devpro.shop16.entities.BaseEntity;
import lombok.Data;

import java.util.List;
import java.util.Map;

@Data
public class PagerData<E extends BaseEntity> {

	private List<E> data;

	private int totalItems;

	private int currentPage;
	
	private int limit, start, end;

	public PagerData() {
		super();
	}

	public PagerData(List<E> data, int totalItems, int currentPage, int limit, int start, int end) {
		super();
		this.data = data;
		this.totalItems = totalItems;
		this.currentPage = currentPage;
		this.limit = limit;
		this.start = start;
		this.end = end;
	}

	public List<E> getData() {
		return data;
	}

	public void setData(List<E> data) {
		this.data = data;
	}

	public int getTotalItems() {
		return totalItems;
	}

	public void setTotalItems(int totalItems) {
		this.totalItems = totalItems;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}

	public int getLimit() {
		return limit;
	}

	public void setLimit(int limit) {
		this.limit = limit;
	}

	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}

	

}
