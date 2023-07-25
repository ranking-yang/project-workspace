package com.team.webproject.dto;

import java.sql.Date;

import lombok.Data;

@Data
public class MemberDTO {
	private int member_code;
	private String member_id;
	private String member_pwd;
	private String member_name;
	private Date member_birth;
	private String member_phone;
	private String member_email;
}
