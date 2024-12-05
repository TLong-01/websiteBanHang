package com.devpro.shop16.exception;

import lombok.Data;
import lombok.ToString;

@Data

@ToString
public class ServiceError {
    private Integer code;
    private String message;
	public ServiceError() {
		super();
	}
	public ServiceError(Integer code, String message) {
		super();
		this.code = code;
		this.message = message;
	}
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMessage() {
		return message;
	}
	public void setMessage(String message) {
		this.message = message;
	}
    
    
}
