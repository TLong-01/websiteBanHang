package com.devpro.shop16.entities;

import lombok.Getter;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Table;
import java.util.Date;

@Entity
@Table(name = "tbl_subcribe")
public class Subcribe extends BaseEntity {
	@Getter
	@Column(name = "email", length = 45, nullable = false)
	private String email;

	@Column(name = "created_date")
	private Date createdDate;

	public void setEmail(String email) {
		this.email = email;
	}

	@Override
	public Date getCreatedDate() {
		return createdDate;
	}

	@Override
	public void setCreatedDate(Date createdDate) {
		this.createdDate = createdDate;
	}

	public Subcribe() {
		super();
	}

	public Subcribe(String email, Date createdDate) {
		super();
		this.email = email;
		this.createdDate = createdDate;
	}

	public String getEmail() {
		return email;
	}
	
	
}
