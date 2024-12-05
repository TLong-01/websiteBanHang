package com.devpro.shop16.dto;

import lombok.Data;

@Data
public class UserSearchModel extends BaseSearchModel {

	public String keyword;
	public Integer roleId;

	public Integer getRoleId() {
		return roleId;
	}

	public String getKeyword() {
		return keyword;
	}

	public UserSearchModel() {
		super();
	}

	public UserSearchModel(String keyword, Integer roleId) {
		super();
		this.keyword = keyword;
		this.roleId = roleId;
	}

	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}

	public void setRoleId(Integer roleId) {
		this.roleId = roleId;
	}
	
	

}
