package com.team.webproject.dto;

import java.sql.Date;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class TestUserDTO {
	
	private String member_id;
	private String member_password;
	private String member_nickname;
	private String member_email;
	private Date member_birthday;

}
