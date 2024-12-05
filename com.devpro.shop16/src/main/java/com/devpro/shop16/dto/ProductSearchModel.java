package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class ProductSearchModel extends BaseSearchModel {

	public String keyword;

	public Integer categoryId;

	public String seo;

	public ProductSearchModel() {
		super();
	}

	public ProductSearchModel(String keyword, Integer categoryId, String seo) {
		super();
		this.keyword = keyword;
		this.categoryId = categoryId;
		this.seo = seo;
	}

	public String getKeyword() {
		return keyword;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getSeo() {
		return seo;
	}

	public void setSeo(String seo) {
		this.seo = seo;
	}
	
	

}
