package com.team.webproject.dto;

import lombok.Data;

@Data
public class NaverOauthTokenDTO {
	
	private String access_token;
	private String refresh_token;
	private String token_type;
	private Integer expires_in;
}
