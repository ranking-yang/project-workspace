package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.team.webproject.dto.PerformanceDTO;
import com.team.webproject.dto.ShowDTO;

@Mapper
public interface AddPerformance {
	
	List<PerformanceDTO> selectShow();
	
	int addShow(PerformanceDTO show);

}