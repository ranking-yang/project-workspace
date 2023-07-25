package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface PerformanceMapper {
	List<PerformanceDTO> getAllPerformances();
	PerformanceDTO getPerformance(String pk);
	
}
