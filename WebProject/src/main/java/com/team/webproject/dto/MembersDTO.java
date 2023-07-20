package com.team.webproject.dto;


import lombok.Data;

@Data
public class MembersDTO {
	
	private Integer member_code;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private Integer member_birth;
	private String member_phone;
	private String member_email;
}
