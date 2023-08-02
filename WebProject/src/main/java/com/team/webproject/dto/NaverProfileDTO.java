package com.team.webproject.dto;

import lombok.Data;

@Data
public class NaverProfileDTO {

	public String resultcode;
	public String message;
	public Response response;
	
	@Data
	public class Response {

		public String id;
		public String nickname;
		public String email;
		public String name;
		public String birthday;

	}
}
