package com.team.webproject.common;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.ObjectMapper;

@Component
public class OAuthTemplate {
	
	public RestTemplate getRestTemplate() {
		return new RestTemplate();
	}
	
	public HttpHeaders getHttpHeaders() {
		return new HttpHeaders();
	}
	
	public LinkedMultiValueMap<String, String> getMultiValueMap() {
		return new LinkedMultiValueMap<>();
	}
	
	@SuppressWarnings("unchecked")
	public HttpEntity<MultiValueMap<String, String>> getHttpEntity(Object body, Object headers) {
		return new HttpEntity<>((MultiValueMap<String, String>) body,
								(HttpHeaders) headers);
	}
	
	
	public HttpEntity<MultiValueMap<String, String>> getHttpEntity(Object headers) {
		return new HttpEntity<>((HttpHeaders) headers);
	}
	
	public ObjectMapper getObjectMapper() {
		return new ObjectMapper();
	}
}
