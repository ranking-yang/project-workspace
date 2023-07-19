package com.team.webproject.dto;

import lombok.Data;

@Data
public class LoginDTO {
	
	private String id;
	private String pw;
	private String name;
	private Integer birth;
	private String phone;
	private String email;
}
