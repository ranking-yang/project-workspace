package com.team.webproject.mapper;

import java.sql.Date;
import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface PerformanceMapper {
	List<PerformanceDTO> getAllPerformances();
	List<PerformanceDTO> getPerformances(String main_category);
	List<PerformanceDTO> getAreaPerformances(String area_code);
	PerformanceDTO getPerformance(String pk);
	Date getEndDate(String performance_code);
}
