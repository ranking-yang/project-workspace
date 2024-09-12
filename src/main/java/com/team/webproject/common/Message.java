package com.team.webproject.common;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Message {
	
	String message = "";
	String href = "";
	
	public Message(String message, String href) {
		this.message = message;
		this.href = href;
	}

}
