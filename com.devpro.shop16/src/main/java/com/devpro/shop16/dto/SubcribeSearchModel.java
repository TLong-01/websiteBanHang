package com.devpro.shop16.dto;

public class SubcribeSearchModel extends BaseSearchModel {

	public String keyword;

	public String getKeyword() {
		return keyword;
	}

	public SubcribeSearchModel() {
		super();
	}

	public SubcribeSearchModel(String keyword) {
		super();
		this.keyword = keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

}
