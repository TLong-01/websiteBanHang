package com.devpro.shop16.dto;

public class ContactSearchModel extends BaseSearchModel {

	public String keyword;

	public String getKeyword() {
		return keyword;
	}

	public ContactSearchModel() {
		super();
	}

	public ContactSearchModel(String keyword) {
		super();
		this.keyword = keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	

}
