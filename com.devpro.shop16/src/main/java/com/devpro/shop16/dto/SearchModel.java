package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class SearchModel extends BaseSearchModel {

	public String keyword;

	public Integer id;

	public SearchModel() {
		super();
	}

	public SearchModel(String keyword, Integer id) {
		super();
		this.keyword = keyword;
		this.id = id;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}
	
	
}
