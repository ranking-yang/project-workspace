package com.team.webproject.dto;

import lombok.Data;

@Data
public class KakaoOauthTokenDTO {
	
	private String token_type;
	private String access_token;
	private String id_token;
	private String expires_in;
	private String refresh_token;
	private String refresh_token_expires_in;
	private String scope;

}
