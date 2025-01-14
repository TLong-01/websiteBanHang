package com.devpro.shop16.dto;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class UserRegistrationDto {
    private String username;
    private String email;
    private String password;
    private String address;
    
    public UserRegistrationDto() {
		super();
	}

	public UserRegistrationDto(String username, String email, String password, String address) {
        super();
        this.username = username;
        this.email = email;
        this.password = password;
        this.address = address;
    }

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}
	
	

}
