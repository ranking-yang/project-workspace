package com.team.webproject.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.json.simple.JSONObject;

import com.team.webproject.dto.ShowDTO;

@Mapper
public interface AddPerformance {
	
	List<ShowDTO> getAllShow();
	
	int addShow(ShowDTO show);

	
}
