package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

public interface DetailService {
	// JSON 타입으로 타임테이블 만들기
	Map<String, List<String>> getTimeTable(Object schedule);
	// 한글 요일을 숫자로 변환
	String[] expandDayRange(String dayRange);
	
	JSONObject getKopisInfo(String performance_code);
	
	String address(String id);
}
