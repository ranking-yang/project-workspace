package com.team.webproject.service;

import java.util.List;
import java.util.Map;

import org.json.simple.JSONObject;

import com.team.webproject.dto.GenerationDiscountDTO;
import com.team.webproject.dto.PerformanceDTO;

public interface DetailService {
	List<GenerationDiscountDTO> getDisCount();
	
	PerformanceDTO getPerformance(String performance_code);
	
	Map<String, List<String>> getTimeTable(Object schedule);
	
	String[] expandDayRange(String dayRange);
	
	JSONObject getKopisInfo(String performance_code);
	
	JSONObject getPublicDataInfo(String performance_code);
	
	JSONObject getLocationforMap(String place_id);

	String getkakaomapAppkey();

}
