package com.team.webproject.common;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Component
public class IamportAPI {

	@Value("${IAMPORT-API-MARKETKEY}")
	private String import_api_marketkey;
	
	@Value("${IAMPORT-API-RESTKEY}")
	private String import_api_restkey;
	
	@Value("${IAMPORT-API-SECRET}")
	private String import_api_secret;

	public String getImport_api_marketkey() {
		return import_api_marketkey;
	}

	public String getImport_api_restkey() {
		return import_api_restkey;
	}
	
	public String getimport_api_secret() {
		return import_api_secret;
	}
	
}
