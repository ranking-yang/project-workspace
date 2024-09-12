package com.team.webproject.mapper;

import java.util.List;

import com.team.webproject.dto.PerformanceDTO;

public interface PerformanceMapper {
	List<PerformanceDTO> getAllPerformances();
	List<PerformanceDTO> getAllPerformancesSortbyPrice(String sort_code);
	List<PerformanceDTO> getAllPerformancesSortbyScore();
	List<PerformanceDTO> getPerformances(String main_category);
	List<PerformanceDTO> getAreaPerformances(String area_code);
	PerformanceDTO getPerformance(String pk);
	int updateQty(int ticket_qty, String payment_code);
	List<PerformanceDTO> getPerformancesAreanSortbyPrice(String area_code, String sort_code);
	List<PerformanceDTO> getPerformancesSortbyPrice(String main_category, String sort_code);
	List<PerformanceDTO> getPerformancesSortbyScore(String main_category);
	List<PerformanceDTO> getPerformancesAreanSortbyScore(String area_code);
	List<PerformanceDTO> getRandomPerformances();
	Integer setShowUpdate(PerformanceDTO perfom);
}
